part of 'models.dart';

SliderResult sliderResultFromJson(String str) => SliderResult.fromJson(json.decode(str));

String sliderResultToJson(SliderResult data) => json.encode(data.toJson());

class SliderResult {
    SliderResult({
        this.status,
        this.message,
        this.data,
    });

    bool status;
    String message;
    List<Slider> data;

    factory SliderResult.fromJson(Map<String, dynamic> json) => SliderResult(
        status: json["status"],
        message: json["message"],
        data: List<Slider>.from(json["data"].map((x) => Slider.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Slider {
    Slider({
        this.judul,
        this.slug,
        this.banner,
    });

    String judul;
    String slug;
    String banner;

    factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        judul: json["judul"],
        slug: json["slug"],
        banner: json["banner"],
    );

    Map<String, dynamic> toJson() => {
        "judul": judul,
        "slug": slug,
        "banner": banner,
    };
}
