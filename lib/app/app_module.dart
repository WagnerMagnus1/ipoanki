import 'package:flutter_modular/flutter_modular.dart';
import 'package:ipoanki/app/modules/splashscreen/splashscreen_module.dart';

import 'modules/search/search_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashscreenModule()),
    ModuleRoute('/search', module: SearchModule()),
  ];
}
