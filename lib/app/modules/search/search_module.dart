import 'package:flutter_modular/flutter_modular.dart';
import 'package:ipoanki/app/modules/search/presentation/pages/search_controller.dart';
import 'package:ipoanki/app/modules/search/presentation/pages/search_page.dart';

class SearchModule extends Module{

  @override
  List<Bind> get binds => [
    Bind((i) => SearchController())
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const SearchPage(),
        ),
      ];
}