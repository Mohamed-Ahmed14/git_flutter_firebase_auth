import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper{

  static SharedPreferences? prefs;

  static init () async{
    prefs =await SharedPreferences.getInstance();
  }

  static Future<void> set({required String key,required dynamic value}) async{
      if(value is int){
        await prefs?.setInt(key, value);
      }else if(value is double){
        await prefs?.setDouble(key, value);
      }else if(value is bool){
        await prefs?.setBool(key, value);
      }else if(value is String){
        await prefs?.setString(key, value);
      }else if(value is List<String>){
        await prefs?.setStringList(key, value);
      }
  }

  //read data
  static  get({required String key}){
    return prefs?.get(key);
  }

  //remove data
  static remove({required String key}) async{
    await prefs?.remove(key);
  }

  //clear data
  static clear() async{
    await prefs?.clear();
  }




}