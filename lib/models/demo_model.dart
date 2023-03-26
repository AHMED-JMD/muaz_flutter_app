class Demo_model {
  String title1, title2, btnName;
  int id;

  Demo_model({ required this.id, required this.title1,  required this.title2,  required this.btnName});
}

//state of data
List<Demo_model> Demo_data = [
  Demo_model(id : 1,title1: 'درس النهايات', title2: 'الدرس الاول', btnName: 'شاهد الفيديو'),
  Demo_model(id : 2,title1: 'درس فضاء العينة', title2: 'الدرس الثاني', btnName: 'شاهد الفيديو'),
  Demo_model(id : 3,title1: 'درس الحادثة', title2: 'الدرس الثالث', btnName: 'شاهد الفيديو'),
  Demo_model(id : 4,title1: 'درس الاحتمالات', title2: 'الدرس الرابع', btnName: 'شاهد الفيديو'),
  Demo_model(id : 5,title1: 'درس التفاضل', title2: 'الدرس الخامس', btnName: 'شاهد الفيديو'),
  Demo_model(id : 6,title1: 'درس التكامل', title2: 'الدرس السادس', btnName: 'شاهد الفيديو'),
  Demo_model(id : 7,title1: 'درس الدائرة', title2: 'الدرس السابع', btnName: 'شاهد الفيديو'),
];