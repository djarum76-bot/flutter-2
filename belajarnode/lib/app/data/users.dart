// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

UsersModel usersModelFromJson(String str) => UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  UsersModel({
    this.users,
  });

  List<User>? users;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "users": List<dynamic>.from(users!.map((x) => x.toJson())),
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
