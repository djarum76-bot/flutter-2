// To parse this JSON data, do
//
//     final commentsModel = commentsModelFromJson(jsonString);

import 'dart:convert';

CommentsModel commentsModelFromJson(String str) => CommentsModel.fromJson(json.decode(str));

String commentsModelToJson(CommentsModel data) => json.encode(data.toJson());

class CommentsModel {
  CommentsModel({
    this.post,
  });

  List<Post>? post;

  factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
    post: List<Post>.from(json["post"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "post": List<dynamic>.from(post!.map((x) => x.toJson())),
  };
}

class Post {
  Post({
    this.id,
    this.userId,
    this.postId,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  int? id;
  int? userId;
  int? postId;
  String? comment;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    userId: json["user_id"],
    postId: json["post_id"],
    comment: json["comment"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "post_id": postId,
    "comment": comment,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "user": user!.toJson(),
  };
}

class User {
  User({
    this.id,
    this.name,
    this.image,
  });

  int? id;
  String? name;
  String? image;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}
