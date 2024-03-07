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
 static Future Login (Login_Model model) async{
   try{

     Map<String,String> requestHeaders = {
       'Content-Type' : 'application/json'
     };

     var url = Uri.parse('https://muaz-website.com/users/auth/app');
     Response respone = await post(url, headers: requestHeaders, body: jsonEncode(model.toJson()));
     Map data = jsonDecode(respone.body);
     //check response ok
     if(respone.statusCode == 200){
       //SHARED SERVICE
       SharedServices.setLoginDetails(loginResponseJson(respone.body));
       return true;
     }else{
       return data['msg'];
     }
   } on SocketException {
     return 'check your internet connection';
   } catch(e){
     print(e);
   }
 }

 //register
 static Future<dynamic> Register (RegisterModel model) async{
   try{
     Map<String,String> requestHeaders = {
       'Content-Type' : 'application/json'
     };
//192.168.224.109
     var url = Uri.parse('https://muaz-website.com/users/register/app');
     Response respone = await post(url, headers: requestHeaders, body: jsonEncode(model.toJson()));
     Map data = jsonDecode(respone.body);

      if(respone.statusCode == 200){
        registerResponseJson(respone.body);
        return true;
      }else{
        return data['msg'];
      }

   } on SocketException {
     return 'error in internet connection';
   }
   catch (e){
     return e;
   }

 }

 //get user profile
 static Future<Map> GetUser () async {

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
     print("successfully got the user data");
     return data;
   }else{
     return {};
   }
 }
}