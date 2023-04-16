import 'package:ipoanki/app/modules/search/domain/entities/phrase_entity.dart';

class PhraseModel extends PhraseEntity {
  PhraseModel({
    required super.link,
    required super.phrase,
  });

  factory PhraseModel.fromJson(Map<String, dynamic> json) {
    return PhraseModel(
      phrase: json['json'],
      link: json['json'],
    );
  }
}
