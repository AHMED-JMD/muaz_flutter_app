class Revision_model {
  String title, image, kind, booknum, type;
  int id,price;

  Revision_model({
    required this.id,
    required this.title,
    required this.image,
    required this.kind,
    required this.booknum,
    required this.type,
    required this.price
  });
}

//state of data
List<Revision_model> Revisionlessons = [
  Revision_model(id : 1,title: ' المتخصصة (1)', image: 'subject2.png',  kind: 'حصص مراجعة', booknum:'الكتاب الأول' , type:'video/mp4', price: 0),
  Revision_model(id : 2,title: ' المتخصصة (2)', image: 'subject2.png', kind: 'حصص مراجعة', booknum:'الكتاب الثاني' , type:'video/mp4', price: 0),
  Revision_model(id : 3,title: 'الرياضيات الاساسية', image: 'subject2.png',  kind: 'حصص مراجعة', booknum:'كتاب الأدبي' , type:'video/mp4', price: 0),
];