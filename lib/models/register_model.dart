part of 'models.dart';

class RegisterModel {
  String email;
  String password;
  String confirmPassword;
  String name;
  String phoneNumber;
  File profileImage;

  RegisterModel(
      {this.email,
      this.password,
      this.confirmPassword,
      this.name,
      this.phoneNumber,
      this.profileImage});


  toJson() => {
    "email":email,
    "password":password,
    "nama":name,
    "telepon":phoneNumber,
  };
}
