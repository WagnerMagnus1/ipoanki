import 'package:asuka/asuka.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ipoanki/app/common/adapters/alerts/show_alert_adapter.dart';
import 'package:ipoanki/app/modules/splashscreen/splashscreen_module.dart';

import 'common/adapters/alerts/show_alert_adapter_interface.dart';
import 'modules/search/search_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
        // Bind.lazySingleton<IShowAlertAdapter>((i) => (Widget child) {
        // }),
          
    // Bind.lazySingleton<IShowAlertAdapter>((i) => ShowAlertAdapter(functionSnackBar: Asuka.showSnackBar() ))
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashscreenModule()),
    ModuleRoute('/search', module: SearchModule()),
  ];
}
