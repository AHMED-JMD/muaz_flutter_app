class RegisterModel {
  RegisterModel({
    required this.username,
    required this.phoneNum,
    required this.confirmPhon,
    required this.deviceId,
  });
  late final String username;
  late final String phoneNum;
  late final String confirmPhon;
  late final String deviceId;

  RegisterModel.fromJson(Map<String, dynamic> json){
    username = json['username'];
    phoneNum = json['phoneNum'];
    confirmPhon = json['confirmPhon'];
    deviceId = json['deviceId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['phoneNum'] = phoneNum;
    _data['confirmPhon'] = confirmPhon;
    _data['deviceId'] = deviceId;
    return _data;
  }
}