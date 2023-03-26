import 'dart:convert';

VediosResponse videoResponseJson (String str) =>
    VediosResponse.fromJson(json.decode(str));

class VediosResponse {
  VediosResponse({
    required this.data,
  });
  late final List<Data> data;

  VediosResponse.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.Type,
    required this.link,
    required this.subject,
    required this.kind,
    required this.booknum,
    required this.chapter,
    required this.subName,
    required this.price,
    required this.details,
    required this.users,
  });
  late final String id;
  late final String Type;
  late final String link;
  late final String subject;
  late final String kind;
  late final String booknum;
  late final String chapter;
  late final String subName;
  late final int price;
  late final String details;
  late final List<num> users;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    Type = json['Type'];
    link = json['link'];
    subject = json['subject'];
    kind = json['kind'];
    booknum = json['booknum'];
    chapter = json['chapter'];
    subName = json['subName'];
    price = json['price'];
    details = json['details'];
    users = List.castFrom<dynamic, num>(json['users']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['Type'] = Type;
    _data['link'] = link;
    _data['subject'] = subject;
    _data['kind'] = kind;
    _data['booknum'] = booknum;
    _data['chapter'] = chapter;
    _data['subName'] = subName;
    _data['price'] = price;
    _data['details'] = details;
    _data['users'] = users;

    return _data;
  }
}