import 'package:ipoanki/app/modules/search/domain/entities/phrase_entity.dart';

class SearchDetailsViewModel {
  final PhraseEntity phrase;
  final String word;

  SearchDetailsViewModel({
    required this.phrase,
    required this.word,
  });
}
