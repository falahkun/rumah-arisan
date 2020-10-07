part of 'services.dart';

class SocialAuthServices {
  static final facebookLogin = FacebookLogin();
  static final _googleSignIn = GoogleSignIn(
      // clientId:
      //     "1052535129475-03fjille3d1i5874qkse8pbflnbtvio3.apps.googleusercontent.com",
      signInOption: SignInOption.standard,
      scopes: ['email', 'profile']);

  // JdvBnTx6ryEJjLX4sAtFZYsK

  static Future<AuthResult> getFbToken() async {
    try {
      final result = await facebookLogin.logIn(['email']);

      final AuthResult _result = await AuthServices.loginSocial(
          result.accessToken.token,
          provider: SocialProvider.FB_LOGIN);

      return _result;
    } catch (e) {
      print(e.toString());
      return AuthResult(status: false, message: "Can't Connect To server");
    }
  }

  static Future<AuthResult> getGoogleToken() async {
    try {
      final result = await _googleSignIn.signIn();

      final auth = await result.authentication;
      print(auth.idToken);

      final AuthResult _result = await AuthServices.loginSocial(auth.idToken,
          provider: SocialProvider.GOOGLE_LOGIN);

      return _result;
    } catch (e) {
      throw Exception(e);
      // print(e.toString());
      // return AuthResult(status: false, message: "Can't Connect To server");
    }
  }
}
