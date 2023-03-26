import 'dart:convert';

RegisterResponse registerResponseJson (String str) =>
    RegisterResponse.fromJson(json.decode(str));

class RegisterResponse {
  RegisterResponse({
    required this.user,
  });
  late final User user;

  RegisterResponse.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
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
  });
  late final String id;
  late final int phoneNum;
  late final String username;
  late final String role;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    phoneNum = json['phoneNum'];
    username = json['username'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['phoneNum'] = phoneNum;
    _data['username'] = username;
    _data['role'] = role;
    return _data;
  }
}