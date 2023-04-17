import 'package:flutter_modular/flutter_modular.dart';
import 'package:ipoanki/app/modules/search/data/external/datasources/search_datasource.dart';
import 'package:ipoanki/app/modules/search/data/infra/repositories/search_repository.dart';
import 'package:ipoanki/app/modules/search/domain/usecases/get_phrases_usecase.dart';
import 'package:ipoanki/app/modules/search/presentation/pages/search_controller.dart';
import 'package:ipoanki/app/modules/search/presentation/pages/search_page.dart';
import 'package:web_scraper/web_scraper.dart';

import '../../common/constants/constants.dart';
import 'presentation/stores/search_store.dart';

class SearchModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => SearchController(
              getPhrasesUsecase: i(),
              store: i(),
            )),
        Bind.lazySingleton((i) => GetPhrasesUsecase(repository: i())),
        Bind.lazySingleton((i) => SearchRepository(dataSource: i())),
        Bind.lazySingleton((i) => SearchDatasource(webScraper: i())),
        Bind.lazySingleton((i) => WebScraper(Constants.urlDomainToGetPhrases)),
        Bind.lazySingleton((i) => SearchStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const SearchPage(),
        ),
      ];
}
