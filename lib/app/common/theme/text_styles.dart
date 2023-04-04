import 'package:flutter/material.dart';

import 'app_colors.dart';

mixin TextStyles {
  static const double _fontSizeH1 = 48;
  static const double _fontSizeH2 = 40;
  static const double _fontSizeH3 = 33;
  static const double _fontSizeH4 = 27;
  static const double _fontSizeH5 = 23;
  static const double _fontSizeH6 = 19;
  static const double _fontSizeParagrapy = 16;
  static const double _fontSizeSmall = 14;

  static TextStyle megaTitle = TextStyle(
    shadows: [
      Shadow(
        color: AppColors.dark.withOpacity(0.4),
        offset: const Offset(0, 5),
        blurRadius: 4,
      ),
    ],
    color: AppColors.light,
    fontFamily: 'Guy',
    fontSize: _fontSizeH3,
  );

  static const TextStyle h1Heading = TextStyle(
    fontFamily: 'Roboto',
    fontSize: _fontSizeH1,
  );

  static TextStyle h1HeadingBold =
      h1Heading.copyWith(fontWeight: FontWeight.bold);

  static const TextStyle h2Heading = TextStyle(
    fontFamily: 'Roboto',
    fontSize: _fontSizeH2,
  );

  static TextStyle h2HeadingBold =
      h2Heading.copyWith(fontWeight: FontWeight.bold);

  static const TextStyle h3Heading = TextStyle(
    fontFamily: 'Roboto',
    fontSize: _fontSizeH3,
  );

  static TextStyle h3HeadingBold =
      h3Heading.copyWith(fontWeight: FontWeight.bold);

  static const TextStyle h4Heading = TextStyle(
    fontFamily: 'Roboto',
    fontSize: _fontSizeH4,
  );

  static TextStyle h4HeadingBold =
      h4Heading.copyWith(fontWeight: FontWeight.bold);

  static const TextStyle h5Heading = TextStyle(
    fontFamily: 'Roboto',
    fontSize: _fontSizeH5,
  );

  static TextStyle h5HeadingBold =
      h5Heading.copyWith(fontWeight: FontWeight.bold);

  static const TextStyle h6Heading = TextStyle(
    fontFamily: 'Roboto',
    fontSize: _fontSizeH6,
  );

  static TextStyle h6HeadingBold =
      h6Heading.copyWith(fontWeight: FontWeight.bold);

  static const TextStyle paragraph = TextStyle(
    fontFamily: 'Roboto',
    fontSize: _fontSizeParagrapy,
  );

  static TextStyle paragraphBold =
      paragraph.copyWith(fontWeight: FontWeight.bold);

  static const TextStyle small = TextStyle(
    fontFamily: 'Roboto',
    fontSize: _fontSizeSmall,
  );

  static TextStyle smallBold = small.copyWith(fontWeight: FontWeight.bold);
}
