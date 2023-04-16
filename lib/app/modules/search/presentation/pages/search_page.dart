import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../common/theme/app_colors.dart';
import 'search_controller.dart';

import '../../../../common/helpers/assets_path_helper.dart';
import '../../../../common/widgets/state_controller.dart';

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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ipoanki',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.kanit(
                              color: AppColors.light, fontSize: 20),
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: AppColors.primaryColor,
                            ),
                            child: TextField(
                              onTap: () {
                                if (focusNode.hasFocus) return;
                                scrollController.animateTo(
                                  scrollController.position.maxScrollExtent,
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.fastOutSlowIn,
                                );
                              },
                              controller: textController,
                              focusNode: focusNode,
                              onTapOutside: (_) {
                                focusNode.unfocus();
                                scrollController.animateTo(
                                  0,
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.fastOutSlowIn,
                                );
                              },
                              style: const TextStyle(color: AppColors.dark),
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: AppColors.gray,
                                ),
                                suffixIcon: Icon(
                                  Icons.cancel,
                                  color: AppColors.gray,
                                ),
                                hintStyle: TextStyle(
                                  color: AppColors.gray,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide.none),
                                hintText: 'Search',
                                focusColor: AppColors.dark0,
                                focusedBorder: OutlineInputBorder(
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your English is',
                                    style: GoogleFonts.judson(
                                        color: AppColors.gray1, fontSize: 12),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Loading...',
                                    style: GoogleFonts.akshar(
                                        color: AppColors.gray1,
                                        fontSize: 32,
                                        letterSpacing: 1.6,
                                        shadows: [
                                          Shadow(
                                              color: AppColors.dark0
                                                  .withOpacity(0.25),
                                              blurRadius: 4,
                                              offset: const Offset(0, 4))
                                        ]),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'AMAZING',
                                    style: GoogleFonts.judson(
                                        color: AppColors.gray1, fontSize: 12),
                                  ),
                                ],
                              ),
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
          ],
        ));
  }
}
