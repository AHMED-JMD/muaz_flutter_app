class Science2_model {
  String title, image, kind, chapter, type;
  int id,price;

  Science2_model({
    required this.id,
    required this.title,
    required this.image,
    required this.kind,
    required this.chapter,
    required this.type,
    required this.price
  });
}

//state of data
List<Science2_model> lessons2 = [
  Science2_model(id : 1,title: 'الاعداد المركبة', image: 'subject3.png',kind: 'علمي', chapter:'الاعداد المركبة' , type:'video/mp4', price: 0),
  Science2_model(id : 2,title: 'باب التفاضل', image: 'subject3.png',kind: 'علمي', chapter:'التفاضل' , type:'video/mp4' , price: 0),
  Science2_model(id : 3,title: 'باب التكامل', image: 'subject3.png',kind: 'علمي', chapter:'التكامل' , type:'video/mp4'  , price: 0),
  Science2_model(id : 4,title: 'باب الدائرة', image: 'subject3.png',kind: 'علمي', chapter:'الدائرة' , type:'video/mp4', price: 0),
  Science2_model(id : 5,title: 'الدوال والنهايات', image: 'subject3.png',kind: 'علمي', chapter:'الدوال' , type:'video/mp4', price: 0),
  Science2_model(id : 6,title: 'تطبيقات التفاضل', image: 'subject3.png',kind: 'علمي', chapter:'تطبيقات التفاضل' , type:'video/mp4', price: 0),
];