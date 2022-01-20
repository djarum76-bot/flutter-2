// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.user,
  });

  List<User>? user;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "user": List<dynamic>.from(user!.map((x) => x.toJson())),
  };
}

class User {
  User({
    this.id,
    this.username,
    this.name,
    this.lastname,
    this.mail,
    this.randomstr,
    this.hash,
  });

  int? id;
  String? username;
  String? name;
  String? lastname;
  String? mail;
  String? randomstr;
  String? hash;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    name: json["name"],
    lastname: json["lastname"],
    mail: json["mail"],
    randomstr: json["randomstr"],
    hash: json["hash"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "name": name,
    "lastname": lastname,
    "mail": mail,
    "randomstr": randomstr,
    "hash": hash,
  };
}
