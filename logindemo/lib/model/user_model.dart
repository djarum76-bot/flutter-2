// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.status,
    this.error,
    this.data,
  });

  bool? status;
  bool? error;
  Data? data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    status: json["status"],
    error: json["error"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error": error,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.role,
    this.nama,
    this.nrp,
    this.satuan,
    this.pangkat,
    this.jenisKelamin,
    this.alamat,
    this.status,
    this.username,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? role;
  String? nama;
  String? nrp;
  String? satuan;
  String? pangkat;
  String? jenisKelamin;
  String? alamat;
  String? status;
  String? username;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    role: json["role"],
    nama: json["nama"],
    nrp: json["nrp"],
    satuan: json["satuan"],
    pangkat: json["pangkat"],
    jenisKelamin: json["jenis_kelamin"],
    alamat: json["alamat"],
    status: json["status"],
    username: json["username"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "role": role,
    "nama": nama,
    "nrp": nrp,
    "satuan": satuan,
    "pangkat": pangkat,
    "jenis_kelamin": jenisKelamin,
    "alamat": alamat,
    "status": status,
    "username": username,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
