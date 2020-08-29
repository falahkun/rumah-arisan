part of 'models.dart';

SubdistrictModel subdistrictModelFromJson(String str) => SubdistrictModel.fromJson(json.decode(str));

String subdistrictModelToJson(SubdistrictModel data) => json.encode(data.toJson());

class SubdistrictModel {
    SubdistrictModel({
        this.status,
        this.message,
        this.data,
    });

    bool status;
    String message;
    List<SubdistrictData> data;

    factory SubdistrictModel.fromJson(Map<String, dynamic> json) => SubdistrictModel(
        status: json["status"],
        message: json["message"],
        data: List<SubdistrictData>.from(json["data"].map((x) => SubdistrictData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class SubdistrictData {
    SubdistrictData({
        this.id,
        this.kabupatenId,
        this.nama,
        this.kodePos,
    });

    String id;
    String kabupatenId;
    String nama;
    String kodePos;

    factory SubdistrictData.fromJson(Map<String, dynamic> json) => SubdistrictData(
        id: json["id"],
        kabupatenId: json["kabupaten_id"],
        nama: json["nama"],
        kodePos: json["kode_pos"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "kabupaten_id": kabupatenId,
        "nama": nama,
        "kode_pos": kodePos,
    };
}