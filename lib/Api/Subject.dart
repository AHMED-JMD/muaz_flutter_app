import 'dart:convert';
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

   return videoResponseJson(response.body);
 }

 //order video
 static Future<String> OrderBook (String kind, String booknum, String userId) async {
   //headers
   Map<String,String> requestHeaders = {
     'Content-Type' : 'application/json',
   };
   //body
   Map data = {};
   data['kind'] = kind;
   data['booknum'] = booknum;
   data['userId'] = userId;
   //post to server
   var url = Uri.parse('https://muaz-website.com/v1/orders/order-book');
   Response response = await post(url, headers: requestHeaders, body: jsonEncode(data));

   return response.body;
 }

 //get user videos
 static Future<UserVideosResponse> UserVideos (String userId, String booknum) async {
   try{
     //headers
     Map<String,String> requestHeaders = {
       'Content-Type' : 'application/json',
     };
     //body
     Map data = {};
     data['booknum'] = booknum;
     data['userId'] = userId;
     //post to server
     var url = Uri.parse('https://muaz-website.com/v1/vedios/app/user-dashboard');
     Response response = await post(url, headers: requestHeaders, body: jsonEncode(data));

     return userVideoResponseJson(response.body);
   } catch(e){
      throw e;
   }

 }

}