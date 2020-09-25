part of 'services.dart';

class CloterServices {
  static Future<CloterResult> getCloters(String memberToken) async {
    try {
      final response = await getRequest("cloter", memberToken: memberToken);

      return CloterResult.fromJson(jsonDecode(response.body));
    } catch (e) {
      return CloterResult(
          message:
              "Can't Connect To Network or Server Error Please Try again or contact Admin!",
          status: false);
    }
  }

  static Future<CloterDetailResult> getCloter(String memberToken,
      {String slug}) async {
    try {
      final response =
          await getRequest("cloter?slug=$slug", memberToken: memberToken);

      return CloterDetailResult.fromJson(jsonDecode(response.body));
    } catch (e) {
      return CloterDetailResult(
          message:
              "Can't Connect To Network or Server Error Please Try again or contact Admin!",
          status: false);
    }
  }

  static Future<CMemberResult> getMemberOfCloter(String slug) async {
    try {
      final response = await getRequest("cloter/member?slug=$slug");

      return CMemberResult.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e.toString());
      return CMemberResult(
          message:
              "Can't Connect To Network or Server Error Please Try again or contact Admin!",
          status: false);
    }
  }

  static Future<CloterResult> fetchMyCloter(String memberToken) async {
    try {
      final response = await getRequest("member-page/my-owner/cloter",
          memberToken: memberToken);

      print(response.body);

      return cloterResultFromJson(response.body);
    } catch (e) {
      return CloterResult(
          message:
              "Can't Connect To Network or Server Error Please Try again or contact Admin! #${e.toString()}",
          status: false);
    }
  }

  static Future<AuthResult> createCloter(
      String memberToken, CloterData data) async {
    try {
      final response = await postRequest("member-page/my-owner/cloter",
          memberToken: memberToken, body: data.toJson());
      print(data.private);
      var convertedData = jsonDecode(response.body);
      return AuthResult(
          status: convertedData['status'], message: convertedData['message']);
    } catch (e) {
      print(e.toString());
      print(data.toJson());
      return AuthResult(
          status: false, message: "Can't getting Result from server");
    }
  }

  static Future<AuthResult> updateCloter(
      String memberToken, CloterData data) async {
    try {
      final response = await putRequest("member-page/my-owner/cloter",
          memberToken: memberToken, body: data.toJson());
      print(data.private);
      var convertedData = jsonDecode(response.body);
      return AuthResult(
          status: convertedData['status'], message: convertedData['message']);
    } catch (e) {
      print(e.toString());
      return AuthResult(
          status: false, message: "Can't getting Result from server");
    }
  }

  static Future<AuthResult> deleteCloter(
      String memberToken, String cloterId) async {
    try {
      final response = await deleteRequest("member-page/my-owner/cloter",
          memberToken: memberToken, body: {"cloter_id": cloterId ?? ""});
      var convertedData = jsonDecode(response.body);
      return AuthResult(
          status: convertedData['status'], message: convertedData['message']);
    } catch (e) {
      print(e.toString());
      return AuthResult(
          status: false, message: "Can't getting Result from server");
    }
  }
}
