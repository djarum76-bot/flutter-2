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
    this.email,
    this.image,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.postsCount,
    this.posts,
  });

  int? id;
  String? username;
  String? email;
  String? image;
  DateTime? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? postsCount;
  List<Post>? posts;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    image: json["image"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    postsCount: json["posts_count"],
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "image": image,
    "email_verified_at": emailVerifiedAt!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "posts_count": postsCount,
    "posts": List<dynamic>.from(posts!.map((x) => x.toJson())),
  };
}

class Post {
  Post({
    this.id,
    this.userId,
    this.image,
  });

  int? id;
  int? userId;
  String? image;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    userId: json["user_id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "image": image,
  };
}
