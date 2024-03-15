import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:muaz_app/models/Vedios/Vedios_request.dart';
import 'package:muaz_app/models/Vedios/Vedios_response.dart';
import 'package:muaz_app/models/Vedios/userVideo_response.dart';

class APISERVICE_Vedios {
  //get vedios by type and kind : !!not revision!!
 static Future<VediosResponse> GetVedios (VediosRequest model) async {
   Map<String,String> requestHeaders = {
     'Content-Type' : 'application/json',
   };

   var url = Uri.parse('https://muaz-website.com/v1/vedios');
   Response response = await post(url, headers: requestHeaders, body: jsonEncode(model.toJson()));
    print(response);
   return videoResponseJson(response.body);
 }

 //get revision videos
 static Future<VediosResponse> GetRevisionVedios (kind,  booknum, type) async {
     Map<String,String> requestHeaders = {
       'Content-Type' : 'application/json',
     };

     //body
     Map data = {};
     data['kind'] = kind;
     data['booknum'] = booknum;
     data['type'] = type;

     var url = Uri.parse('https://muaz-website.com/v1/vedios/revision');
     Response response = await post(url, headers: requestHeaders, body: jsonEncode(data));


     return videoResponseJson(response.body);

 }

 //order video
 static Future OrderBook (String kind, String booknum, String price, String userId) async {
   try{
     //headers
     Map<String,String> requestHeaders = {
       'Content-Type' : 'application/json',
     };
     //body
     Map data = {};
     data['kind'] = kind;
     data['booknum'] = booknum;
     data['userId'] = userId;
     data['price'] = price;
     //post to server
     var url = Uri.parse('https://muaz-website.com/v1/orders/order-book');
     Response response = await post(url, headers: requestHeaders, body: jsonEncode(data));

     return response.body;
   } on SocketException {
     return 'no internet connection';
   }catch (e) {
    return e;
   }
 }

 //order revision special video
 static Future OrderSpecialBook ( String price, String userId) async {
   try{
     //headers
     Map<String,String> requestHeaders = {
       'Content-Type' : 'application/json',
     };
     //body
     Map data = {};
     data['userId'] = userId;
     data['price'] = price;
     //post to server
     var url = Uri.parse('https://muaz-website.com/v1/orders//special-book');
     Response response = await post(url, headers: requestHeaders, body: jsonEncode(data));

     return response.body;
   } on SocketException {
     return 'no internet connection';
   }catch (e) {
     return e;
   }
 }

 //get user videos
 static Future<UserVideosResponse> UserVideos (String userId, String booknum, String kind) async {
   try{
     //headers
     Map<String,String> requestHeaders = {
       'Content-Type' : 'application/json',
     };
     //body
     Map data = {};
     data['userId'] = userId;
     data['booknum'] = booknum;
     data['kind'] = kind;
     //post to server
     var url = Uri.parse('https://muaz-website.com/v1/vedios/app/user-dashboard');
     Response response = await post(url, headers: requestHeaders, body: jsonEncode(data));

     return userVideoResponseJson(response.body);
   } catch(e){
      throw e;
   }

 }

}