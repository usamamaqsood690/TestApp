import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Noti {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInit = new AndroidInitializationSettings('mipmap/ic_launcher');
    //  IOSInitializationSettings iosInit = new IOSInitializationSettings();
    var initialzationsSettings = InitializationSettings(
      android: androidInit,
      // iOS: iosInit,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initialzationsSettings,
    );
  }

  static Future showBigTextNotification(
      {var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        new AndroidNotificationDetails(
            'you_can_name_it_whateverl', 'channel_name',
            channelDescription: 'channel_description',
            playSound: true,
            fullScreenIntent: true,
            // sound: RawResourceAndroidNotificationSound('notification'),
            importance: Importance.max,
            priority: Priority.high);

    var not = NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(0, title, body, not);
  }
}
