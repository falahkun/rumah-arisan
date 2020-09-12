
part of 'models.dart';

CommunityResults communityResultsFromJson(String str) => CommunityResults.fromJson(json.decode(str));

String communityResultsToJson(CommunityResults data) => json.encode(data.toJson());

class CommunityResults {
    CommunityResults({
        this.status,
        this.message,
        this.data,
    });

    bool status;
    String message;
    List<CommunityData> data;

    factory CommunityResults.fromJson(Map<String, dynamic> json) => CommunityResults(
        status: json["status"],
        message: json["message"],
        data: List<CommunityData>.from(json["data"].map((x) => CommunityData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}