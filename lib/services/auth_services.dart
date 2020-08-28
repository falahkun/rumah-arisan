part of 'services.dart';

/// ini adalah class auth services
class AuthServices {

  /// ini adalah method untuk melakukan sign in
  static Future<AuthResult> signIn(String email, String password) async {
    try {
      final response = await postRequest("auth/login", body: {
        "email": email,
        "password": password,
      });

      var data = jsonDecode(response.body);

      if (data != null && data['status']) {
        saveSessions(data['accessToken']);
      }

      // print(data);
      return AuthResult(status: data['status'], message: data['message']);
    } catch (e) {
      print(e.toString());
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
    _changeAuthState(token);
    await _sharedPreferences.setString('token', token);
  }

  /// ini adalah method untuk mengambil data yg kita simpan tadi
  static Future<String> getCurrentSession() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    return _sharedPreferences.getString('token');
  }

  /// method ini digunakan untuk meremove session yang tersimpan,
  /// bisa juga digunakan untuk logout.
  static Future removeSession() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    await _sharedPreferences.clear();
    _changeAuthState(null);
  }

  /// kita buat/konsumsi kedalam stream agar lebih mudah menggunakannya
  static Stream<String> get _accessToken =>
      Stream.fromFuture(getCurrentSession());

  ///digunakan untuk mengambil data token dari server
  static Future<TokenResult> getTokenResult(String token) async {
    try {
      final response = await postRequest('auth/get_token', memberToken: token);
      // print(response.body);
      return TokenResult.fromJson(jsonDecode(response.body));
    } catch (e) {
      return null;
    }
  }


  /// untuk register next-step
  /// get data usernya 
  static Future<UserModel> getUser(String token, String code) async {
    try {
      final response = await getRequest("auth/user");

      return userModelFromJson(response.body);
    }catch (e) {
      return UserModel(status: false, message: "Can't Connect to server, please contact admin!");
    }
  }

  /// untuk register next-step
  /// put data usernya
  static Future<void> putUser(String token, String code, UserModel user) async {
    try {
      final response = await putRequest("auth/user", body: user.toJson());

      print(response.body);


    } catch (e) {
      throw Exception(e);
    }
  }

  /// method for adding event in stream
  static void _changeAuthState(String token) async {
    _controller.sink.add(token);
  }
  
  static StreamController<String> _controller = StreamController<String>.broadcast()..addStream(_accessToken);

  /// baris code ini digunakan untuk menutup stream onAuthStateChanged apabila sudah tidak digunakan.
  static Future<void> dispose() => _controller.close();

  /// baris code ini digunakan untuk mengambil data yang tersimpan di local (sharedpreferences)
  /// agar lebih mudah untuk consumenya jadi kita pakai stream untuk listen data.
  static Stream<String> get onAuthStateChanged => _controller.stream;
}
