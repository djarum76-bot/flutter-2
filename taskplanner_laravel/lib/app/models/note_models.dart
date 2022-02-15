// To parse this JSON data, do
//
//     final noteModel = noteModelFromJson(jsonString);

import 'dart:convert';

NoteModel noteModelFromJson(String str) => NoteModel.fromJson(json.decode(str));

String noteModelToJson(NoteModel data) => json.encode(data.toJson());

class NoteModel {
  NoteModel({
    this.note,
  });

  List<Note>? note;

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
    note: List<Note>.from(json["note"].map((x) => Note.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "note": List<dynamic>.from(note!.map((x) => x.toJson())),
  };
}

class Note {
  Note({
    this.id,
    this.userId,
    this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  String? title;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    id: json["id"],
    userId: json["user_id"],
    title: json["title"],
    content: json["content"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "title": title,
    "content": content,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
