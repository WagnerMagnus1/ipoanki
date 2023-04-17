import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipoanki/app/common/extensions/string_extension.dart';
import 'package:ipoanki/app/common/theme/app_colors.dart';

class PhrasesListWidget extends StatelessWidget {
  String text;
  final String textToBold;

  PhrasesListWidget({
    super.key,
    required this.text,
    required this.textToBold,
  }) {
    text = text.capitalize().replaceAll('/','').replaceAll('\\','');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: AppColors.elementText2,
                  blurRadius: 4,
                  offset: Offset(0, 4))
            ],
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.elementText0,
                AppColors.elementText1,
              ],
            )),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text.rich(TextSpan(
                    children: text
                        .split(' ')
                        .map(
                          (e) => TextSpan(
                            text: '$e ',
                            style: GoogleFonts.crimsonPro().copyWith(
                                fontSize: 16,
                                color: AppColors.secondaryColor,
                                fontWeight: e.toLowerCase().contains(textToBold.toLowerCase())
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        )
                        .toList())),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 38,
                  width: 38,
                  decoration: const BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.elementText2,
                        blurRadius: 20,
                      )
                    ],
                  ),
                  child: const Center(
                    child: CircleAvatar(
                      backgroundColor: AppColors.purple,
                      radius: 15,
                      child: Icon(
                        Icons.link,
                        color: AppColors.light,
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
