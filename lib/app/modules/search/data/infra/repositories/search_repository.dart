import 'package:fpdart/fpdart.dart';
import 'package:web_scraper/web_scraper.dart';

import '../../../domain/entities/dictionary_entity.dart';
import '../../../domain/entities/phrase_entity.dart';
import '../../../domain/repositories/search_repository_interface.dart';
import '../datasources/search_datasource_interface.dart';

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

  @override
  Future<Either<String, DictionaryEntity>> consultDictionaryByWord({
    required String word,
    bool isFirstAttempt = true,
  }) async {
    try {
      final result = await dataSource.consultDictionaryByWord(word: word);
      return Right(result);
    } on WebScraperException catch (_) {
      if (!isFirstAttempt) {
        return Left("No results about $word, please try change it.");
      }
      isFirstAttempt = false;
      final wordFormatted = word.substring(0, word.length - 1);
      final result =
          await dataSource.consultDictionaryByWord(word: wordFormatted);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
