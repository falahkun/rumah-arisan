part of 'models.dart';

CloterDetailResult cloterDetailResultFromJson(String str) => CloterDetailResult.fromJson(json.decode(str));

String cloterDetailResultToJson(CloterDetailResult cdetailData) => json.encode(cdetailData.toJson());

class CloterDetailResult {
  CloterDetailResult({
    this.status,
    this.message,
    this.cdetailData,
  });

  bool status;
  String message;
  CdetailData cdetailData;

  factory CloterDetailResult.fromJson(Map<String, dynamic> json) => CloterDetailResult(
    status: json["status"],
    message: json["message"],
    cdetailData: CdetailData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": cdetailData.toJson(),
  };
}

class CdetailData {
  CdetailData({
    this.id,
    this.foto,
    this.nama,
    this.userId,
    this.slug,
    this.namaOwner,
    this.slugOwner,
    this.deskripsi,
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
    this.action,
    this.joined,
    this.token,
  });

  String id;
  List<Foto> foto;
  String nama;
  String userId;
  String slug;
  String namaOwner;
  String slugOwner;
  String deskripsi;
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
  bool action;
  bool joined;
  String token;

  factory CdetailData.fromJson(Map<String, dynamic> json) => CdetailData(
    id: json["id"],
    foto: List<Foto>.from(json["foto"].map((x) => Foto.fromJson(x))),
    nama: json["nama"],
    userId: json["user_id"],
    slug: json["slug"],
    namaOwner: json["nama_owner"],
    slugOwner: json["slug_owner"],
    deskripsi: json["deskripsi"],
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
    action: json["action"],
    joined: json["joined"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "foto": List<dynamic>.from(foto.map((x) => x.toJson())),
    "nama": nama,
    "user_id": userId,
    "slug": slug,
    "nama_owner": namaOwner,
    "slug_owner": slugOwner,
    "deskripsi": deskripsi,
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
    "action": action,
    "joined": joined,
    "token": token,
  };
}

class Foto {
  Foto({
    this.id,
    this.foto,
  });

  String id;
  String foto;

  factory Foto.fromJson(Map<String, dynamic> json) => Foto(
    id: json["id"],
    foto: json["foto"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "foto": foto,
  };
}