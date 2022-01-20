class Ayat {
  String? ar;
  String? id;
  String? tr;
  String? nomor;

  Ayat({this.ar, this.id, this.tr, this.nomor});

  Ayat.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    id = json['id'];
    tr = json['tr'];
    nomor = json['nomor'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ar'] = ar;
    data['id'] = id;
    data['tr'] = tr;
    data['nomor'] = nomor;
    return data;
  }
}
