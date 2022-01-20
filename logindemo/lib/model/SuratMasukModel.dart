// To parse this JSON data, do
//
//     final suratMasukModel = suratMasukModelFromJson(jsonString);

import 'dart:convert';

SuratMasukModel suratMasukModelFromJson(String str) => SuratMasukModel.fromJson(json.decode(str));

String suratMasukModelToJson(SuratMasukModel data) => json.encode(data.toJson());

class SuratMasukModel {
  SuratMasukModel({
    this.status,
    this.error,
    this.data,
    this.message,
  });

  bool? status;
  bool? error;
  List<Datum>? data;
  String? message;

  factory SuratMasukModel.fromJson(Map<String, dynamic> json) => SuratMasukModel(
    status: json["status"],
    error: json["error"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error": error,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  Datum({
    this.id,
    this.tgl,
    this.noAgenda,
    this.noSurat,
    this.tglSurat,
    this.lampiran,
    this.pengirim,
    this.perihal,
    this.status,
    this.fileSurat,
    this.diteruskan,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  DateTime? tgl;
  String? noAgenda;
  String? noSurat;
  DateTime? tglSurat;
  String? lampiran;
  String? pengirim;
  String? perihal;
  String? status;
  String? fileSurat;
  String? diteruskan;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    tgl: DateTime.parse(json["tgl"]),
    noAgenda: json["no_agenda"],
    noSurat: json["no_surat"],
    tglSurat: DateTime.parse(json["tgl_surat"]),
    lampiran: json["lampiran"],
    pengirim: json["pengirim"],
    perihal: json["perihal"],
    status: json["status"],
    fileSurat: json["file_surat"],
    diteruskan: json["diteruskan"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tgl": "${tgl!.year.toString().padLeft(4, '0')}-${tgl!.month.toString().padLeft(2, '0')}-${tgl!.day.toString().padLeft(2, '0')}",
    "no_agenda": noAgenda,
    "no_surat": noSurat,
    "tgl_surat": "${tglSurat!.year.toString().padLeft(4, '0')}-${tglSurat!.month.toString().padLeft(2, '0')}-${tglSurat!.day.toString().padLeft(2, '0')}",
    "lampiran": lampiran,
    "pengirim": pengirim,
    "perihal": perihal,
    "status": status,
    "file_surat": fileSurat,
    "diteruskan": diteruskan,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
