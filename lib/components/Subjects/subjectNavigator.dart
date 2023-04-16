import 'package:flutter/material.dart';
import 'package:muaz_app/components/Subjects/Science_math1.dart';
import 'package:muaz_app/components/Subjects/Science_math2.dart';
import 'package:muaz_app/components/Subjects/Art_math.dart';
import 'package:muaz_app/components/Subjects/first-year.dart';
import 'package:muaz_app/components/Subjects/revision.dart';
import 'package:muaz_app/components/Subjects/second-year.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:muaz_app/shared_services/SharedServices.dart';

class SubjectNavigator extends StatefulWidget {
  const SubjectNavigator({Key? key}) : super(key: key);

  @override
  State<SubjectNavigator> createState() => _SubjectNavigatorState();
}

class _SubjectNavigatorState extends State<SubjectNavigator> {

  //---------------------------------
  bool user = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isLoggedIn();
  }

  _isLoggedIn () async {
    var _result = await SharedServices.isLoggedIn();
    setState(() {
      user = _result;
    });
  }
  //--------------------------
  //page view -------------------------
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
  //--------------------------------------------------

  List<dynamic> filterList = [
     'الكل',
    'المتخصصة 1',
     'المتخصصة 2',
     'الاساسية',
     'حصص المراجعة',
     'الصف الأول',
     'الصف الثاني',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('تصنيف المواد :', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: const [
                      Icon(
                        Icons.list,
                        size: 16,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          'اختر المادة',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: filterList
                      .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value ;
                    });
                    //change the state of pages ----------
                    switch (value){
                      case 'الكل' :
                        setState(() {
                          _index = 0;
                        });
                        break;
                      case 'المتخصصة 1' :
                        setState(() {
                          _index = 1;
                        });
                        break;
                      case 'المتخصصة 2' :
                        setState(() {
                          _index = 2;
                        });
                        break;
                      case 'الاساسية' :
                        setState(() {
                          _index = 3;
                        });
                        break;
                      case 'حصص المراجعة' :
                        setState(() {
                          _index = 4;
                        });
                        break;
                      case 'الصف الأول' :
                        setState(() {
                          _index = 5;
                        });
                        break;
                      case 'الصف الثاني' :
                        setState(() {
                          _index = 6;
                        });
                        break;
                    }
                   //---------------------------------
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 40,
                    width: 150,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: Colors.deepOrangeAccent,
                    ),
                    elevation: 2,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: Colors.yellow,
                    iconDisabledColor: Colors.grey,
                  ),
                  dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 200,
                      padding: null,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.deepOrangeAccent,
                      ),
                      elevation: 8,
                      offset: const Offset(-20, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(30),
                        thickness: MaterialStateProperty.all(6),
                        thumbVisibility: MaterialStateProperty.all(true),
                      )),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: 35,),
          Pages[_index],
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
