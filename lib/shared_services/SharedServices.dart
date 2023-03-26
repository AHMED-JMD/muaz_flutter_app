import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:muaz_app/models/auth/Login_response_model.dart';

class SharedServices {
  static Future<bool> isLoggedIn() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist('loginDetails');
    return isKeyExist;
  }
  //get key
  static Future<LoginResponseModel> LoginDetails() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist('loginDetails');

    if(isKeyExist){
      var cachedData = await APICacheManager().getCacheData('loginDetails');

      return loginResponseJson(cachedData.syncData);
      }else{
        return loginResponseJson('');
      }
  }
  //set key
  static Future<void> setLoginDetails(LoginResponseModel model) async {
    APICacheDBModel CachedDb = APICacheDBModel(
        key: 'loginDetails',
        syncData: jsonEncode(model.toJson())
    );
    await APICacheManager().addCacheData(CachedDb);
  }
  //logout
  static Future<void> logout (BuildContext context) async {
    await APICacheManager().deleteCache('loginDetails');

    Navigator.pushReplacementNamed(context, '/login');
  }

}