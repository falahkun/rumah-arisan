part of 'services.dart';

/// ini adalah class auth services
class AuthServices {
  /// ini adalah method untuk melakukan sign in
  static Future<Map<String, dynamic>> signIn(
      String email, String password) async {
    try {
      final response = await myRequest("auth/login", body: {
        "email": email,
        "password": password,
      });

      return jsonDecode(response.body);
    } catch (e) {
      return {
        "error": true,
        "message":
            "Can't connect to the server please check your internet connection or call admin if we have maintenance"
      };
    }
  }
}
