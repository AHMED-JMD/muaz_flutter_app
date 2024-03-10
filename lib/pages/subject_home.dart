import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muaz_app/components/MyAppBar.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:muaz_app/components/Subjects/subjectNavigator.dart';

//components
import 'package:muaz_app/components/drawer.dart';



class Subject_home extends StatefulWidget {
  const Subject_home({Key? key}) : super(key: key);

  @override
  State<Subject_home> createState() => _Subject_homeState();
}

class _Subject_homeState extends State<Subject_home> {


  //url lancher
  void _launchWebsite() async {
    String url = 'https://muaz-website.com/subjects-pdf';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(context),
        drawer: AppDrawer(),
        body: ListView(
            children: [
              Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width/2.3,
                  color: Colors.grey[200],
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         image: AssetImage('assets/images/bg3.jpg'),
                  //         fit: BoxFit.cover,
                  //       colorFilter: ColorFilter.mode(Colors.blueGrey.withOpacity(0.5), BlendMode.lighten)
                  //     )
                  // ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(' الرياضيات :',
                              style: GoogleFonts.alexandria(
                                  color: Colors.black,
                                  fontSize: 25,
                                  // fontWeight: FontWeight.w600
                              )
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pushReplacementNamed(context, '/math1');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/3.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue[400]
                              ),
                              child: Text('المتخصصة 1',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pushReplacementNamed(context, '/math2');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/3.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue[400]
                              ),
                              child: Text('المتخصصة 2',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pushReplacementNamed(context, '/basic_math');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/3.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue[400]
                              ),
                              child: Text('الاساسية',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pushReplacementNamed(context, '/revision_lessons');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/3.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.deepOrange[400]
                              ),
                              child: Text('حصص المراجعة',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pushReplacementNamed(context, '/first_class_math');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/3.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.deepOrange[400]
                              ),
                              child: Text('الصف الاول',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pushReplacementNamed(context, '/second_class_math');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/3.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.deepOrange[400]
                              ),
                              child: Text('الصف الثاني',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15,)
                    ],
                  ),
                ),

                SizedBox(height: 30,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width/4.2,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(0)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 28),
                            child: Text('يمكنك مشاهدة الحصة الاولى في اي باب مباشرة و مجانا ', style: GoogleFonts.alexandria(
                              fontSize: 17, color: Colors.white
                            ),
                            ),
                          ),

                        ],
                      ),
                ),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'رسوم الاشتراك',
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    // Icon(Icons.monetization_on)
                  ],
                ),
                SizedBox(
                  width: 100,
                  child: Divider(color: Colors.deepOrange, thickness: 2,),
                ),
                SizedBox(height: 15, ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width/2.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/bankk3.webp'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                          ),
                          color: Colors.blue,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'بنكك على رقم الحساب',
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                          Text('2916188',
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                            child: Divider(color: Colors.deepOrange, thickness: 1,)
                        ),
                        Container(
                          color: Colors.white,
                          child: Text('أو',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 17),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: MediaQuery.of(context).size.width/2.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Vodafone-Cash2.png'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(Colors.black45.withOpacity(0.6), BlendMode.darken),
                          ),
                          color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '  عن طريق فودافون كاش',
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text('. . . coming soon',
                            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width/1.3,
                  child: Text('** ثم ارسال الاشعار على واتساب باسم الطالب علي اي من الارقام التالية : \n '
                      ' 249912212622+ || 201508442003+ ',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40,),
                SizedBox(
                  width: 100,
                  child: Divider(color: Colors.deepOrange, thickness: 2,),
                ),
                ElevatedButton.icon(
                    onPressed: (){
                      _launchWebsite();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      minimumSize: Size(300, 60)
                    ),
                    icon: Icon(Icons.language, color: Colors.black,),
                    label: Text('تصفح المطبوعات والحصص المباشرة على الموقع',
                      style: GoogleFonts.albertSans(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                          fontSize: 15,
                      )
                    )
                ),
                SizedBox(
                  width: 100,
                  child: Divider(color: Colors.deepOrange, thickness: 2,),
                ),
                SizedBox(height: 50,),
                // SubjectNavigator(),

              ],
            )]
        )
      ),
    );
  }
}
