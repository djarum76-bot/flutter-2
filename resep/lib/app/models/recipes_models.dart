// To parse this JSON data, do
//
//     final recipesModel = recipesModelFromJson(jsonString);

import 'dart:convert';

RecipesModel recipesModelFromJson(String str) => RecipesModel.fromJson(json.decode(str));

String recipesModelToJson(RecipesModel data) => json.encode(data.toJson());

class RecipesModel {
  RecipesModel({
    this.method,
    this.status,
    this.results,
  });

  String? method;
  bool? status;
  List<Result>? results;

  factory RecipesModel.fromJson(Map<String, dynamic> json) => RecipesModel(
    method: json["method"],
    status: json["status"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "method": method,
    "status": status,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.title,
    this.thumb,
    this.key,
    this.times,
    this.portion,
    this.dificulty,
  });

  String? title;
  String? thumb;
  String? key;
  String? times;
  String? portion;
  String? dificulty;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    title: json["title"],
    thumb: json["thumb"],
    key: json["key"],
    times: json["times"],
    portion: json["portion"],
    dificulty: json["dificulty"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "thumb": thumb,
    "key": key,
    "times": times,
    "portion": portion,
    "dificulty": dificulty,
  };
}
