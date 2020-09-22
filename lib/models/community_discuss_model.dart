part of 'models.dart';

CommunityDiscuss communityDiscussFromJson(String str) =>
    CommunityDiscuss.fromJson(json.decode(str));

String communityDiscussToJson(CommunityDiscuss data) =>
    json.encode(data.toJson());

class CommunityDiscuss {
  CommunityDiscuss({
    this.status,
    this.message,
    this.data,
    this.pagination,
    this.akses,
  });

  bool status;
  String message;
  List<ComDiscussData> data;
  Pagination pagination;
  bool akses;

  factory CommunityDiscuss.fromJson(Map<String, dynamic> json) =>
      CommunityDiscuss(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<ComDiscussData>.from(
                json["data"].map((x) => ComDiscussData.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
        akses: json["akses"] == null ? null : json["akses"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination == null ? null : pagination.toJson(),
        "akses": akses == null ? null : akses,
      };
}

class ComDiscussData {
  ComDiscussData({
    this.id,
    this.teks,
    this.date,
    this.nama,
    this.foto,
    this.admin,
    this.action,
    this.reply,
  });

  String id;
  String teks;
  String date;
  String nama;
  String foto;
  bool admin;
  bool action;
  List<ComDiscussData> reply;

  factory ComDiscussData.fromJson(Map<String, dynamic> json) => ComDiscussData(
        id: json["id"] == null ? null : json["id"],
        teks: json["teks"] == null ? null : json["teks"],
        date: json["date"] == null ? null : json["date"],
        nama: json["nama"] == null ? null : json["nama"],
        foto: json["foto"] == null ? null : json["foto"],
        admin: json["admin"] == null ? null : json["admin"],
        action: json["action"] == null ? null : json["action"],
        reply: json["reply"] == null
            ? null
            : List<ComDiscussData>.from(
                json["reply"].map((x) => ComDiscussData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "teks": teks == null ? null : teks,
        "date": date == null ? null : date,
        "nama": nama == null ? null : nama,
        "foto": foto == null ? null : foto,
        "admin": admin == null ? null : admin,
        "action": action == null ? null : action,
        "reply": reply == null
            ? null
            : List<dynamic>.from(reply.map((x) => x.toJson())),
      };
}
