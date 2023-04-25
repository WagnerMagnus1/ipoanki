import 'package:faker/faker.dart';
import 'package:ipoanki/app/common/extensions/string_extension.dart';
import 'package:web_scraper/web_scraper.dart';

import '../../../../../common/constants/constants.dart';
import '../../infra/datasources/search_datasource_interface.dart';
import '../../models/dictionary_model.dart';
import '../../models/phrase_model.dart';

class SearchDatasource implements ISearchDataSource {
  final WebScraper webScraper;

  SearchDatasource({
    required this.webScraper,
  });

  @override
  Future<List<PhraseModel>> getPhrasesByWord({
    required String word,
  }) async {
    webScraper.baseUrl = Constants.urlDomainToGetPhrases;
    webScraper.userAgent = faker.internet.userAgent(osName: 'iOS');
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
        final link = 'https://youglish.com/getbyid/$id/$wordSearched/english/us?';
        listPhraseModel.add(PhraseModel(
          phrase: phrase,
          link: link,
        ));
      }
    }

    return listPhraseModel;
  }

  @override
  Future<DictionaryModel> consultDictionaryByWord({
    required String word,
  }) async {
    webScraper.baseUrl = Constants.urlDomainToDictionaryEnglish;
    webScraper.userAgent = faker.internet.userAgent(osName: 'iOS');
    if (!await webScraper.loadWebPage('/dictionary/english/$word?q=$word')) {
      throw Exception('${Constants.urlDomainToDictionaryEnglish} issues!');
    }
    final label = webScraper.getElement('span.pos.dpos', []);
    final listMeaning = webScraper.getElement('div.def.ddef_d.db', []);
    final listExamples = webScraper.getElement('div.examp.dexamp', []);

    return DictionaryModel(
      label: label[0]['title'].toString().capitalize(),
      listMeaning: listMeaning
          .map((e) => e['title']
              .toString()
              .replaceAll(': ', '')
              .replaceAll(RegExp('\\n+'), '')
              .capitalize()
              .replaceAll('  ', ' ')
              .trim())
          .take(5)
          .toList(),
      listExamples: listExamples
          .map((e) => e['title'].toString().capitalize().trim())
          .take(3)
          .toList(),
    );
  }
}
