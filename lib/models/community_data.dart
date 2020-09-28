part of 'models.dart';

class CommunityData {
  CommunityData({
    this.id,
    this.foto,
    this.banner,
    this.nama,
    this.slug,
    this.private,
    this.catatan,
    this.deskripsi,
    this.totalMember,
    this.totalDiskusi,
    this.members,
    this.action,
    this.info,
    this.join,
    this.catatanDiblokir,
    this.diblokir,
    this.totalAnggota,
  });

  String id;
  String foto;
  String banner;
  String nama;
  String slug;
  bool private;
  String catatan;
  String deskripsi;
  String totalMember;
  List<CommunityMember> members;
  String totalDiskusi;
  String diblokir;
  String catatanDiblokir;
  String totalAnggota;
  bool action;
  Info info;
  Join join;

  factory CommunityData.fromJson(Map<String, dynamic> json) => CommunityData(
      id: json["id"] == null ? null : json["id"],
      foto: json["foto"] == null ? null : json["foto"],
      banner: json["banner"] == null ? null : json["banner"],
      nama: json["nama"] == null ? null : json["nama"],
      slug: json["slug"] == null ? null : json["slug"],
      private: json["private"] == null ? null : json["private"],
      catatan: json["catatan"] == null ? null : json["catatan"],
      deskripsi: json["deskripsi"] == null ? null : json["deskripsi"],
      totalMember: json["total_member"] == null ? null : json["total_member"],
      totalDiskusi:
          json["total_diskusi"] == null ? null : json["total_diskusi"],
      members: json["members"] == null
          ? null
          : List<CommunityMember>.from(
              json["members"].map((x) => CommunityMember.fromJson(x))),
      action: json["action"] == null ? null : json["action"],
      info: json["info"] == null ? null : Info.fromJson(json["info"]),
      join: json["join"] == null ? null : Join.fromJson(json["join"]),
      diblokir: json['diblokir'] == null ? "" : json['diblokir'],
      catatanDiblokir:
          json['catatan_diblokir'] == null ? "" : json['catatan_diblokir'],
      totalAnggota: json['total_anggota'] == null ? "" : json['total_anggota']);

  Map<String, dynamic> toJson() => {
        "id": id == null ? "" : id,
        "komunitas_id": id == null ? "" : id,
        "foto": foto == null ? "" : foto,
        "banner": banner == null ? "" : banner,
        "nama": nama == null ? "" : nama,
        "slug": slug == null ? "" : slug,
        "private": private ? "1" : "0",
        "catatan": catatan == null ? "" : catatan,
        "deskripsi": deskripsi == null ? "" : deskripsi,
        "total_member": totalMember == null ? "" : totalMember,
        "total_diskusi": totalDiskusi == null ? "" : totalDiskusi,
        "members": members == null
            ? ""
            : List<dynamic>.from(members.map((x) => x.toJson())),
        "action": action == null ? "" : action,
        "info": info == null ? "" : info.toJson(),
        "join": join == null ? "" : join.toJson(),
        "catatan_diblokir": catatanDiblokir == null ? "" : catatanDiblokir,
        "total_anggota": totalAnggota == null ? "" : totalAnggota,
        "diblokir": diblokir == null ? "" : diblokir
      };
}

class Info {
  Info({
    this.id,
    this.slug,
    this.nama,
    this.namaProvinsi,
    this.namaKabupaten,
    this.namaKecamatan,
  });

  String id;
  String slug;
  String nama;
  dynamic namaProvinsi;
  dynamic namaKabupaten;
  dynamic namaKecamatan;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        id: json["id"],
        slug: json["slug"],
        nama: json["nama"],
        namaProvinsi: json["nama_provinsi"],
        namaKabupaten: json["nama_kabupaten"],
        namaKecamatan: json["nama_kecamatan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "nama": nama,
        "nama_provinsi": namaProvinsi,
        "nama_kabupaten": namaKabupaten,
        "nama_kecamatan": namaKecamatan,
      };
}

class Join {
  Join({
    this.status,
    this.ever,
  });

  bool status;
  bool ever;

  factory Join.fromJson(Map<String, dynamic> json) => Join(
        status: json["status"],
        ever: json["ever"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "ever": ever,
      };
}

class CommunityMember {
  CommunityMember({
    this.id,
    this.foto,
    this.nama,
    this.slug,
    this.totalFriends,
    this.totalCloter,
    this.adminKomunitas,
  });

  String id;
  String foto;
  String nama;
  String slug;
  int totalFriends;
  int totalCloter;
  bool adminKomunitas;

  factory CommunityMember.fromJson(Map<String, dynamic> json) =>
      CommunityMember(
        id: json["id"] == null ? null : json["id"],
        foto: json["foto"] == null ? null : json["foto"],
        nama: json["nama"] == null ? null : json["nama"],
        slug: json["slug"] == null ? null : json["slug"],
        totalFriends:
            json["total_friends"] == null ? null : json["total_friends"],
        totalCloter: json["total_cloter"] == null ? null : json["total_cloter"],
        adminKomunitas:
            json["admin_komunitas"] == null ? null : json["admin_komunitas"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "foto": foto == null ? null : foto,
        "nama": nama == null ? null : nama,
        "slug": slug == null ? null : slug,
        "total_friends": totalFriends == null ? null : totalFriends,
        "total_cloter": totalCloter == null ? null : totalCloter,
        "admin_komunitas": adminKomunitas == null ? null : adminKomunitas,
      };
}
