part of 'services.dart';

class UnilinkServices {
  static Future<String> getLink() async {
    try {
      String link = await getInitialLink();
      print(link);
      return link;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static StreamSubscription get uniStream => getLinksStream().listen((event) {
        print(event);
      });

  static String getTokenFromUrl(String url) {
    var splitedUrl = url.split("/")[4].trim();
    var splitedToken = splitedUrl.split("=")[1];

    return splitedToken.split("&")[0];
  }

  static String getCodeFromUrl(String url) {
    var splitedUrl = url.split("/")[4].trim();
//       var splitedToken = ;

    return splitedUrl.split("=")[2];
  }
}
