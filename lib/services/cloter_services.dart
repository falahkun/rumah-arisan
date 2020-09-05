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

  static Future<CloterDetailResult> getCloter(String memberToken, {String slug}) async {
    try {
      final response = await getRequest("cloter?slug=$slug", memberToken: memberToken);

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
      return CMemberResult(
          message:
          "Can't Connect To Network or Server Error Please Try again or contact Admin!",
          status: false);
    }
  }
}
