import 'dart:convert';

LoginResponseModel loginResponseJson (String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.token,
    required this.user,
  });
  late final String token;
  late final User user;

  LoginResponseModel.fromJson(Map<String, dynamic> json){
    token = json['token'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.phoneNum,
    required this.username,
    required this.role,
    required this.videosId,
  });
  late final String id;
  late final int phoneNum;
  late final String username;
  late final String role;
  late final List<dynamic> videosId;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    phoneNum = json['phoneNum'];
    username = json['username'];
    role = json['role'];
    videosId = List.castFrom<dynamic, dynamic>(json['videosId']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['phoneNum'] = phoneNum;
    _data['username'] = username;
    _data['role'] = role;
    _data['videosId'] = videosId;
    return _data;
  }
}