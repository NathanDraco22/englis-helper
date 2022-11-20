


import 'package:english_helper/data/adapters/db_adapter.dart';
import 'package:english_helper/domain/models/vocabulary.dart';

class VocabularyRepo {

  final DbAdapter dbAdapter;

  VocabularyRepo(this.dbAdapter);

  List<Vocabulary> vocabularies = [];

  Future<List<Vocabulary>> getAllVocabulary() async {
    final result = await dbAdapter.find();
    final models = result.map((e) => Vocabulary.fromJsonMap(e)).toList();
    vocabularies = models;
    return models;
  }

  Future<List<Vocabulary>> createVocabulary( Vocabulary vocabulary ) async {
    final result = await dbAdapter.create(vocabulary.word, vocabulary.toJsonMap());
    if(!result) throw Exception("Cant'saved");
    vocabularies.add(vocabulary);
    return vocabularies;
  }

  Future<List<Vocabulary>> deleteVocabulary( Vocabulary vocabulary) async {
    final result = await dbAdapter.delete(vocabulary.word);
    if(!result) throw Exception("Cant'deleted");
    vocabularies.removeWhere((element) => element.word == vocabulary.word);
    return vocabularies;
  }

}



