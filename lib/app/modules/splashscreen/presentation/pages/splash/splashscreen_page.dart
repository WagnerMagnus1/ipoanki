import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../common/helpers/assets_path_helper.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/theme/text_styles.dart';
import '../../../../../common/widgets/state_controller.dart';
import 'splashscreen_controller.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({super.key});
  @override
  SplashscreenPageState createState() => SplashscreenPageState();
}

class SplashscreenPageState
    extends StateController<SplashscreenPage, SplashscreenController>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
    );
    animation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(animationController);
    init();
  }

  Future init() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    await animationController.forward();
    Future.wait([loadImageBackground()]).then((value) {
      controller.navigateToSearch();
    });
  }

  Future<void> loadImageBackground() async {
    await precacheImage(
        const AssetImage(AssetsPathHelper.castleImage), context);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: AppColors.secondaryColor,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: AppColors.secondaryColor,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarColor: AppColors.secondaryColor,
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: AppColors.secondaryColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FadeTransition(
                      opacity: animation as Animation<double>,
                      child: AnimatedTextKit(
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TyperAnimatedText(
                            'IPOANKI',
                            speed: const Duration(milliseconds: 100),
                            textStyle: TextStyles.megaTitle,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
