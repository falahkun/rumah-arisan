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
}
