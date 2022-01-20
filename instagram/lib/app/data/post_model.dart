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
    this.user,
    this.comments,
    this.likes,
  });

  int? id;
  int? userId;
  String? body;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? commentsCount;
  int? likesCount;
  User? user;
  List<Comment>? comments;
  List<Like>? likes;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    userId: json["user_id"],
    body: json["body"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    commentsCount: json["comments_count"],
    likesCount: json["likes_count"],
    user: User.fromJson(json["user"]),
    comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
    likes: List<Like>.from(json["likes"].map((x) => Like.fromJson(x))),
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
    "user": user!.toJson(),
    "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
    "likes": List<dynamic>.from(likes!.map((x) => x.toJson())),
  };
}

class Comment {
  Comment({
    this.id,
    this.userId,
    this.postId,
    this.comment,
    this.createdAt,
    this.user,
  });

  int? id;
  int? userId;
  int? postId;
  String? comment;
  DateTime? createdAt;
  User? user;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    userId: json["user_id"],
    postId: json["post_id"],
    comment: json["comment"],
    createdAt: DateTime.parse(json["created_at"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "post_id": postId,
    "comment": comment,
    "created_at": createdAt!.toIso8601String(),
    "user": user!.toJson(),
  };
}

class User {
  User({
    this.id,
    this.username,
    this.image,
  });

  int? id;
  String? username;
  String? image;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "image": image,
  };
}

class Like {
  Like({
    this.id,
    this.userId,
    this.postId,
  });

  int? id;
  int? userId;
  int? postId;

  factory Like.fromJson(Map<String, dynamic> json) => Like(
    id: json["id"],
    userId: json["user_id"],
    postId: json["post_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "post_id": postId,
  };
}
