import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/theme/app_colors.dart';

class TextCustomWidget extends StatelessWidget {
  final String text;
  const TextCustomWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            text,
            style: GoogleFonts.akshar(
                color: AppColors.gray1,
                fontSize: 32,
                letterSpacing: 1.6,
                shadows: [
                  Shadow(
                      color: AppColors.dark0.withOpacity(0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4))
                ]),
          ),
        ),
      ],
    );
  }
}
