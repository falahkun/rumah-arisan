part of 'services.dart';

class CommunityServices {
  static Future<CommunityResult> getCommunity(String slug, String memberToken) async {
    try {
      final response = await getRequest("komunitas?slug=$slug", memberToken: memberToken);

      return communityResultFromJson(response.body);
    }catch (e) {
      return CommunityResult(status: false, message: "can't Reach Server");
    }
  }

  static Future<CommunityResults> getCommunities(String memberToken) async {
    try {
      final response = await getRequest("komunitas", memberToken: memberToken);
      return communityResultsFromJson(response.body);
    }catch (e) {
      print(e.toString());
      return CommunityResults(status: false, message: "can't Reach Server");
    }
  }
} 
