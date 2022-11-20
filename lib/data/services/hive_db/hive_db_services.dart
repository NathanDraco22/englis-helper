import 'package:english_helper/data/adapters/db_adapter.dart';
import 'package:hive/hive.dart';

class HiveDBServices implements DbAdapter{

  final box = Hive.box<Map>("vocabulary");

  @override
  Future<bool> create(String key,Map<String, dynamic> data) async{
    if(box.keys.any((element) => element == key)){
      throw Exception("$key already exists");
    } 
    await box.put(key, data);
    return true;
  }

  @override
  Future<bool> delete(String key) async{
    await box.delete(key);
    return true;
  }

  @override
  Future<bool> deleteAll() async{
    await box.deleteAll([]);
    return true;
  }

  @override
  Future<List<Map>> find() async{
    try {
      final values = box.values;
      return values.toList();  
    } catch (e) {
      throw DataLayerException(e.toString());
    }
    

  }

  @override
  Future<Map> findById(String id) async {
    final result = box.get(id);
    if (result == null) return {};
    return result;
  }

  @override
  Future update(String id, Map<String,dynamic> data) async{
    await box.put(id, data);
  }

}


class DataLayerException implements Exception{

  final String msg;

  DataLayerException(this.msg);

  @override
  String toString() {
    return "DataLayerException : $msg";
  }

}



