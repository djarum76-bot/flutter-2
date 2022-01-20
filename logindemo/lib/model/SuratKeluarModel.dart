// To parse this JSON data, do
//
//     final suratKeluarModel = suratKeluarModelFromJson(jsonString);

import 'dart:convert';

SuratKeluarModel suratKeluarModelFromJson(String str) => SuratKeluarModel.fromJson(json.decode(str));

String suratKeluarModelToJson(SuratKeluarModel data) => json.encode(data.toJson());

class SuratKeluarModel {
  SuratKeluarModel({
    this.status,
    this.error,
    this.data,
    this.message,
  });

  bool? status;
  bool? error;
  List<Datum>? data;
  String? message;

  factory SuratKeluarModel.fromJson(Map<String, dynamic> json) => SuratKeluarModel(
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
    this.klasifikasiTujuan,
    this.tgl,
    this.klasifikasiSurat,
    this.noSurat,
    this.lampiran,
    this.kepada,
    this.perihal,
    this.isi,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? klasifikasiTujuan;
  DateTime? tgl;
  String? klasifikasiSurat;
  String? noSurat;
  String? lampiran;
  String? kepada;
  String? perihal;
  String? isi;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    klasifikasiTujuan: json["klasifikasi_tujuan"],
    tgl: DateTime.parse(json["tgl"]),
    klasifikasiSurat: json["klasifikasi_surat"],
    noSurat: json["no_surat"],
    lampiran: json["lampiran"],
    kepada: json["kepada"],
    perihal: json["perihal"],
    isi: json["isi"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "klasifikasi_tujuan": klasifikasiTujuan,
    "tgl": "${tgl!.year.toString().padLeft(4, '0')}-${tgl!.month.toString().padLeft(2, '0')}-${tgl!.day.toString().padLeft(2, '0')}",
    "klasifikasi_surat": klasifikasiSurat,
    "no_surat": noSurat,
    "lampiran": lampiran,
    "kepada": kepada,
    "perihal": perihal,
    "isi": isi,
    "status": status,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
