import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notificationapp/main.dart';

class FirebaseApi {
  //create instance of the Firebase MEssaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  //function to initialize notification
  Future<void> initNotification() async {
    // request permission from user (will prompt user)

    await _firebaseMessaging.requestPermission();

    // fetch firebase cloud messaging token for this device
    final fcmTokan = await _firebaseMessaging.getToken();

    // print the token
    print("Token:$fcmTokan");

    //initialize the further setting foe the push notification
    initPushNotification();
  }

  //function to handle notification
  void handleMessage(RemoteMessage? message) {
    //if message is null, do something
    if (message == null) return;

    // navigate to the page whin uset taps the notification
    navigatorKey.currentState?.pushNamed(
      '/notification_page',
      arguments: message,
    );
  }

  //function to initialize  background settings
  Future initPushNotification() async {
    //handle notification if the app is terminated and opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // attach event listener for the when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
