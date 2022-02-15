// To parse this JSON data, do
//
//     final notesModel = notesModelFromJson(jsonString);

import 'dart:convert';

NotesModel notesModelFromJson(String str) => NotesModel.fromJson(json.decode(str));

String notesModelToJson(NotesModel data) => json.encode(data.toJson());

class NotesModel {
  NotesModel({
    this.notes,
  });

  List<Note>? notes;

  factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
    notes: List<Note>.from(json["notes"].map((x) => Note.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "notes": List<dynamic>.from(notes!.map((x) => x.toJson())),
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
