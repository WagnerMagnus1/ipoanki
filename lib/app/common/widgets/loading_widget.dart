import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../modules/search/presentation/widgets/text_custom_widget.dart';
import '../theme/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          child: TextCustomWidget(
            text: 'Loading',
          ),
        ),
        Flexible(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: AppColors.secondaryColor,
            size: 50,
          ),
        ),
      ],
    );
  }
}
