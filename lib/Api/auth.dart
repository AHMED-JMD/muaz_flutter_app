import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:muaz_app/models/auth/Login_model.dart';
import 'package:muaz_app/models/auth/Login_response_model.dart';
import 'package:muaz_app/models/auth/Register_model.dart';
import 'package:muaz_app/models/auth/Register_response.dart';
import 'package:muaz_app/shared_services/SharedServices.dart';

class APISERVICE_Auth {
  //login function
 static Future<bool> Login (Login_Model model) async{
   try{

     Map<String,String> requestHeaders = {
       'Content-Type' : 'application/json'
     };

     var url = Uri.parse('https://muaz-website.com/users/auth');
     Response respone = await post(url, headers: requestHeaders, body: jsonEncode(model.toJson()));
     Map data = jsonDecode(respone.body);
     //check response ok
     if(respone.statusCode == 200){
       //SHARED SERVICE
       SharedServices.setLoginDetails(loginResponseJson(respone.body));
       return true;
     }else{
       return false;
     }
   } on SocketException {
     return false;
   }
 }

 //register
 static Future<dynamic> Register (RegisterModel model) async{
   try{
     Map<String,String> requestHeaders = {
       'Content-Type' : 'application/json'
     };

     var url = Uri.parse('https://muaz-website.com/users/register');
     Response respone = await post(url, headers: requestHeaders, body: jsonEncode(model.toJson()));
     Map data = jsonDecode(respone.body);

     return registerResponseJson(respone.body);
   } on SocketException {
     return 'error in connection';
   }
   catch (e){
     return e;
   }

 }

 //get user profile
 static Future<Map> GetUser () async{

   var loginDetails = await SharedServices.LoginDetails();
   print(loginDetails);

   Map<String,String> requestHeaders = {
     'Content-Type' : 'application/json',
     'x-auth-token' : '${loginDetails.token}'
   };

   var url = Uri.parse('https://muaz-website.com/users/auth/get-user');
   Response respone = await get(url, headers: requestHeaders);
   Map data = jsonDecode(respone.body);
   //check response ok
   if(respone.statusCode == 200){
     //SHARED SERVICE
     print(respone.body);
     return data;
   }else{
     return {};
   }
 }
}