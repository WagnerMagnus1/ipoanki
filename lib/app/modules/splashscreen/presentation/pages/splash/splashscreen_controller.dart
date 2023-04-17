import 'package:flutter_modular/flutter_modular.dart';

class SplashscreenController {

  void navigateToSearch() {
    Modular.to.pushReplacementNamed('/search/');
  }
}
