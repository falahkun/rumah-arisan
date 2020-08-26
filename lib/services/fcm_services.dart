part of 'services.dart';

class FCMServices {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  static Future<void> initialize() async {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

  static Future<void> subscribeTopic(String topic) async {
    _firebaseMessaging.subscribeToTopic(topic);
  }

  static Future<void> unsubscribeTopic() async {}
}
