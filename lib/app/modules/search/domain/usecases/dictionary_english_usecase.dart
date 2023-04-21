// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';
import 'package:ipoanki/app/modules/search/domain/entities/dictionary_entity.dart';

import '../repositories/search_repository_interface.dart';

class DictionaryEnglishUsecase {
  final ISearchRepository repository;

  DictionaryEnglishUsecase({
    required this.repository,
  });

  Future<Either<String, DictionaryEntity>> call({
    required String word,
  }) {
    return repository.consultDictionaryByWord(word: word.toLowerCase());
  }
}
