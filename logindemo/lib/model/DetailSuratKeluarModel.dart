// To parse this JSON data, do
//
//     final detailSuratKeluarModel = detailSuratKeluarModelFromJson(jsonString);

import 'dart:convert';

DetailSuratKeluarModel detailSuratKeluarModelFromJson(String str) => DetailSuratKeluarModel.fromJson(json.decode(str));

String detailSuratKeluarModelToJson(DetailSuratKeluarModel data) => json.encode(data.toJson());

class DetailSuratKeluarModel {
  DetailSuratKeluarModel({
    this.status,
    this.error,
    this.data,
    this.message,
  });

  bool? status;
  bool? error;
  Data? data;
  String? message;

  factory DetailSuratKeluarModel.fromJson(Map<String, dynamic> json) => DetailSuratKeluarModel(
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
