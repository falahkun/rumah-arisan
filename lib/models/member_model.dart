part of 'models.dart';

MemberModel memberModelFromJson(String str) =>
    MemberModel.fromJson(json.decode(str));

String memberModelToJson(MemberModel data) => json.encode(data.toJson());

class MemberModel {
  MemberModel({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  Data data;

  factory MemberModel.fromJson(Map<String, dynamic> json) => MemberModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.nama,
    this.foto,
    this.banner,
    this.slug,
    this.chatToken,
    this.namaProvinsi,
    this.namaKabupaten,
    this.namaKecamatan,
    this.action,
    this.totalFollowers,
    this.totalFollowing,
    this.totalFriends,
    this.followed,
    this.myFriend,
  });

  String id;
  String nama;
  String foto;
  dynamic banner;
  String slug;
  String chatToken;
  dynamic namaProvinsi;
  dynamic namaKabupaten;
  dynamic namaKecamatan;
  bool action;
  String totalFollowers;
  String totalFollowing;
  int totalFriends;
  bool followed;
  MyFriend myFriend;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        nama: json["nama"] == null ? null : json["nama"],
        foto: json["foto"] == null ? null : json["foto"],
        banner: json["banner"],
        slug: json["slug"] == null ? null : json["slug"],
        chatToken: json["chat_token"] == null ? null : json["chat_token"],
        namaProvinsi: json["nama_provinsi"],
        namaKabupaten: json["nama_kabupaten"],
        namaKecamatan: json["nama_kecamatan"],
        action: json["action"] == null ? null : json["action"],
        totalFollowers:
            json["total_followers"] == null ? null : json["total_followers"],
        totalFollowing:
            json["total_following"] == null ? null : json["total_following"],
        totalFriends:
            json["total_friends"] == null ? null : json["total_friends"],
        followed: json["followed"] == null ? null : json["followed"],
        myFriend: json["my_friend"] == null
            ? null
            : MyFriend.fromJson(json["my_friend"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nama": nama == null ? null : nama,
        "foto": foto == null ? null : foto,
        "banner": banner,
        "slug": slug == null ? null : slug,
        "chat_token": chatToken == null ? null : chatToken,
        "nama_provinsi": namaProvinsi,
        "nama_kabupaten": namaKabupaten,
        "nama_kecamatan": namaKecamatan,
        "action": action == null ? null : action,
        "total_followers": totalFollowers == null ? null : totalFollowers,
        "total_following": totalFollowing == null ? null : totalFollowing,
        "total_friends": totalFriends == null ? null : totalFriends,
        "followed": followed == null ? null : followed,
        "my_friend": myFriend == null ? null : myFriend.toJson(),
      };
}

class MyFriend {
  MyFriend({
    this.status,
    this.berteman,
  });

  bool status;
  bool berteman;

  factory MyFriend.fromJson(Map<String, dynamic> json) => MyFriend(
        status: json["status"] == null ? null : json["status"],
        berteman: json["berteman"] == null ? null : json["berteman"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "berteman": berteman == null ? null : berteman,
      };
}
