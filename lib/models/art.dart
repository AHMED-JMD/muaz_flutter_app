class Art_model {
  String title, image, kind, chapter, type;
  int id,price;

  Art_model({
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
List<Art_model> Artlessons = [
  Art_model(id : 1,title: 'باب الدوال والنهايات', image: '4-rm.png', kind: 'أدبي', chapter:'الدوال الحقيقية والنهايات' , type:'video/mp4', price: 0),
  Art_model(id : 2,title: 'باب التفاضل', image: '4-rm.png', kind: 'أدبي', chapter:'التفاضل' , type:'video/mp4', price: 0),
  Art_model(id : 3,title: 'باب التكامل', image: '4-rm.png',kind: 'أدبي', chapter:'التكامل' , type:'video/mp4', price: 0),
  Art_model(id : 4,title: 'باب الاحصاء', image: '4-rm.png' ,kind: 'أدبي', chapter:'الاحصاء' , type:'video/mp4', price: 0),
  Art_model(id : 5,title: 'باب الاحتمالات', image: '4-rm.png', kind: 'أدبي', chapter:'الاحتمالات' , type:'video/mp4', price: 0),
  Art_model(id : 6,title: 'باب المصفوفات', image: '4-rm.png', kind: 'أدبي', chapter:'المصفوفات' , type:'video/mp4', price: 0),
];
