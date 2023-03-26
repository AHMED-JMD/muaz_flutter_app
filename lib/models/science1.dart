class Science1_model {
  String title, image, kind, chapter, type;
  int id,price;

  Science1_model({
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
List<Science1_model> lessons = [
  Science1_model(id : 1,title: 'باب الاحتمالات', image: 'subject2.jpeg',kind: 'علمي', chapter:'الاحتمالات' , type:'video/mp4'  , price: 0),
  Science1_model(id : 2,title: 'باب الاحصاء', image: 'subject2.jpeg', kind: 'علمي', chapter:'الاحصاء' , type: 'video/mp4', price: 0),
  Science1_model(id : 3,title: 'باب الكسور', image: 'subject2.jpeg',kind: 'علمي', chapter:'الكسور' , type: 'video/mp4', price: 0),
  Science1_model(id : 4,title: 'باب المصفوفات', image: 'subject2.jpeg',kind: 'علمي', chapter:'الكسور' , type:'video/mp4' , price: 0),
  Science1_model(id : 5,title: 'باب مبدأ العد', image: 'subject2.jpeg',kind: 'علمي', chapter: 'مبدأ العد', type: 'video/mp4', price: 0),
];