// To parse this JSON data, do
//
//     final detailDisposisiModel = detailDisposisiModelFromJson(jsonString);

import 'dart:convert';

DetailDisposisiModel detailDisposisiModelFromJson(String str) => DetailDisposisiModel.fromJson(json.decode(str));

String detailDisposisiModelToJson(DetailDisposisiModel data) => json.encode(data.toJson());

class DetailDisposisiModel {
  DetailDisposisiModel({
    this.status,
    this.error,
    this.data,
    this.message,
  });

  bool? status;
  bool? error;
  Data? data;
  String? message;

  factory DetailDisposisiModel.fromJson(Map<String, dynamic> json) => DetailDisposisiModel(
    status: json["status"],
    error: json["error"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error": error,
    "data": data!.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    this.id,
    this.kepada,
    this.noAgenda,
    this.pengirim,
    this.noSurat,
    this.tglSurat,
    this.perihal,
    this.isi,
    this.tglDiterima,
    this.waktuDiterima,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? kepada;
  String? noAgenda;
  String? pengirim;
  String? noSurat;
  DateTime? tglSurat;
  String? perihal;
  String? isi;
  DateTime? tglDiterima;
  String? waktuDiterima;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    kepada: json["kepada"],
    noAgenda: json["no_agenda"],
    pengirim: json["pengirim"],
    noSurat: json["no_surat"],
    tglSurat: DateTime.parse(json["tgl_surat"]),
    perihal: json["perihal"],
    isi: json["isi"],
    tglDiterima: DateTime.parse(json["tgl_diterima"]),
    waktuDiterima: json["waktu_diterima"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "kepada": kepada,
    "no_agenda": noAgenda,
    "pengirim": pengirim,
    "no_surat": noSurat,
    "tgl_surat": "${tglSurat!.year.toString().padLeft(4, '0')}-${tglSurat!.month.toString().padLeft(2, '0')}-${tglSurat!.day.toString().padLeft(2, '0')}",
    "perihal": perihal,
    "isi": isi,
    "tgl_diterima": "${tglDiterima!.year.toString().padLeft(4, '0')}-${tglDiterima!.month.toString().padLeft(2, '0')}-${tglDiterima!.day.toString().padLeft(2, '0')}",
    "waktu_diterima": waktuDiterima,
    "status": status,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
