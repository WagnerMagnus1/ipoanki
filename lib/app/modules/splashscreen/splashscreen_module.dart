import 'package:flutter_modular/flutter_modular.dart';
import 'package:ipoanki/app/modules/splashscreen/presentation/pages/splash/splashscreen_controller.dart';
import 'package:ipoanki/app/modules/splashscreen/presentation/pages/splash/splashscreen_page.dart';

class SplashscreenModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashscreenController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const SplashscreenPage(),
        ),
      ];
}
