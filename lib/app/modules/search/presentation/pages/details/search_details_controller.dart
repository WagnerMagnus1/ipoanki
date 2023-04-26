import 'package:ipoanki/app/modules/search/domain/usecases/dictionary_english_usecase.dart';
import 'package:ipoanki/app/modules/search/presentation/stores/search_details_store.dart';

class SearchDetailsController {
  final DictionaryEnglishUsecase dictionaryEnglishUsecase;
  final SearchDetailsStore searchDetailsStore;

  SearchDetailsController({
    required this.dictionaryEnglishUsecase,
    required this.searchDetailsStore,
  }) {
    searchDetailsStore.setLoading(load: true);
    searchDetailsStore.setMessage(null);
    searchDetailsStore.cleanDictionary();
  }

  Future<void> accessDictionary({
    required String word,
  }) async {
    final result = await dictionaryEnglishUsecase.call(word: word);
    searchDetailsStore.setLoading(load: false);
    result.fold((error) {
      searchDetailsStore.setMessage('Ops! \nNo meaning result found :(');
    }, (dictionary) {
      searchDetailsStore.setMessage(null);
      searchDetailsStore.setDictionary(dictionary);
    });
  }
}
