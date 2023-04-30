class Login_Model {
  Login_Model({
    required this.username,
    required this.phoneNum,
    required this.deviceId,
  });
  late final String username;
  late final String phoneNum;
  late final String deviceId;

  Login_Model.fromJson(Map<String, dynamic> json){
    username = json['username'];
    phoneNum = json['phoneNum'];
    deviceId = json['deviceId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['phoneNum'] = phoneNum;
    _data['deviceId'] = deviceId;
    return _data;
  }
}