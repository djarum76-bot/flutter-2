// To parse this JSON data, do
//
//     final tasksModel = tasksModelFromJson(jsonString);

import 'dart:convert';

TasksModel tasksModelFromJson(String str) => TasksModel.fromJson(json.decode(str));

String tasksModelToJson(TasksModel data) => json.encode(data.toJson());

class TasksModel {
  TasksModel({
    this.tasks,
  });

  List<TasksModelTask>? tasks;

  factory TasksModel.fromJson(Map<String, dynamic> json) => TasksModel(
    tasks: List<TasksModelTask>.from(json["tasks"].map((x) => TasksModelTask.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "tasks": List<dynamic>.from(tasks!.map((x) => x.toJson())),
  };
}

class TasksModelTask {
  TasksModelTask({
    this.tanggal,
    this.task,
  });

  DateTime? tanggal;
  List<TaskTask>? task;

  factory TasksModelTask.fromJson(Map<String, dynamic> json) => TasksModelTask(
    tanggal: DateTime.parse(json["tanggal"]),
    task: List<TaskTask>.from(json["task"].map((x) => TaskTask.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "tanggal": "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
    "task": List<dynamic>.from(task!.map((x) => x.toJson())),
  };
}

class TaskTask {
  TaskTask({
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

  factory TaskTask.fromJson(Map<String, dynamic> json) => TaskTask(
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
