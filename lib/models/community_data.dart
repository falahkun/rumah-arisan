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
        this.action,
        this.info,
        this.join,
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
    String totalDiskusi;
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
        totalDiskusi: json["total_diskusi"] == null ? null : json["total_diskusi"],
        action: json["action"] == null ? null : json["action"],
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        join: json["join"] == null ? null : Join.fromJson(json["join"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "foto": foto == null ? null : foto,
        "banner": banner == null ? null : banner,
        "nama": nama == null ? null : nama,
        "slug": slug == null ? null : slug,
        "private": private == null ? null : private,
        "catatan": catatan == null ? null : catatan,
        "deskripsi": deskripsi == null ? null : deskripsi,
        "total_member": totalMember == null ? null : totalMember,
        "total_diskusi": totalDiskusi == null ? null : totalDiskusi,
        "action": action == null ? null : action,
        "info": info == null ? null : info.toJson(),
        "join": join == null ? null : join.toJson(),
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