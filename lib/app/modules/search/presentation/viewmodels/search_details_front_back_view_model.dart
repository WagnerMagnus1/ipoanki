import 'package:ipoanki/app/common/extensions/string_extension.dart';
import 'package:ipoanki/app/modules/search/presentation/viewmodels/search_details_view_model.dart';

import '../../../../common/stores/base/view_model_interface.dart';
import '../../domain/entities/dictionary_entity.dart';

class SearchDetailsFrontBackViewModel extends IViewModel {
  final DictionaryEntity? dictionaryEntity;

  SearchDetailsFrontBackViewModel({
    super.loading,
    super.message,
    this.dictionaryEntity,
  });

  SearchDetailsFrontBackViewModel copyWith({
    DictionaryEntity? dictionaryEntity,
    String? message,
    bool? loading,
  }) {
    return SearchDetailsFrontBackViewModel(
      loading: loading ?? this.loading,
      message: message ?? this.message,
      dictionaryEntity: dictionaryEntity ?? this.dictionaryEntity,
    );
  }

  String formattedComplementSentence(
      SearchDetailsViewModel searchDetailsViewModel) {
    return '''
${searchDetailsViewModel.word.capitalize()}: ${dictionaryEntity?.label}

Meanings:\n
${dictionaryEntity?.listMeaning.map((e) => e.capitalize()).join('\n')}

Examples:\n
${dictionaryEntity?.listExamples.map((e) {
      final text = '-${e.capitalize()}';
      return text;
    }).join('\n')}
\n\n
${searchDetailsViewModel.phrase.link}
''';
  }
}
