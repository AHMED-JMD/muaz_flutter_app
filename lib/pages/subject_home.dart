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
                  height: MediaQuery.of(context).size.width/3.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/bg3.jpg'),
                          fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstOver)
                      )
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
                      'طرق الدفع',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      child: Column(
                        children: [
                          Text(
                              '  عن طريق بنكك',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 75,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/bankkpng.png')
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            // child: Icon(Icons.person_4_outlined),
                          ),
                          Text('2916188', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0,),
                      child: Column(
                        children: [
                          Text(
                            '  عن طريق فودافون كاش',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/vodafonecash.png')
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            // child: Icon(Icons.person_4_outlined),
                          ),
                          Text('. . . . . . . . . .', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)

                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('** ثم ارسال الاشعار على واتساب باسم الطالب علي اي من الارقام التالية : \n '
                      ' 249912212622+ || 201508442003+ '),
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
                          color: Colors.deepOrange,
                          fontSize: 15
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
