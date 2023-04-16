import 'package:ipoanki/app/modules/search/data/models/phrase_model.dart';

abstract class ISearchDataSource {
  Future<List<PhraseModel>> getPhrasesByWord({
    required String word,
  });
}
