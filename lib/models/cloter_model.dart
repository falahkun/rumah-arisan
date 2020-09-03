part of 'models.dart';

CloterResult cloterResultFromJson(String str) => CloterResult.fromJson(json.decode(str));

String cloterResultToJson(CloterResult data) => json.encode(data.toJson());

class CloterResult {
    CloterResult({
        this.status,
        this.message,
        this.data,
        this.pagination,
    });

    bool status;
    String message;
    List<CloterData> data;
    Pagination pagination;

    factory CloterResult.fromJson(Map<String, dynamic> json) => CloterResult(
        status: json["status"],
        message: json["message"],
        data: List<CloterData>.from(json["data"].map((x) => CloterData.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
    };
}

class CloterData {
    CloterData({
        this.id,
        this.foto,
        this.nama,
        this.slug,
        this.namaOwner,
        this.kuota,
        this.tipe,
        this.sistem,
        this.angsuran,
        this.tglMulai,
        this.tglSelesai,
        this.private,
        this.status,
        this.diblokir,
        this.catatanDiblokir,
        this.namaProvinsi,
        this.namaKabupaten,
        this.namaKecamatan,
        this.joined,
        this.token,
    });

    String id;
    String foto;
    String nama;
    String slug;
    String namaOwner;
    String kuota;
    String tipe;
    String sistem;
    dynamic angsuran;
    dynamic tglMulai;
    dynamic tglSelesai;
    bool private;
    String status;
    String diblokir;
    dynamic catatanDiblokir;
    dynamic namaProvinsi;
    dynamic namaKabupaten;
    dynamic namaKecamatan;
    bool joined;
    String token;

    factory CloterData.fromJson(Map<String, dynamic> json) => CloterData(
        id: json["id"],
        foto: json["foto"] == null ? null : json["foto"],
        nama: json["nama"],
        slug: json["slug"],
        namaOwner: json["nama_owner"],
        kuota: json["kuota"],
        tipe: json["tipe"],
        sistem: json["sistem"],
        angsuran: json["angsuran"],
        tglMulai: json["tgl_mulai"],
        tglSelesai: json["tgl_selesai"],
        private: json["private"],
        status: json["status"],
        diblokir: json["diblokir"],
        catatanDiblokir: json["catatan_diblokir"],
        namaProvinsi: json["nama_provinsi"],
        namaKabupaten: json["nama_kabupaten"],
        namaKecamatan: json["nama_kecamatan"],
        joined: json["joined"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "foto": foto == null ? null : foto,
        "nama": nama,
        "slug": slug,
        "nama_owner": namaOwner,
        "kuota": kuota,
        "tipe": tipe,
        "sistem": sistem,
        "angsuran": angsuran,
        "tgl_mulai": tglMulai,
        "tgl_selesai": tglSelesai,
        "private": private,
        "status": status,
        "diblokir": diblokir,
        "catatan_diblokir": catatanDiblokir,
        "nama_provinsi": namaProvinsi,
        "nama_kabupaten": namaKabupaten,
        "nama_kecamatan": namaKecamatan,
        "joined": joined,
        "token": token,
    };
}

class Pagination {
    Pagination({
        this.status,
        this.mulai,
        this.halamanAktif,
        this.jmlData,
        this.jmlHalaman,
        this.infoHalaman,
    });

    bool status;
    int mulai;
    int halamanAktif;
    int jmlData;
    int jmlHalaman;
    String infoHalaman;

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        status: json["status"],
        mulai: json["mulai"],
        halamanAktif: json["halaman_aktif"],
        jmlData: json["jml_data"],
        jmlHalaman: json["jml_halaman"],
        infoHalaman: json["info_halaman"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "mulai": mulai,
        "halaman_aktif": halamanAktif,
        "jml_data": jmlData,
        "jml_halaman": jmlHalaman,
        "info_halaman": infoHalaman,
    };
}
