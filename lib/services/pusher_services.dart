part of 'services.dart';

class PusherServices {
  // static Future<Response> triggering(
  //     {List<String> channels, String event, Map<String, dynamic> data}) async {
  //   try {
  //     PusherOptions options = new PusherOptions(encrypted: true);
  //     Pusher pusher = new Pusher(
  //         '1057631', '4a4f198b9d874284618c', '0eee69855103fbcd596b', options);
  //     pusher.get('chat').then((value) {
  //       value.status;
  //     });
  //     // return await pusher.trigger(channels, event, data);
  //     return await pusher.get('chat');
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  static FlutterPusher _flutterPusher;

  static Future<void> subscribe(
      String eventName, Function onTrigger, String channelName) async {
    try {
      var options = PusherOptions(cluster: 'ap1');
      _flutterPusher = FlutterPusher(
        "4a4f198b9d874284618c",
        options,
      );
      _flutterPusher.subscribe(channelName).bind(eventName, (event) {
        onTrigger();
        print("subscribed to $eventName");
      });
    } catch (e) {
      print("error is  ${e.toString()}");
    }
  }
}
