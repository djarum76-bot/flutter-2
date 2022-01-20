// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    this.post,
  });

  List<Post>? post;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
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
    this.body,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.commentsCount,
    this.likesCount,
  });

  int? id;
  int? userId;
  String? body;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? commentsCount;
  int? likesCount;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    userId: json["user_id"],
    body: json["body"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    commentsCount: json["comments_count"],
    likesCount: json["likes_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "body": body,
    "image": image,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "comments_count": commentsCount,
    "likes_count": likesCount,
  };
}
