part of 'models.dart';

class TokenResult {
  bool status;
  String message;
  DataResultToken data;

  TokenResult({this.status, this.message, this.data});

  factory TokenResult.fromJson(Map<String, dynamic> json) => TokenResult(
      data: DataResultToken.fromJson(json['data']),
      message: json['message'],
      status: json['status']);
}

class DataResultToken {
  String token;
  String email;
  String telepon;
  String foto;
  String nama;
  String slug;
  String statusMember;
  String status;
  String akses;
  bool diblokir;
  String catatanDiblokir;
  String followers;
  String following;
  String defaultFollower;

  DataResultToken(
      {this.akses,
      this.token,
      this.catatanDiblokir,
      this.defaultFollower,
      this.diblokir,
      this.email,
      this.followers,
      this.following,
      this.foto,
      this.nama,
      this.slug,
      this.status,
      this.statusMember,
      this.telepon});

  factory DataResultToken.fromJson(Map<String, dynamic> json) =>
      DataResultToken(
          akses: json['akses'],
          catatanDiblokir: json['catatan_diblokir'],
          defaultFollower: json['default_follower'],
          diblokir: json['diblokir'],
          email: json['email'],
          followers: json['followers'],
          following: json['following'],
          foto: json['foto'],
          nama: json['nama'],
          slug: json['slug'],
          status: json['status'],
          statusMember: json['status_member'],
          telepon: json['telepon']);
}
