class Second_model {
  String title, image, kind, chapter, type;
  int id,price;

  Second_model({
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
List<Second_model> lessons_second = [
  Second_model(id : 1,title: 'الهندسة التحليلية', image: 'subject_second.jpg',kind: 'الصف الثاني', chapter:'الهندسة التحليلية' , type:'video/mp4', price: 0),
  Second_model(id : 2,title: 'باب الدالة الاسية', image: 'subject_second.jpg',kind: 'الصف الثاني', chapter:'الدالة الاسية' , type:'video/mp4' , price: 0),
  Second_model(id : 3,title: 'الدالة اللوغريثمية', image: 'subject_second.jpg',kind: 'الصف الثاني', chapter:'الدالة اللوغريثمية' , type:'video/mp4'  , price: 0),
  Second_model(id : 4,title: 'باب الجذور الصم', image: 'subject_second.jpg',kind: 'الصف الثاني', chapter:'الجذور الصم' , type:'video/mp4', price: 0),
  Second_model(id : 5,title: 'باب حساب مثلثات', image: 'subject_second.jpg',kind: 'الصف الثاني', chapter:'حساب مثلثات' , type:'video/mp4', price: 0),
  Second_model(id : 6,title: 'باب المتتاليات', image: 'subject_second.jpg',kind: 'الصف الثاني', chapter:'المتتاليات' , type:'video/mp4', price: 0),
  Second_model(id : 7,title: 'باب المتباينات', image: 'subject_second.jpg',kind: 'الصف الثاني', chapter:'المتباينات' , type:'video/mp4', price: 0),
  Second_model(id : 8,title: ' نظرية الباقي و العامل', image: 'subject_second.jpg',kind: 'الصف الثاني', chapter:'العمليات الثنائية' , type:'video/mp4', price: 0),
  Second_model(id : 9,title: ' مجموعة الاعداد المركبة', image: 'subject_second.jpg',kind: 'الصف الثاني', chapter:'مجموعة الاعداد المركبة' , type:'video/mp4', price: 0),
];