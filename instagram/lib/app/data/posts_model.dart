// To parse this JSON data, do
//
//     final postsModel = postsModelFromJson(jsonString);

import 'dart:convert';

PostsModel postsModelFromJson(String str) => PostsModel.fromJson(json.decode(str));

String postsModelToJson(PostsModel data) => json.encode(data.toJson());

class PostsModel {
  PostsModel({
    this.posts,
  });

  List<Post>? posts;

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "posts": List<dynamic>.from(posts!.map((x) => x.toJson())),
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
    "likes": List<dynamic>.from(likes!.map((x) => x.toJson())),
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
