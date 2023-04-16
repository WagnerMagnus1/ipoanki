import 'package:ipoanki/app/modules/search/data/infra/datasources/search_datasource_interface.dart';
import 'package:ipoanki/app/modules/search/data/models/phrase_model.dart';
import 'package:ipoanki/app/modules/search/domain/entities/phrase_entity.dart';

import 'package:fpdart/src/either.dart';
import 'package:web_scraper/web_scraper.dart';

import '../../../domain/repositories/search_repository_interface.dart';

class SearchDatasource implements ISearchDataSource {
  final WebScraper webScraper;

  SearchDatasource({
    required this.webScraper,
  });

  @override
  Future<List<PhraseModel>> getPhrasesByWord({
    required String word,
  }) async {
    webScraper.userAgent =
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36';
    await webScraper.loadWebPage('/pronounce/$word/english/us');
    final contentPage = webScraper.getPageContent();
    final response = await _scrapPhrases(
      content: contentPage,
      wordSearched: word,
    );
    return response;
  }

  Future<List<PhraseModel>> _scrapPhrases({
    required String content,
    required String wordSearched,
  }) async {
    RegExp expression = RegExp(r"(?<=params.jsonData)(.*)(?=}';)");
    RegExp expressionToGetPhrase = RegExp(r'(?<=:\\")(.*)(?=\\",\\"seg)');
    RegExp expressionToGetPhraseId =
        RegExp(r'(?<=cid\\":\\")(.*)(?=\\",\\"zon)');
    RegExpMatch? match = expression.firstMatch(content);
    final text = match?[0];
    final listText = text?.split('display');
    listText?.removeAt(0);
    List<PhraseModel> listPhraseModel = [];
    for (var text in listText ?? []) {
      var phrase = expressionToGetPhrase.firstMatch(text)?[0];
      var id = expressionToGetPhraseId.firstMatch(text)?[0];
      if (phrase != null && id != null) {
        final link = 'https://youglish.com/getbyid/$id/$wordSearched/english';
        listPhraseModel.add(PhraseModel(
          phrase: phrase,
          link: link,
        ));
      }
    }

    return listPhraseModel;
  }
}
