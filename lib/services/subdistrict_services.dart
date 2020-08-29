part of 'services.dart';

class SubdistrictServices {

  static Future<SubdistrictModel> getSubdistrict(String query) async {
    try {
      final response = await getRequest("wilayah/kecamatan?search=$query");


      return subdistrictModelFromJson(response.body);
    }catch (e) {
      return SubdistrictModel(status: false, message: "Can't Connect To server!");
    }
  }
}