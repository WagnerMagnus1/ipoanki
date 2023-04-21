import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/helpers/assets_path_helper.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/state_controller.dart';
import '../../domain/entities/phrase_entity.dart';
import '../stores/search_store.dart';
import '../viewmodels/search_view_model.dart';
import '../widgets/phrases_list_widget.dart';
import '../widgets/text_custom_widget.dart';
import 'search_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends StateController<SearchPage, SearchController> {
  late TextEditingController textController;
  final FocusNode focusNode = FocusNode();
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparent,
          toolbarHeight: 110,
          title: Stack(
            children: [
              Center(
                child: SearchBarInputWidget(
                  onChanged: controller.searchByInputText,
                  focusNode: focusNode,
                  scrollController: scrollController,
                  millisecondsToScrollAnimated: 1200,
                  textController: textController,
                  searchStore: controller.store,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.58),
                    controller: scrollController,
                    child: Column(
                      children: [
                        Image.asset(
                          AssetsPathHelper.castleImage,
                          gaplessPlayback: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ValueListenableBuilder(
                                  valueListenable: controller.store,
                                  builder: (context, store, _) {
                                    return SearchStatusHeaderWidget(
                                      listPhrases: store.listPhrases,
                                      loading: store.loading,
                                      lastWordSearched: store.lastWordSearched,
                                      message: store.message,
                                    );
                                  }),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Image.asset(
                                  AssetsPathHelper.tribe,
                                  scale: 1.7,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                heightFactor: 0.58,
                child: ValueListenableBuilder(
                    valueListenable: controller.store,
                    builder: (context, store, _) {
                      return Visibility(
                        visible: !store.loading,
                        child: ListView.builder(
                            primary: true,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                              top: 30,
                              left: 24,
                              right: 24,
                              bottom: 50,
                            ),
                            itemCount: store.listPhrases.length,
                            itemBuilder: (context, index) {
                              final phrase = store.listPhrases[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: GestureDetector(
                                  onTap: () async {
                                    controller.navigateToDetailsPage(phrase);
                                  },
                                  child: PhrasesListWidget(
                                    text: phrase.phrase,
                                    textToBold: store.lastWordSearched ?? '',
                                    showCircleAvatar: true,
                                     capitalizeAnyPhrasesByDefault: true,
                                  ),
                                ),
                              );
                            }),
                      );
                    }),
              ),
            ),
          ],
        ));
  }
}

class SearchBarInputWidget extends StatelessWidget {
  final void Function(String)? onChanged;
  final SearchStore searchStore;

  const SearchBarInputWidget({
    super.key,
    this.onChanged,
    required this.searchStore,
    required this.focusNode,
    required this.scrollController,
    required this.millisecondsToScrollAnimated,
    required this.textController,
  });

  final FocusNode focusNode;
  final ScrollController scrollController;
  final int millisecondsToScrollAnimated;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ipoanki',
              textAlign: TextAlign.center,
              style: GoogleFonts.kanit(color: AppColors.light, fontSize: 20),
            ),
          ],
        ),
        Column(
          children: [
            const SizedBox(height: 15),
            FractionallySizedBox(
              widthFactor: 0.88,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: AppColors.primaryColor,
                ),
                child: TextField(
                  onChanged: onChanged,
                  onTap: () {
                    if (focusNode.hasFocus ||
                        searchStore.value.listPhrases.isNotEmpty) {
                      return;
                    }
                    scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration:
                          Duration(milliseconds: millisecondsToScrollAnimated),
                      curve: Curves.fastOutSlowIn,
                    );
                  },
                  controller: textController,
                  focusNode: focusNode,
                  onTapOutside: (_) {
                    focusNode.unfocus();
                    if (searchStore.value.listPhrases.isNotEmpty) {
                      return;
                    }
                    scrollController.animateTo(
                      0,
                      duration:
                          Duration(milliseconds: millisecondsToScrollAnimated),
                      curve: Curves.fastOutSlowIn,
                    );
                  },
                  style: const TextStyle(color: AppColors.dark),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.gray,
                    ),
                    suffixIcon: ValueListenableBuilder<SearchViewModel>(
                        valueListenable: searchStore,
                        builder: (context, store, _) {
                          return Visibility(
                            visible:
                                searchStore.value.showButtonCloseFromSearchBar,
                            child: IconButton(
                              icon: const Icon(Icons.cancel),
                              onPressed: () {
                                textController.text = '';
                                searchStore.showButtonSearchBar(
                                  isShowButton: false,
                                );
                              },
                              color: AppColors.gray,
                            ),
                          );
                        }),
                    hintStyle: const TextStyle(
                      color: AppColors.gray,
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none),
                    hintText: 'Search',
                    focusColor: AppColors.dark0,
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SearchStatusHeaderWidget extends StatelessWidget {
  final List<PhraseEntity> listPhrases;
  final bool loading;
  final String? lastWordSearched;
  final String? message;

  const SearchStatusHeaderWidget({
    super.key,
    required this.listPhrases,
    required this.loading,
    required this.lastWordSearched,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  listPhrases.isNotEmpty
                      ? 'You searched by'
                      : 'Your English is',
                  style: GoogleFonts.judson(
                    color: AppColors.gray1,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          TextCustomWidget(
            text: !loading && listPhrases.isNotEmpty
                ? '“$lastWordSearched“'
                : message ?? 'Loading...',
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: listPhrases.isEmpty && message == null,
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    'AMAZING',
                    style: GoogleFonts.judson(
                      color: AppColors.gray1,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
