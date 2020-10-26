part of 'services.dart';

class ChatServices {
  static Future<MessagesResult> fetchMessages(String memberToken) async {
    try {
      final response = await getRequest("chat", memberToken: memberToken);

      return messagesResultFromJson(response.body);
    } catch (e) {
      print(e.toString());
      return MessagesResult(status: false, message: "Can't connect to server");
    }
  }

  static Future<ChatResult> fetchChat(String memberToken,
      {String token, String id}) async {
    try {
      final response = await postRequest("chat/load",
          memberToken: memberToken, body: {'token': token, 'id': id ?? ""});

      ChatResult _result = chatResultFromJson(response.body);

      print(_result.toJson());

      return _result;
    } catch (e) {
      print("error message is ${e.toString()}");
      return ChatResult(status: false, message: "Can't connect to server");
    }
  }

  static Future<void> sendChat(String memberToken,
      {String token, String id, String text, String foto}) async {
    try {
      final response = await postRequest("chat",
          memberToken: memberToken,
          body: {
            'token': token,
            'id': id ?? "",
            "teks": text.trim(),
            "foto": foto ?? ""
          });

      print(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<MemberModel> fetchMember(String slug,
      {String memberToken}) async {
    try {
      final response =
          await getRequest("member?slug=$slug", memberToken: memberToken);

      return memberModelFromJson(response.body);
    } catch (e) {
      print(e.toString());
      return MemberModel(status: false, message: "Oops Something else!");
    }
  }
}
