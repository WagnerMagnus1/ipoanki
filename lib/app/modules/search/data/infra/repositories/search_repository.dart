import 'package:fpdart/src/either.dart';
import 'package:ipoanki/app/modules/search/data/infra/datasources/search_datasource_interface.dart';

import '../../../domain/entities/phrase_entity.dart';
import '../../../domain/repositories/search_repository_interface.dart';

class SearchRepository implements ISearchRepository {
  final ISearchDataSource dataSource;

  SearchRepository({
    required this.dataSource,
  });

  @override
  Future<Either<String, List<PhraseEntity>>> getPhrasesByWord({
    required String word,
  }) async {
    try {
      final result = await dataSource.getPhrasesByWord(word: word);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
