import 'package:ipoanki/app/common/helpers/debouncer_helper.dart';
import 'package:ipoanki/app/modules/search/domain/usecases/get_phrases_usecase.dart';
import 'package:ipoanki/app/modules/search/presentation/stores/search_store.dart';

class SearchController {
  final GetPhrasesUsecase getPhrasesUsecase;
  final SearchStore store;
  late DebaucerHelper debaucer;

  SearchController({
    required this.getPhrasesUsecase,
    required this.store,
  }) {
    debaucer = DebaucerHelper(millisenconds: 1200);
  }

  void searchByInputText(String textSearch) {
    store.setMessage(null);
    store.showButtonSearchBar();
    if (textSearch.length < 2) return;
    store.setLoading();
    debaucer.call(() => getPhrasesByWord(word: textSearch));
  }

  Future<void> getPhrasesByWord({
    required String word,
  }) async {
    final response = await getPhrasesUsecase.call(word: word);
    response.fold((l) {
      store.setMessage('Ops! Server currently unreachable');
      store.cleanListPhrases();
    }, (listPhrases) {
      if (listPhrases.isEmpty) store.setMessage('Ops! \nNo result found :(');
      store.setListPhrases(listPhrases);
    });
    store.setSearch(word);
    store.setLoading(load: false);
  }
}
