part of 'models.dart';

CloterResult cloterResultFromJson(String str) =>
    CloterResult.fromJson(json.decode(str));

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
        status: json["status"] == null ? null : json['status'],
        message: json["message"] == null ? null : json['message'],
        data: json['data'] == null
            ? []
            : List<CloterData>.from(
                json["data"].map((x) => CloterData.fromJson(x))),
        pagination: json['pagination'] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class CloterData {
  CloterData(
      {this.id,
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
      this.anggota,
      this.deskripsi});

  String id;
  String foto;
  String nama;
  String slug;
  String namaOwner;
  String kuota;
  String tipe;
  String sistem;
  String deskripsi;
  String anggota;
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
      id: json["id"] == null ? null : json['id'],
      foto: json["foto"] == null ? null : json["foto"],
      nama: json["nama"] == null ? null : json['nama'],
      slug: json["slug"] == null ? null : json['slug'],
      namaOwner: json["nama_owner"] == null ? null : json['nama_owner'],
      kuota: json["kuota"] == null ? null : json['kuota'],
      tipe: json["tipe"] == null ? null : json['tipe'],
      sistem: json["sistem"] == null ? null : json['sistem'],
      angsuran: json["angsuran"] == null ? null : json['angsuran'],
      tglMulai: json["tgl_mulai"] == null ? null : json['tgl_mulai'],
      tglSelesai: json["tgl_selesai"] == null ? null : json['tgl_selesai'],
      private: json["private"] == null ? null : json['private'],
      status: json["status"] == null ? null : json['status'],
      diblokir: json["diblokir"] == null ? null : json['diblokir'],
      catatanDiblokir:
          json["catatan_diblokir"] == null ? null : json['catatan_diblokir'],
      namaProvinsi:
          json["nama_provinsi"] == null ? null : json['nama_provinsi'],
      namaKabupaten:
          json["nama_kabupaten"] == null ? null : json['nama_kabupaten'],
      namaKecamatan:
          json["nama_kecamatan"] == null ? null : json['nama_kecamatan'],
      joined: json["joined"] == null ? null : json['joined'],
      token: json["token"] == null ? null : json['token'],
      anggota: json['anggota'] == null ? "" : json['anggota'],
      deskripsi: json['deskripsi'] == null ? "" : json['deskripsi']);

  Map<String, dynamic> toJson() => {
        "id": id == null ? "" : id,
        "foto": foto == null ? null : foto,
        "nama": nama == null ? "" : nama,
        "slug": slug == null ? "" : slug,
        "nama_owner": namaOwner == null ? "" : namaOwner,
        "kuota": kuota == null ? "" : kuota,
        "tipe": tipe == null ? "" : tipe,
        "sistem": sistem == null ? "" : sistem,
        "angsuran": angsuran == null ? "" : angsuran,
        "tgl_mulai": tglMulai == null ? "" : tglMulai,
        "tgl_selesai": tglSelesai == null ? "" : tglSelesai,
        "private": private ? "1" : "0",
        "status": status == null ? "" : status,
        "diblokir": diblokir == null ? "" : diblokir,
        "catatan_diblokir": catatanDiblokir == null ? "" : catatanDiblokir,
        "nama_provinsi": namaProvinsi == null ? "" : namaProvinsi,
        "nama_kabupaten": namaKabupaten == null ? "" : namaKabupaten,
        "nama_kecamatan": namaKecamatan == null ? "" : namaKecamatan,
        "joined": joined == null ? "" : joined,
        "token": token == null ? "" : token,
        "anggota": anggota == null ? "" : anggota,
        "deskripsi": deskripsi == null ? "" : deskripsi
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
        status: json["status"] == null ? null : json['status'],
        mulai: json["mulai"] == null ? null : json['mulai'],
        halamanAktif:
            json["halaman_aktif"] == null ? null : json['halaman_aktif'],
        jmlData: json["jml_data"] == null ? null : json['jml_data'],
        jmlHalaman: json["jml_halaman"] == null ? null : json['jml_halaman'],
        infoHalaman: json["info_halaman"] == null ? null : json['info_halaman'],
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
