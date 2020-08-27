part of 'services.dart';

class SliderServices {
  static Future<SliderResult> getSlider(String token) async {
    try {
      final response = await getRequest("slider", memberToken: token);

      return sliderResultFromJson(response.body);
    }catch (e) {
      return SliderResult(status: false, message: "Can't Connect To Network or Server Error Please Try again or contact Admin!");
    }
  }
}