import 'package:flutter/material.dart';
import 'dart:io';
import 'package:muaz_app/Api/auth.dart';
import 'package:muaz_app/models/auth/Register_model.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:device_info_plus/device_info_plus.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  //state of widget
  bool isLoading = false;
  bool hidePassword = true;
  String? username;
  String? confirmPhon;
  String? phoneNum;

  //global form key
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  //get device unique ID
  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // Unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // Unique ID on Android
    }
  }


  //custom Register widget
  Widget _RegisterUI (BuildContext context){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height /4.2,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white,
                    ]
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'منصة استاذ معاذ',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[900]
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50.0, 20.0, 30.0),
                child: Container(
                  child: Text(
                    'تسجيل جديد',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
            ],
          ),
          FormHelper.inputFieldWidget(
              context,
              suffixIcon: Icon(Icons.person),
              'Username',
              'اسم المستخدم',
                  (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Username can\'t be empty';
                }
                return null;
              },
                  (onSavedVal) {
                username = onSavedVal;
              },
              borderFocusColor: Colors.white,
              borderColor: Colors.white,
              prefixIconColor: Colors.white,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.5),
              borderRadius: 10
          ),
          SizedBox(height: 20,),
          FormHelper.inputFieldWidget(
              context,
              suffixIcon: Icon(Icons.phone_android),
              'number',
              'رقم الهاتف',
                  (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'phone can\'t be empty';
                }
                return null;
              },
                  (onSavedVal) {
                phoneNum = onSavedVal;
              },
              borderFocusColor: Colors.white,
              borderColor: Colors.white,
              prefixIconColor: Colors.white,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.5),
              borderRadius: 10,

          ),
          SizedBox(height: 20,),
          FormHelper.inputFieldWidget(
              context,
              'confirmPhone',
              'تأكيد رقم الهاتف',
                  (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'phone can\'t be empty';
                }
                return null;
              },
                  (onSavedVal) {
                    confirmPhon = onSavedVal;
              },
              borderFocusColor: Colors.white,
              borderColor: Colors.white,
              prefixIconColor: Colors.white,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.5),
              borderRadius: 10,
              suffixIcon: Icon(Icons.phone_android)
          ),
          SizedBox(height: 20,),
          Center(
            child: FormHelper.submitButton(
                'تسجيل',
                    () async {
                    if(validateAndSave()){
                      //loader
                      setState(() {
                        isLoading = true;
                      });
                      //register model
                      String? deviceId = await _getId();
                      print(deviceId);
                      RegisterModel model = RegisterModel(username: username!, phoneNum: phoneNum!, confirmPhon: confirmPhon!, deviceId: deviceId!);
                      //call api
                      APISERVICE_Auth.Register(model).then((response) {
                        setState(() {
                          isLoading = false;
                        });
                        if(response == true){
                          FormHelper.showSimpleAlertDialog(
                              context,
                              'منصة استاذ معاذ',
                              'تم التسجيل بنجاح الرجاء تسجيل الدخول',
                              'تم',
                                  (){
                                Navigator.pushReplacementNamed(context, '/login');
                              }
                          );
                         } else{
                          setState(() {
                            isLoading = false;
                          });
                          FormHelper.showSimpleAlertDialog(
                              context,
                              'منصة استاذ معاذ',
                              '$response',
                              'تم',
                                  (){
                                Navigator.pop(context);
                              }
                          );
                        }
                      });
                    }
                    },
                btnColor: Colors.orange.shade300,
                borderRadius: 10,
                borderColor: Colors.white
            ),
          ),
        ],

      ),
    );
  }

  bool validateAndSave(){
    final form = globalFormKey.currentState;
    if(form!.validate()){
      form.save();
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.orange[300],
            body: ProgressHUD(
              child: Form(
                  key: globalFormKey,
                  child: _RegisterUI(context)
              ),
              inAsyncCall: isLoading,
              opacity: 0.4,
              key: UniqueKey(),
            ),
          )
      ),
    );
  }
}
