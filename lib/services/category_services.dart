part of 'services.dart';

class CategoryServices {
  static Future<CategoryResult> getCategories() async {
    try {
      final response = await getRequest("category");

      return categoryResultFromJson(response.body);
    } catch (e) {
      return CategoryResult(status: false, message: "Can't reach server");
    }
  }
}
