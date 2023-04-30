import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:muaz_app/Api/auth.dart';
import 'package:muaz_app/models/auth/Login_model.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:device_info_plus/device_info_plus.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //state of widget
  bool isLoading = false;
  bool hidePassword = true;
  String? username;
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

  //custom login widget
  Widget _loginUI (BuildContext context){
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
                     'تسجيل الدخول',
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
              'Password',
              'رقم الهاتف',
                  (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'phone Number can\'t be empty';
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
              suffixIcon: Icon(Icons.phone_android),
            //   obscureText: hidePassword,
            //   suffixIcon: IconButton(
            //     onPressed: (){
            //       setState(() {
            //         hidePassword = !hidePassword;
            //       });
            //     },
            //     icon: Icon(
            //       hidePassword ? Icons.visibility_off : Icons.visibility
            //     )
            // )
          ),
          SizedBox(height: 20,),
          Center(
            child: FormHelper.submitButton(
                'تسجيل الدخول',
                    () async {
                  if(validateAndSave()){
                    //loader
                    setState(() {
                      isLoading = true;
                    });
                    //cal login request model
                    String? deviceId = await _getId();
                    print(deviceId);
                    Login_Model model = Login_Model(username: username!, phoneNum: phoneNum!, deviceId: deviceId!);
                    //call api
                    APISERVICE_Auth.Login(model).then((response) {
                      if(response == true){
                        setState(() {
                          isLoading = false;
                        });
                        //navigate to home
                        Navigator.pushReplacementNamed(context, '/Subjects');
                      }else{
                        setState(() {
                          isLoading = false;
                        });
                        FormHelper.showSimpleAlertDialog(
                            context,
                            'منصة استاذ معاذ',
                            '${response}',
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
          SizedBox(height: 20,),
          Center(child: Text('او', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),)),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0, right: 13),
              child: RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'ليس لديك حساب? ', style: TextStyle(color: Colors.grey.shade600)),
                      TextSpan(
                        text: 'تسجيل',
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline
                        ),
                        recognizer: TapGestureRecognizer()..onTap = (){
                          Navigator.pushNamed(context, '/register');
                        },
                      ),
                    ]
                ),
              ),
            ),
          )
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
    return  SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.orange[300],
            body: ProgressHUD(
              child: Form(
                key: globalFormKey,
                child: _loginUI(context)
              ),
              inAsyncCall: isLoading,
              opacity: 0.4,
              key: UniqueKey(),
            ),
          ),
        )
    );

    }
  }

