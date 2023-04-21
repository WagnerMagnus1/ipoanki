import 'package:fpdart/fpdart.dart';
import 'package:ipoanki/app/modules/search/domain/entities/dictionary_entity.dart';
import 'package:ipoanki/app/modules/search/domain/entities/phrase_entity.dart';

abstract class ISearchRepository {
  Future<Either<String, List<PhraseEntity>>> getPhrasesByWord({
    required String word,
  });
  Future<Either<String, DictionaryEntity>> consultDictionaryByWord({
    required String word,
  });
}
