import 'package:flutter/material.dart';
import 'package:muaz_app/components/Subjects/subjectNavigator.dart';

//components
import 'package:muaz_app/components/customAppbar.dart';



class Subject_home extends StatefulWidget {
  const Subject_home({Key? key}) : super(key: key);

  @override
  State<Subject_home> createState() => _Subject_homeState();
}

class _Subject_homeState extends State<Subject_home> {

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: ListView(
            children: [Column(
              children: [
                CustomAppbar(),
                SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      child: Column(
                        children: [
                          Text(
                              'يمكنك الدفع عن طريق بنكك',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text('عبر رقم الحساب التالي: 2916188 \n ثم ارسال الاشعار باسم الطالب على \n رقم الهاتف : 0912212622',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              wordSpacing: 1.5,
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 9),
                      child: Column(
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/bankkpng.png')
                              ),
                                color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            // child: Icon(Icons.person_4_outlined),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25,),
                SubjectNavigator(),

              ],
            )]
        )
      ),
    );
  }
}
