import 'package:flutter/material.dart';
import 'package:muaz_app/components/Subjects/Science_math1.dart';
import 'package:muaz_app/components/Subjects/Science_math2.dart';
import 'package:muaz_app/components/Subjects/Art_math.dart';
import 'package:muaz_app/components/Subjects/first-year.dart';
import 'package:muaz_app/components/Subjects/revision.dart';
import 'package:muaz_app/components/Subjects/second-year.dart';

class SubjectNavigator extends StatefulWidget {
  const SubjectNavigator({Key? key}) : super(key: key);

  @override
  State<SubjectNavigator> createState() => _SubjectNavigatorState();
}

class _SubjectNavigatorState extends State<SubjectNavigator> {

  int _index = 0;
//pages lists
  List Pages =[
    Column(
      children: [
        Science_1(),
        Science_2(),
        ArtMath(),
        RevisionMath(),
        First_Year(),
        Second_Year(),
      ],
    ),
    Science_1(),
    Science_2(),
    ArtMath(),
    RevisionMath(),
    First_Year(),
    Second_Year(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Container(

      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      _index = 0;
                    });
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.white54, elevation: 2,),
                  child: Text('الكل' ,style: TextStyle(color: Colors.black),),
                ),
              ),
              Expanded(
                flex: 4,
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      _index = 1;
                    });
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.white54, elevation: 2,),
                  child: Text('المتخصصة 1',style: TextStyle(color: Colors.black),),
                ),
              ),
              Expanded(
                flex: 4,
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      _index = 2;
                    });
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.white54, elevation: 2,),
                  child: Text('المتخصصة 2',style: TextStyle(color: Colors.black)),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      _index = 3;
                    });
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.white54, elevation: 2,),
                  child: Text('الأساسية',style: TextStyle(color: Colors.black)),
                ),
              ),
              Expanded(
                flex: 4,
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      _index = 4;
                    });
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.white54, elevation: 2,),
                  child: Text('المراجعة',style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
          Row(

            children: [
              Expanded(
                flex: 3,
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      _index = 5;
                    });
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.white54, elevation: 2,),
                  child: Text('الصف الاول',style: TextStyle(color: Colors.black)),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      _index = 6;
                    });
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.white54, elevation: 2,),
                  child: Text('الصف الثاني',style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
          SizedBox(height: 25,),
          Pages[_index],
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
