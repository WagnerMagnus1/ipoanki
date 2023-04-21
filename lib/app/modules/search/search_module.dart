import 'package:flutter_modular/flutter_modular.dart';
import 'domain/usecases/dictionary_english_usecase.dart';
import 'presentation/pages/details/search_details_page.dart';
import 'presentation/stores/search_details_store.dart';
import 'package:web_scraper/web_scraper.dart';

import 'data/external/datasources/search_datasource.dart';
import 'data/infra/repositories/search_repository.dart';
import 'domain/usecases/get_phrases_usecase.dart';
import 'presentation/pages/details/search_details_controller.dart';
import 'presentation/pages/search_controller.dart';
import 'presentation/pages/search_page.dart';
import 'presentation/stores/search_store.dart';

class SearchModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => SearchController(
              getPhrasesUsecase: i(),
              store: i(),
            )),
        Bind.lazySingleton((i) => SearchDetailsController(
              dictionaryEnglishUsecase: i(),
              searchDetailsStore: i(),
            )),
        Bind.lazySingleton((i) => GetPhrasesUsecase(repository: i())),
        Bind.lazySingleton((i) => DictionaryEnglishUsecase(repository: i())),
        Bind.lazySingleton((i) => SearchRepository(dataSource: i())),
        Bind.lazySingleton((i) => SearchDatasource(webScraper: i())),
        Bind.lazySingleton((i) => WebScraper()),
        Bind.lazySingleton((i) => SearchStore()),
        Bind.lazySingleton((i) => SearchDetailsStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, args) => const SearchPage()),
        ChildRoute(
          '/details',
          child: (context, args) => SearchDetailsPage(
            searchDetailsViewModel: args.data,
          ),
        ),
      ];
}
