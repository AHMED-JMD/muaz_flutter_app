class VediosRequest {
  VediosRequest({
    required this.kind,
    required this.chapter,
    required this.type,
  });
  late final String kind;
  late final String chapter;
  late final String type;

  VediosRequest.fromJson(Map<String, dynamic> json){
    kind = json['kind'];
    chapter = json['chapter'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['kind'] = kind;
    _data['chapter'] = chapter;
    _data['type'] = type;
    return _data;
  }
}