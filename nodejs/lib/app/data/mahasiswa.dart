// To parse this JSON data, do
//
//     final mahasiswaModel = mahasiswaModelFromJson(jsonString);

import 'dart:convert';

MahasiswaModel mahasiswaModelFromJson(String str) => MahasiswaModel.fromJson(json.decode(str));

String mahasiswaModelToJson(MahasiswaModel data) => json.encode(data.toJson());

class MahasiswaModel {
  MahasiswaModel({
    this.status,
    this.values,
  });

  int? status;
  List<Value>? values;

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) => MahasiswaModel(
    status: json["status"],
    values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "values": List<dynamic>.from(values!.map((x) => x.toJson())),
  };
}

class Value {
  Value({
    this.idMahasiswa,
    this.nim,
    this.nama,
    this.jurusan,
    this.matakuliah,
    this.sks,
  });

  int? idMahasiswa;
  int? nim;
  String? nama;
  String? jurusan;
  dynamic matakuliah;
  dynamic sks;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    idMahasiswa: json["id_mahasiswa"],
    nim: json["nim"],
    nama: json["nama"],
    jurusan: json["jurusan"],
    matakuliah: json["matakuliah"],
    sks: json["sks"],
  );

  Map<String, dynamic> toJson() => {
    "id_mahasiswa": idMahasiswa,
    "nim": nim,
    "nama": nama,
    "jurusan": jurusan,
    "matakuliah": matakuliah,
    "sks": sks,
  };
}
