part of 'services.dart';

/// ini adalah class auth services
class AuthServices {

  /// ini adalah method untuk melakukan sign in
  static Future<AuthResult> signIn(String email, String password) async {
    try {
      final response = await myRequest("auth/login", body: {
        "email": email,
        "password": password,
      });

      var data = jsonDecode(response.body);

      if (data != null && data['status']) {
        saveSessions(data['accessToken']);
      }

      print(data);

      return AuthResult(status: data['status'], message: data['message']);
    } catch (e) {
      /// ini digunakan untuk menghandle apabila terjadi error
      return AuthResult(
          status: false,
          message: "Nope, Your internet connection or our server is busy");
    }
  }

  /// ini adalah method untuk menyimpan access token yang telah didapat kedalam local/hp kita yaitu sharedPreferences
  static Future saveSessions(String token) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    print("saved into local");
    await _sharedPreferences.setString('token', token);
  }

  /// ini adalah method untuk mengambil data yg kita simpan tadi
  static Future<String> getCurrentSession() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    return _sharedPreferences.getString('token');
  }

  static Future removeSession() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();

    await _sharedPreferences.clear();
  }

  /// kita buat/konsumsi kedalam stream agar lebih mudah menggunakannya
  static Stream<String> get accessToken =>
      Stream.fromFuture(getCurrentSession()).asBroadcastStream();
}
