part of 'vocabulary_cubit.dart';

@immutable
abstract class VocabularyState {}

class VocabularyInitial extends VocabularyState {}
class VocabularyLoadingState extends VocabularyState {}
class VocabularyErrorState extends VocabularyState{}

class VocabularyLoadedState extends VocabularyState{
  final List<Vocabulary> vocabularies;
  VocabularyLoadedState(this.vocabularies);
}
