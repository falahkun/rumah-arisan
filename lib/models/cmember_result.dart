part of 'models.dart';

CMemberResult cMemberResultFromJson(String str) => CMemberResult.fromJson(json.decode(str));

String cMemberResultToJson(CMemberResult data) => json.encode(data.toJson());

class CMemberResult {
  CMemberResult({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  List<MemberData> data;

  factory CMemberResult.fromJson(Map<String, dynamic> json) => CMemberResult(
    status: json["status"],
    message: json["message"],
    data: List<MemberData>.from(json["data"].map((x) => MemberData.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MemberData {
  MemberData({
    this.id,
    this.foto,
    this.nama,
    this.slug,
    this.namaCloter,
    this.friends,
    this.adminCloter,
    this.arisanDiikuti,
    this.action,
    this.disabled,
  });

  String id;
  String foto;
  String nama;
  String slug;
  String namaCloter;
  int friends;
  bool adminCloter;
  String arisanDiikuti;
  bool action;
  bool disabled;

  factory MemberData.fromJson(Map<String, dynamic> json) => MemberData(
    id: json["id"],
    foto: json["foto"],
    nama: json["nama"],
    slug: json["slug"],
    namaCloter: json["nama_cloter"],
    friends: json["friends"],
    adminCloter: json["admin_cloter"],
    arisanDiikuti: json["arisan_diikuti"],
    action: json["action"],
    disabled: json["disabled"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "foto": foto,
    "nama": nama,
    "slug": slug,
    "nama_cloter": namaCloter,
    "friends": friends,
    "admin_cloter": adminCloter,
    "arisan_diikuti": arisanDiikuti,
    "action": action,
    "disabled": disabled,
  };
}


