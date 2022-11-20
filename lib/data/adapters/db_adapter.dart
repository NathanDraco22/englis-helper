

abstract class DbAdapter {

  Future<bool> create(String key ,Map<String,dynamic> data );
  Future<List<Map>> find();
  Future<Map> findById(String id);
  Future update(String id, Map<String,dynamic> data);
  Future<bool> delete( String id);
  Future<bool> deleteAll();


}


