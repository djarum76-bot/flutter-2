// To parse this JSON data, do
//
//     final notifikasiModel = notifikasiModelFromJson(jsonString);

import 'dart:convert';

NotifikasiModel notifikasiModelFromJson(String str) => NotifikasiModel.fromJson(json.decode(str));

String notifikasiModelToJson(NotifikasiModel data) => json.encode(data.toJson());

class NotifikasiModel {
  NotifikasiModel({
    this.status,
    this.error,
    this.suratMasuk,
    this.suratKeluar,
  });

  bool? status;
  bool? error;
  SuratMasuk? suratMasuk;
  SuratKeluar? suratKeluar;

  factory NotifikasiModel.fromJson(Map<String, dynamic> json) => NotifikasiModel(
    status: json["status"],
    error: json["error"],
    suratMasuk: SuratMasuk.fromJson(json["surat_masuk"]),
    suratKeluar: SuratKeluar.fromJson(json["surat_keluar"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error": error,
    "surat_masuk": suratMasuk!.toJson(),
    "surat_keluar": suratKeluar!.toJson(),
  };
}

class SuratKeluar {
  SuratKeluar({
    this.data,
    this.message,
  });

  List<SuratKeluarDatum>? data;
  String? message;

  factory SuratKeluar.fromJson(Map<String, dynamic> json) => SuratKeluar(
    data: List<SuratKeluarDatum>.from(json["data"].map((x) => SuratKeluarDatum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class SuratKeluarDatum {
  SuratKeluarDatum({
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

  factory SuratKeluarDatum.fromJson(Map<String, dynamic> json) => SuratKeluarDatum(
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

class SuratMasuk {
  SuratMasuk({
    this.data,
    this.message,
  });

  List<SuratMasukDatum>? data;
  String? message;

  factory SuratMasuk.fromJson(Map<String, dynamic> json) => SuratMasuk(
    data: List<SuratMasukDatum>.from(json["data"].map((x) => SuratMasukDatum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class SuratMasukDatum {
  SuratMasukDatum({
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

  factory SuratMasukDatum.fromJson(Map<String, dynamic> json) => SuratMasukDatum(
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
