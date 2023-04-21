import '../../../../common/stores/base/store_interface.dart';
import '../../domain/entities/dictionary_entity.dart';
import '../viewmodels/search_details_front_back_view_model.dart';

class SearchDetailsStore extends IStoreBase<SearchDetailsFrontBackViewModel> {
  SearchDetailsStore() : super(SearchDetailsFrontBackViewModel());

  void setLoading({
    bool load = true,
  }) {
    value = value.copyWith(loading: load);
  }

  void setMessage(String? message) {
    value = value.copyWith(message: message);
  }

  void setDictionary(DictionaryEntity? dictionaryEntity) {
    value = value.copyWith(dictionaryEntity: dictionaryEntity);
  }

  void cleanDictionary() {
    value = value.copyWith(dictionaryEntity: null);
  }

  void reset() {
    value = SearchDetailsFrontBackViewModel(
      dictionaryEntity: null,
      loading: true,
      message: null,
    );
  }
}
