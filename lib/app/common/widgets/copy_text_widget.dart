import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class CopyTextWidget extends StatelessWidget {
  final String text;
  final Widget child;

  const CopyTextWidget({
    super.key,
    required this.text,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Clipboard.setData(
          ClipboardData(text: text),
        );
        Asuka.showSnackBar(SnackBar(
          backgroundColor: AppColors.secondaryColor,
          content: Text(
            'Successfully copied text!',
            style: GoogleFonts.judson().copyWith(
              color: AppColors.light,
              fontSize: 18,
            ),
          ),
        ));
      },
      child: child,
    );
  }
}
