import 'package:ipoanki/app/modules/search/domain/usecases/get_phrases_usecase.dart';

class SearchController {
  final GetPhrasesUsecase getPhrasesUsecase;

  SearchController({
    required this.getPhrasesUsecase,
  }) {
    getPhrasesByWord();
  }

  Future<void> getPhrasesByWord() async {
    final response = await getPhrasesUsecase.call(word: 'car');
    response.fold((l) => null, (listPhrases) {
      final data = listPhrases;
    });
  }
}
