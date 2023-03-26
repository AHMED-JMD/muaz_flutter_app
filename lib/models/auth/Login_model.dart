class Login_Model {
  Login_Model({
    required this.username,
    required this.phoneNum,
  });
  late final String username;
  late final String phoneNum;

  Login_Model.fromJson(Map<String, dynamic> json){
    username = json['username'];
    phoneNum = json['phoneNum'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['phoneNum'] = phoneNum;
    return _data;
  }
}