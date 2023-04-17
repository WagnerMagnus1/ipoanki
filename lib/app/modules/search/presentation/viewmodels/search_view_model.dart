import '../../domain/entities/phrase_entity.dart';

class SearchViewModel {
  final bool loading;
  final String? message;
  final List<PhraseEntity> listPhrases;
  final String? lastWordSearched;
  final bool showButtonCloseFromSearchBar;

  SearchViewModel({
    this.loading = false,
    this.listPhrases = const [],
    this.lastWordSearched,
    this.showButtonCloseFromSearchBar = false,
    this.message,
  });

  SearchViewModel copyWith({
    bool? loading,
    List<PhraseEntity>? listPhrases,
    String? lastWordSearched,
    bool? showButtonCloseFromSearchBar,
    final String? message,
  }) {
    return SearchViewModel(
      loading: loading ?? this.loading,
      listPhrases: listPhrases ?? this.listPhrases,
      lastWordSearched: lastWordSearched ?? this.lastWordSearched,
      showButtonCloseFromSearchBar:
          showButtonCloseFromSearchBar ?? this.showButtonCloseFromSearchBar,
      message: message ?? this.message,
    );
  }
}
