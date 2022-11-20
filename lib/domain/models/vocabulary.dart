class Vocabulary {

  String word, pronounce, meaning, mind;

  Vocabulary({
    required this.word, 
    required this.pronounce, 
    required this.meaning, 
    required this.mind
  });

  factory Vocabulary.fromDefault() => Vocabulary(
    word: '', 
    pronounce: '', 
    meaning: '', 
    mind: ''
  );
  
  factory Vocabulary.fromJsonMap( Map jsonMap) => Vocabulary(
    word      : jsonMap['word'], 
    pronounce : jsonMap['pronounce'], 
    meaning   : jsonMap['meaning'], 
    mind      : jsonMap['mind']
  );

  Map<String,dynamic> toJsonMap() => {
    'word'      : word,
    'pronounce' : pronounce,
    'meaning'   : meaning,
    'mind'      : mind
  };


}

