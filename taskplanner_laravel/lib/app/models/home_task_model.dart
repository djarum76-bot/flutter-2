// To parse this JSON data, do
//
//     final homeTaskModel = homeTaskModelFromJson(jsonString);

import 'dart:convert';

HomeTaskModel homeTaskModelFromJson(String str) => HomeTaskModel.fromJson(json.decode(str));

String homeTaskModelToJson(HomeTaskModel data) => json.encode(data.toJson());

class HomeTaskModel {
  HomeTaskModel({
    this.tasks,
  });

  List<Task>? tasks;

  factory HomeTaskModel.fromJson(Map<String, dynamic> json) => HomeTaskModel(
    tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "tasks": List<dynamic>.from(tasks!.map((x) => x.toJson())),
  };
}

class Task {
  Task({
    this.id,
    this.userId,
    this.title,
    this.tanggal,
    this.waktu,
    this.date,
    this.deskripsi,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  String? title;
  DateTime? tanggal;
  String? waktu;
  DateTime? date;
  String? deskripsi;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    userId: json["user_id"],
    title: json["title"],
    tanggal: DateTime.parse(json["tanggal"]),
    waktu: json["waktu"],
    date: DateTime.parse(json["date"]),
    deskripsi: json["deskripsi"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "title": title,
    "tanggal": "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
    "waktu": waktu,
    "date": date!.toIso8601String(),
    "deskripsi": deskripsi,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
