import 'package:fpdart/fpdart.dart';
import 'package:ipoanki/app/modules/search/domain/entities/phrase_entity.dart';

import '../repositories/search_repository_interface.dart';


class GetPhrasesUsecase {
  final ISearchRepository repository;

  GetPhrasesUsecase({
    required this.repository,
  });
  Future<Either<String, List<PhraseEntity>>> call({
    required String word,
  }) {
    return repository.getPhrasesByWord(word: word);
  }
}
