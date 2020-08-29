part of 'models.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel userModel) => json.encode(userModel.toJson());

class UserModel {
    UserModel({
        this.status,
        this.message,
        this.data,
    });

    bool status;
    String message;
    UserData data;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        message: json["message"],
        data: json['data'] == null ? null : UserData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class UserData {
    UserData({
        this.nama,
        this.jenisKelamin,
        this.tempatLahir,
        this.tanggalLahir,
        this.alamat,
        this.kecamatanId,
        this.kodePos,
        this.memberToken,
        this.kode
    });

    String nama;
    dynamic jenisKelamin;
    dynamic tempatLahir;
    dynamic tanggalLahir;
    dynamic alamat;
    dynamic kecamatanId;
    dynamic kodePos;
    String memberToken;
    String kode;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        nama: json["nama"],
        jenisKelamin: json["jenis_kelamin"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: json["tanggal_lahir"],
        alamat: json["alamat"],
        kecamatanId: json["kecamatan_id"],
        kodePos: json["kode_pos"],
        memberToken: json['member_token'],
        kode: json['kode'],
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "jenis_kelamin": jenisKelamin,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir": tanggalLahir,
        "alamat": alamat,
        "kecamatan_id": kecamatanId,
        "kode_pos": kodePos,
        "member_token":memberToken,
        "kode":kode
    };
}
