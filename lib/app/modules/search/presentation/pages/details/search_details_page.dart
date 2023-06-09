import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../common/widgets/copy_text_widget.dart';
import '../../widgets/phrases_list_widget.dart';
import '../../../../../common/extensions/string_extension.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/widgets/loading_widget.dart';
import '../../../../../common/widgets/state_controller.dart';
import '../../viewmodels/search_details_view_model.dart';
import '../../widgets/text_custom_widget.dart';
import 'search_details_controller.dart';

class SearchDetailsPage extends StatefulWidget {
  final SearchDetailsViewModel searchDetailsViewModel;

  const SearchDetailsPage({
    super.key,
    required this.searchDetailsViewModel,
  });

  @override
  State<SearchDetailsPage> createState() => _SearchDetailsPageState();
}

class _SearchDetailsPageState
    extends StateController<SearchDetailsPage, SearchDetailsController> {
  @override
  void initState() {
    super.initState();
    controller.accessDictionary(word: widget.searchDetailsViewModel.word);
  }

  @override
  void dispose() {
    controller.searchDetailsStore.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.searchDetailsViewModel.word.capitalize(),
          textAlign: TextAlign.center,
          style: GoogleFonts.kanit(color: AppColors.primaryColor, fontSize: 20),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 24,
        ),
        child: SingleChildScrollView(
            child: Column(
          children: [
            const TextCustomWidget(
              text: 'Front:',
            ),
            const SizedBox(height: 10),
            CopyTextWidget(
              text: widget.searchDetailsViewModel.phrase.phrase
                  .replaceAll("\\'", "'")
                  .capitalize(),
              child: PhrasesListWidget(
                text: widget.searchDetailsViewModel.phrase.phrase,
                textToBold: widget.searchDetailsViewModel.word,
              ),
            ),
            const SizedBox(height: 50),
            ValueListenableBuilder(
              valueListenable: controller.searchDetailsStore,
              builder: (context, searchDetailsStore, _) {
                if (searchDetailsStore.message != null &&
                    !searchDetailsStore.loading) {
                  return PhrasesListWidget(
                    text: searchDetailsStore.message.toString(),
                    textToBold: searchDetailsStore.message.toString(),
                  );
                }
                if (searchDetailsStore.loading) {
                  return const Center(child: LoadingWidget());
                }
                return Visibility(
                  visible: searchDetailsStore.dictionaryEntity != null &&
                      !searchDetailsStore.loading,
                  child: CopyTextWidget(
                    text: searchDetailsStore.formattedComplementSentence(
                      widget.searchDetailsViewModel,
                    ),
                    child: Column(
                      children: [
                        const TextCustomWidget(
                          text: 'Back:',
                        ),
                        const SizedBox(height: 10),
                        PhrasesListWidget(
                          text: searchDetailsStore.formattedComplementSentence(
                            widget.searchDetailsViewModel,
                          ),
                          textToBold: widget.searchDetailsViewModel.word,
                          showCircleAvatar: false,
                          capitalizeAnyPhrasesByDefault: false,
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        )),
      ),
    );
  }
}
