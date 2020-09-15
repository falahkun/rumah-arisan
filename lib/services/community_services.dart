part of 'services.dart';

class CommunityServices {
  /// function untuk mengambil data komunitas tunggal
  static Future<CommunityResult> getCommunity(
      String slug, String memberToken) async {
    try {
      final response =
          await getRequest("komunitas?slug=$slug", memberToken: memberToken);

      return communityResultFromJson(response.body);
    } catch (e) {
      return CommunityResult(status: false, message: "can't Reach Server");
    }
  }

  /// function untuk mengambil data komunitas jamak
  static Future<CommunityResults> getCommunities(String memberToken) async {
    try {
      final response = await getRequest("komunitas", memberToken: memberToken);
      return communityResultsFromJson(response.body);
    } catch (e) {
      print(e.toString());
      return CommunityResults(status: false, message: "can't Reach Server");
    }
  }

  /// function untuk join ke komunitas
  static Future<AuthResult> joinCommunity(
      String communityId, String memberToken) async {
    try {
      final response = await postRequest("komunitas/join",
          memberToken: memberToken, body: {"komunitas_id": communityId});

      var data = jsonDecode(response.body);
      return AuthResult(status: data['status'], message: data['message']);
    } catch (e) {
      return AuthResult(status: false, message: "can't Connect To server");
    }
  }

  /// function untuk left dari komunitas
  static Future<AuthResult> leftCommunity(
      String communityId, String memberToken) async {
    try {
      final response = await deleteRequest("komunitas/join",
          body: {
            "komunitas_id": communityId ?? '',
          },
          memberToken: memberToken);
      print(communityId);
      var data = jsonDecode(response.body);
      return AuthResult(status: data['status'], message: data['message']);
    } catch (e) {
      print(e.toString());
      return AuthResult(status: false, message: "Can't Connect To Server");
    }
  }
}
