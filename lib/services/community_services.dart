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
      print(e.toString());
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

  static Future<CommunityDiscuss> fetchDiscussions(
      String slug, String memberToken) async {
    try {
      final response = await getRequest("komunitas/diskusi?slug=$slug");

      return communityDiscussFromJson(response.body);
    } catch (e) {
      return CommunityDiscuss(
          status: false, message: "Galat!, tidak bisa konek ke server");
    }
  }

  static Future<AuthResult> postComment(String slug, String text,
      {String discussId, String memberToken}) async {
    try {
      final response = await postRequest("komunitas/diskusi",
          memberToken: memberToken,
          body: {
            "diskusi_id": discussId ?? "",
            "slug": slug,
            "teks": text,
          });

      var data = jsonDecode(response.body);
      return AuthResult(status: data['status'], message: data['message']);
    } catch (e) {
      print(e.toString());
      return AuthResult(status: false, message: "can't Connect To server");
    }
  }

  static Future<CommunityResults> fetchMemberCommunities(
      String memberToken) async {
    try {
      final response =
          await getRequest("member-page/komunitas", memberToken: memberToken);

      return communityResultsFromJson(response.body);
    } catch (e) {
      return CommunityResults(
          status: false, message: "can't fetching data from server");
    }
  }

  static Future<AuthResult> createCommunity(
      String memberToken, CommunityData data) async {
    try {
      final response = await postRequest("member-page/komunitas",
          memberToken: memberToken, body: data.toJson());
      var convertedData = jsonDecode(response.body);
      return AuthResult(
          status: convertedData['status'], message: convertedData['message']);
    } catch (e) {
      print(e.toString());
      return AuthResult(
          status: false, message: "Can't getting Result from server");
    }
  }

  static Future<AuthResult> updateCommunity(
      String memberToken, CommunityData data) async {
    try {
      final response = await putRequest("member-page/komunitas",
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

  static Future<AuthResult> deleteCommunity(
      String memberToken, String komunitasId) async {
    try {
      final response = await deleteRequest("member-page/komunitas",
          memberToken: memberToken, body: {"komunitas_id": komunitasId ?? ""});
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
