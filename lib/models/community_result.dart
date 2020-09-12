part of 'models.dart';

CommunityResult communityResultFromJson(String str) => CommunityResult.fromJson(json.decode(str));

String communityResultToJson(CommunityResult data) => json.encode(data.toJson());

class CommunityResult {
    CommunityResult({
        this.status,
        this.message,
        this.data,
    });

    bool status;
    String message;
    CommunityData data;

    factory CommunityResult.fromJson(Map<String, dynamic> json) => CommunityResult(
        status: json["status"],
        message: json["message"],
        data: CommunityData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}