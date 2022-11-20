import 'package:english_helper/domain/models/vocabulary.dart';
import 'package:english_helper/domain/repositories/vocabulary_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'vocabulary_state.dart';

class VocabularyCubit extends Cubit<VocabularyState> {
  VocabularyCubit(this.vocabularyRepo) : super(VocabularyInitial());

  final VocabularyRepo vocabularyRepo;

  Future<void>getAllVocabularies() async {
    emit(VocabularyLoadingState());
    try {
      final result = await vocabularyRepo.getAllVocabulary();
      emit(VocabularyLoadedState(result));
    } catch (e) {
      emit(VocabularyErrorState());
    }
  }

  Future<void> createVocabulary( Vocabulary vocabulary )async{
    try {
      final result = await vocabularyRepo.createVocabulary(vocabulary);
      emit(VocabularyLoadedState(result));
    } catch (e) {
      emit(VocabularyErrorState());
    }
  }

  Future<void> deleteVocabulary( Vocabulary vocabulary )async{
    try {
      final result = await vocabularyRepo.deleteVocabulary(vocabulary);
      emit(VocabularyLoadedState(result));
    } catch (e) {
      emit(VocabularyErrorState());
    }
  }

}
