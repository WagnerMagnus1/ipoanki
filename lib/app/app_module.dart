import 'package:flutter_modular/flutter_modular.dart';

import 'modules/search/search_module.dart';
import 'modules/splashscreen/splashscreen_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashscreenModule()),
    ModuleRoute('/search', module: SearchModule()),
  ];
}
