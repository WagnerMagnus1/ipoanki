import 'package:flutter_modular/flutter_modular.dart';
import 'package:ipoanki/app/modules/search/data/external/datasources/search_datasource.dart';
import 'package:ipoanki/app/modules/search/data/infra/repositories/search_repository.dart';
import 'package:ipoanki/app/modules/search/domain/usecases/get_phrases_usecase.dart';
import 'package:ipoanki/app/modules/search/presentation/pages/search_controller.dart';
import 'package:ipoanki/app/modules/search/presentation/pages/search_page.dart';
import 'package:web_scraper/web_scraper.dart';

class SearchModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => SearchController(getPhrasesUsecase: i())),
        Bind((i) => GetPhrasesUsecase(repository: i())),
        Bind((i) => SearchRepository(dataSource: i())),
        Bind((i) => SearchDatasource(webScraper: i())),
        Bind((i) => WebScraper('https://youglish.com')),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const SearchPage(),
        ),
      ];
}
