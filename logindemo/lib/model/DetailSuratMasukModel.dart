// To parse this JSON data, do
//
//     final detailSuratMasukModel = detailSuratMasukModelFromJson(jsonString);

import 'dart:convert';

DetailSuratMasukModel detailSuratMasukModelFromJson(String str) => DetailSuratMasukModel.fromJson(json.decode(str));

String detailSuratMasukModelToJson(DetailSuratMasukModel data) => json.encode(data.toJson());

class DetailSuratMasukModel {
  DetailSuratMasukModel({
    this.status,
    this.error,
    this.data,
    this.message,
  });

  bool? status;
  bool? error;
  Data? data;
  String? message;

  factory DetailSuratMasukModel.fromJson(Map<String, dynamic> json) => DetailSuratMasukModel(
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
