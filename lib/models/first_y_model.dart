class First_model {
  String title, image, kind, chapter, type;
  int id,price;

  First_model({
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
List<First_model> lessons_first = [
  First_model(id : 1,title: 'باب الهندسة التحليلية', image: 'subject_first.webp',kind: 'الصف الاول', chapter:'الهندسة التحليلية' , type:'video/mp4', price: 0),
  First_model(id : 2,title: 'باب المنطق الرياضي', image: 'subject_first.webp',kind: 'الصف الاول', chapter:'المنطق الرياضي' , type:'video/mp4', price: 0),
  First_model(id : 3,title: 'باب الدوال المثلثية', image: 'subject_first.webp',kind: 'الصف الاول', chapter:'الدوال المثلثية' , type:'video/mp4' , price: 0),
  First_model(id : 4,title: 'باب المجموعات', image: 'subject_first.webp',kind: 'الصف الاول', chapter:'المجموعات' , type:'video/mp4'  , price: 0),
  First_model(id : 5,title: 'باب العلاقات', image: 'subject_first.webp',kind: 'الصف الاول', chapter:'العلاقات' , type:'video/mp4', price: 0),
  First_model(id : 6,title: 'باب التغيير', image: 'subject_first.webp',kind: 'الصف الاول', chapter:'التغيير' , type:'video/mp4', price: 0),
  First_model(id : 7,title: 'باب كثيرات الحدود', image: 'subject_first.webp',kind: 'الصف الاول', chapter:'كثيرات الحدود' , type:'video/mp4', price: 0),
];