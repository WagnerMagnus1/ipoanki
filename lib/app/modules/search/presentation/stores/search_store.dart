import 'package:flutter/material.dart';
import 'package:ipoanki/app/modules/search/domain/entities/phrase_entity.dart';
import '../viewmodels/search_view_model.dart';

class SearchStore extends ValueNotifier<SearchViewModel> {
  SearchStore() : super(SearchViewModel());

  void setLoading({
    bool load = true,
  }) {
    value = value.copyWith(loading: load);
  }

  void setSearch(String text) {
    value = value.copyWith(lastWordSearched: text);
  }

  void setListPhrases(List<PhraseEntity> listPhrases) {
    value = value.copyWith(listPhrases: listPhrases);
  }

  void cleanListPhrases() {
    value = value.copyWith(listPhrases: null);
  }

  void showButtonSearchBar({bool isShowButton = true}) {
    value = value.copyWith(showButtonCloseFromSearchBar: isShowButton);
  }

  void setMessage(String? message) {
    value =value.copyWith(message: message);
  }
}
