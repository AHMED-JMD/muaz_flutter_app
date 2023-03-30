import 'package:flutter/material.dart';
import 'package:muaz_app/components/Subjects/subjectNavigator.dart';

//components
import 'package:muaz_app/components/customAppbar.dart';



class Subject_home extends StatefulWidget {
  final Map data;
  const Subject_home({Key? key, required this.data}) : super(key: key);

  @override
  State<Subject_home> createState() => _Subject_homeState(data: data);
}

class _Subject_homeState extends State<Subject_home> {
  final Map data;
  _Subject_homeState({required this.data});

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
                              ' مرحبا ${ data['username'] }',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text('في منصة استاذ معاذ لتدريس \n مقرر رياضيات الصف الثالث ثانوي',
                            style: TextStyle(
                              fontSize: 15,
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
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Icon(Icons.person_4_outlined),
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
