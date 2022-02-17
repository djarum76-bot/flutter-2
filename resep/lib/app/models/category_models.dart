// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.method,
    this.status,
    this.results,
  });

  String? method;
  bool? status;
  List<Result>? results;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
    this.category,
    this.url,
    this.key,
  });

  String? category;
  String? url;
  String? key;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    category: json["category"],
    url: json["url"],
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "url": url,
    "key": key,
  };
}
