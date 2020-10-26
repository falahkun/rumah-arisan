part of 'models.dart';

CfModel cfModelFromJson(String str) => CfModel.fromJson(json.decode(str));

String cfModelToJson(CfModel data) => json.encode(data.toJson());

class CfModel {
  CfModel({
    this.status,
    this.message,
    this.data,
    this.pagination,
  });

  bool status;
  String message;
  List<CfData> data;
  Pagination pagination;

  factory CfModel.fromJson(Map<String, dynamic> json) => CfModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<CfData>.from(json["data"].map((x) => CfData.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination == null ? null : pagination.toJson(),
      };
}

class CfData {
  CfData({
    this.id,
    this.nama,
    this.teks,
    this.dilihat,
    this.waktuUpload,
    this.konten,
    this.komentar,
    this.totalKomentar,
    this.totalSuka,
    this.disukai,
    this.action,
  });

  String id;
  String nama;
  String teks;
  String dilihat;
  String waktuUpload;
  List<Konten> konten;
  List<Komentar> komentar;
  int totalKomentar;
  int totalSuka;
  bool disukai;
  bool action;

  factory CfData.fromJson(Map<String, dynamic> json) => CfData(
        id: json["id"] == null ? null : json["id"],
        nama: json["nama"] == null ? null : json["nama"],
        teks: json["teks"] == null ? null : json["teks"],
        dilihat: json["dilihat"] == null ? null : json["dilihat"],
        waktuUpload: json["waktu_upload"] == null ? null : json["waktu_upload"],
        konten: json["konten"] == null
            ? null
            : List<Konten>.from(json["konten"].map((x) => Konten.fromJson(x))),
        komentar: json["komentar"] == null
            ? null
            : List<Komentar>.from(
                json["komentar"].map((x) => Komentar.fromJson(x))),
        totalKomentar:
            json["total_komentar"] == null ? null : json["total_komentar"],
        totalSuka: json["total_suka"] == null ? null : json["total_suka"],
        disukai: json["disukai"] == null ? null : json["disukai"],
        action: json["action"] == null ? null : json["action"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nama": nama == null ? null : nama,
        "teks": teks == null ? null : teks,
        "dilihat": dilihat == null ? null : dilihat,
        "waktu_upload": waktuUpload == null ? null : waktuUpload,
        "konten": konten == null
            ? null
            : List<dynamic>.from(konten.map((x) => x.toJson())),
        "komentar": komentar == null
            ? null
            : List<dynamic>.from(komentar.map((x) => x.toJson())),
        "total_komentar": totalKomentar == null ? null : totalKomentar,
        "total_suka": totalSuka == null ? null : totalSuka,
        "disukai": disukai == null ? null : disukai,
        "action": action == null ? null : action,
      };
}

class Komentar {
  Komentar({
    this.id,
    this.nama,
    this.slug,
    this.teks,
    this.reply,
  });

  String id;
  String nama;
  String slug;
  String teks;
  List<dynamic> reply;

  factory Komentar.fromJson(Map<String, dynamic> json) => Komentar(
        id: json["id"] == null ? null : json["id"],
        nama: json["nama"] == null ? null : json["nama"],
        slug: json["slug"] == null ? null : json["slug"],
        teks: json["teks"] == null ? null : json["teks"],
        reply: json["reply"] == null
            ? null
            : List<dynamic>.from(json["reply"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nama": nama == null ? null : nama,
        "slug": slug == null ? null : slug,
        "teks": teks == null ? null : teks,
        "reply": reply == null ? null : List<dynamic>.from(reply.map((x) => x)),
      };
}

class Konten {
  Konten({
    this.url,
    this.tipe,
  });

  String url;
  String tipe;

  factory Konten.fromJson(Map<String, dynamic> json) => Konten(
        url: json["url"] == null ? null : json["url"],
        tipe: json["tipe"] == null ? null : json["tipe"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "tipe": tipe == null ? null : tipe,
      };
}
