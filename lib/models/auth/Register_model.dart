class RegisterModel {
  RegisterModel({
    required this.username,
    required this.phoneNum,
    required this.confirmPhon,
  });
  late final String username;
  late final String phoneNum;
  late final String confirmPhon;

  RegisterModel.fromJson(Map<String, dynamic> json){
    username = json['username'];
    phoneNum = json['phoneNum'];
    confirmPhon = json['confirmPhon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['phoneNum'] = phoneNum;
    _data['confirmPhon'] = confirmPhon;
    return _data;
  }
}