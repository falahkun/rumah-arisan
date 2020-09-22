part of 'models.dart';

ChatResult chatResultFromJson(String str) =>
    ChatResult.fromJson(json.decode(str));

String chatResultToJson(ChatResult data) => json.encode(data.toJson());

class ChatResult {
  ChatResult({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  List<ChatData> data;

  factory ChatResult.fromJson(Map<String, dynamic> json) => ChatResult(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<ChatData>.from(
                json["data"].map((x) => ChatData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ChatData {
  ChatData({
    this.nama,
    this.reply,
    this.teks,
    this.notif,
    this.contentFoto,
    this.time,
  });

  String nama;
  bool reply;
  String teks;
  bool notif;
  dynamic contentFoto;
  String time;

  factory ChatData.fromJson(Map<String, dynamic> json) => ChatData(
        nama: json["nama"] == null ? null : json["nama"],
        reply: json["reply"] == null ? null : json["reply"],
        teks: json["teks"] == null ? null : json["teks"],
        notif: json["notif"] == null ? null : json["notif"],
        contentFoto: json["content_foto"],
        time: json["time"] == null ? null : json["time"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama == null ? null : nama,
        "reply": reply == null ? null : reply,
        "teks": teks == null ? null : teks,
        "notif": notif == null ? null : notif,
        "content_foto": contentFoto,
        "time": time == null ? null : time,
      };
}
