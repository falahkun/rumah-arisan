part of 'models.dart';

CategoryResult categoryResultFromJson(String str) => CategoryResult.fromJson(json.decode(str));

String categoryResultToJson(CategoryResult data) => json.encode(data.toJson());

class CategoryResult {
    CategoryResult({
        this.status,
        this.message,
        this.data,
    });

    bool status;
    String message;
    List<CategoryData> data;

    factory CategoryResult.fromJson(Map<String, dynamic> json) => CategoryResult(
        status: json["status"],
        message: json["message"],
        data: List<CategoryData>.from(json["data"].map((x) => CategoryData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CategoryData {
    CategoryData({
        this.icon,
        this.nama,
        this.slug,
        this.sub,
    });

    String icon;
    String nama;
    String slug;
    List<CategoryData> sub;

    factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        icon: json["icon"] == null ? null : json["icon"],
        nama: json["nama"],
        slug: json["slug"],
        sub: json["sub"] == null ? null : List<CategoryData>.from(json["sub"].map((x) => CategoryData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "icon": icon == null ? null : icon,
        "nama": nama,
        "slug": slug,
        "sub": sub == null ? null : List<dynamic>.from(sub.map((x) => x.toJson())),
    };
}