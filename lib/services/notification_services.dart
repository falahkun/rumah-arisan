part of 'services.dart';

class NotificationServices {
  static Future<UpdateNotifModel> fetchUpdateNotif(String memberToken) async {
    try {
      final http.Response response =
          await getRequest("notif?tab=update", memberToken: memberToken);
      return updateNotifModelFromJson(response.body);
    } catch (e) {
      return UpdateNotifModel(
          status: false, pagination: null, message: "Can't fetch anything");
    }
  }
}
