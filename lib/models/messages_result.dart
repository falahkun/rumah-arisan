part of 'models.dart';

MessagesResult messagesResultFromJson(String str) =>
    MessagesResult.fromJson(json.decode(str));

String messagesResultToJson(MessagesResult data) => json.encode(data.toJson());

class MessagesResult {
  MessagesResult({
    this.status,
    this.message,
    this.data,
    this.code,
  });

  bool status;
  String message;
  List<MessageData> data;
  int code;

  factory MessagesResult.fromJson(Map<String, dynamic> json) => MessagesResult(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<MessageData>.from(
                json["data"].map((x) => MessageData.fromJson(x))),
        code: json["code"] == null ? null : json["code"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "code": code == null ? null : code,
      };
}

class MessageData {
  MessageData({
    this.id,
    this.tipe,
    this.nama,
    this.placeholder,
    this.token,
    this.title,
    this.foto,
    this.private,
    this.time,
    this.timeCount,
    this.date,
    this.lastChat,
  });

  String id;
  String tipe;
  String nama;
  String placeholder;
  String token;
  dynamic title;
  String foto;
  bool private;
  String time;
  int timeCount;
  DateTime date;
  LastChat lastChat;

  factory MessageData.fromJson(Map<String, dynamic> json) => MessageData(
        id: json["id"] == null ? null : json["id"],
        tipe: json["tipe"] == null ? null : json["tipe"],
        nama: json["nama"] == null ? null : json["nama"],
        placeholder: json["placeholder"] == null ? null : json["placeholder"],
        token: json["token"] == null ? null : json["token"],
        title: json["title"],
        foto: json["foto"] == null ? null : json["foto"],
        private: json["private"] == null ? null : json["private"],
        time: json["time"] == null ? null : json["time"],
        timeCount: json["time_count"] == null ? null : json["time_count"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        lastChat: json["last_chat"] == null
            ? null
            : LastChat.fromJson(json["last_chat"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "tipe": tipe == null ? null : tipe,
        "nama": nama == null ? null : nama,
        "placeholder": placeholder == null ? null : placeholder,
        "token": token == null ? null : token,
        "title": title,
        "foto": foto == null ? null : foto,
        "private": private == null ? null : private,
        "time": time == null ? null : time,
        "time_count": timeCount == null ? null : timeCount,
        "date": date == null
            ? null
            : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "last_chat": lastChat == null ? null : lastChat.toJson(),
      };
}

class LastChat {
  LastChat({
    this.nama,
    this.teks,
    this.time,
  });

  String nama;
  String teks;
  String time;

  factory LastChat.fromJson(Map<String, dynamic> json) => LastChat(
        nama: json["nama"] == null ? null : json["nama"],
        teks: json["teks"] == null ? null : json["teks"],
        time: json["time"] == null ? null : json["time"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama == null ? null : nama,
        "teks": teks == null ? null : teks,
        "time": time == null ? null : time,
      };
}
