part of 'models.dart';

UpdateNotifModel updateNotifModelFromJson(String str) =>
    UpdateNotifModel.fromJson(json.decode(str));

String updateNotifModelToJson(UpdateNotifModel data) =>
    json.encode(data.toJson());

class UpdateNotifModel {
  UpdateNotifModel({
    this.status,
    this.message,
    this.data,
    this.pagination,
  });

  bool status;
  String message;
  List<UpdateNotifData> data;
  Pagination pagination;

  factory UpdateNotifModel.fromJson(Map<String, dynamic> json) =>
      UpdateNotifModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<UpdateNotifData>.from(
                json["data"].map((x) => UpdateNotifData.fromJson(x))),
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

class UpdateNotifData {
  UpdateNotifData({
    this.id,
    this.tipe,
    this.icon,
    this.judul,
    this.deskripsi,
    this.dibaca,
    this.tab,
    this.tanggal,
    this.komunitas,
    this.friends,
  });

  String id;
  String tipe;
  String icon;
  String judul;
  String deskripsi;
  bool dibaca;
  String tab;
  DateTime tanggal;
  dynamic komunitas;
  Friends friends;

  factory UpdateNotifData.fromJson(Map<String, dynamic> json) =>
      UpdateNotifData(
        id: json["id"] == null ? null : json["id"],
        tipe: json["tipe"] == null ? null : json["tipe"],
        icon: json["icon"] == null ? null : json["icon"],
        judul: json["judul"] == null ? null : json["judul"],
        deskripsi: json["deskripsi"] == null ? null : json["deskripsi"],
        dibaca: json["dibaca"] == null ? null : json["dibaca"],
        tab: json["tab"] == null ? null : json["tab"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        komunitas: json["komunitas"],
        friends:
            json["friends"] == null ? null : Friends.fromJson(json["friends"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "tipe": tipe == null ? null : tipe,
        "icon": icon == null ? null : icon,
        "judul": judul == null ? null : judul,
        "deskripsi": deskripsi == null ? null : deskripsi,
        "dibaca": dibaca == null ? null : dibaca,
        "tab": tab == null ? null : tab,
        "tanggal": tanggal == null ? null : tanggal.toIso8601String(),
        "komunitas": komunitas,
        "friends": friends == null ? null : friends.toJson(),
      };
}

class Friends {
  Friends({
    this.id,
    this.slug,
    this.berteman,
    this.action,
    this.join,
  });

  String id;
  String slug;
  bool berteman;
  bool action;
  bool join;

  factory Friends.fromJson(Map<String, dynamic> json) => Friends(
        id: json["id"] == null ? null : json["id"],
        slug: json["slug"] == null ? null : json["slug"],
        berteman: json["berteman"] == null ? null : json["berteman"],
        action: json["action"] == null ? null : json["action"],
        join: json["join"] == null ? null : json["join"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "slug": slug == null ? null : slug,
        "berteman": berteman == null ? null : berteman,
        "action": action == null ? null : action,
        "join": join == null ? null : join,
      };
}
