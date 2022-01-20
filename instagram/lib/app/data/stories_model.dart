// To parse this JSON data, do
//
//     final storiesModel = storiesModelFromJson(jsonString);

import 'dart:convert';

StoriesModel storiesModelFromJson(String str) => StoriesModel.fromJson(json.decode(str));

String storiesModelToJson(StoriesModel data) => json.encode(data.toJson());

class StoriesModel {
  StoriesModel({
    this.user,
  });

  List<User>? user;

  factory StoriesModel.fromJson(Map<String, dynamic> json) => StoriesModel(
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
    this.storiesCount,
    this.stories,
  });

  int? id;
  String? username;
  String? email;
  String? image;
  DateTime? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? storiesCount;
  List<Story>? stories;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    image: json["image"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    storiesCount: json["stories_count"],
    stories: List<Story>.from(json["stories"].map((x) => Story.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "image": image,
    "email_verified_at": emailVerifiedAt!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "stories_count": storiesCount,
    "stories": List<dynamic>.from(stories!.map((x) => x.toJson())),
  };
}

class Story {
  Story({
    this.id,
    this.userId,
    this.image,
    this.createdAt,
  });

  int? id;
  int? userId;
  String? image;
  DateTime? createdAt;

  factory Story.fromJson(Map<String, dynamic> json) => Story(
    id: json["id"],
    userId: json["user_id"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "image": image,
    "created_at": createdAt!.toIso8601String(),
  };
}
