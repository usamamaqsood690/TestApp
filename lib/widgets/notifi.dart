import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class Notifi {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initializeNotification() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    // const IOSInitializationSettings iosinitializationsettings =
    //     IOSInitializationSettings(
    //   requestAlertPermission: false,
    //   requestBadgePermission: false,
    //   requestSoundPermission: false,
    // );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: null,
      macOS: null,
      linux: null,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: (dataYouNeedToUseWhenNotificationIsClicked) {},
    );
  }

  Future<void> showNotification(int id, String title, String body) async {
    
    // To Set the Notification Time
    
    var dateTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, 12, 0, 0);
    tz.initializeTimeZones();
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(dateTime, tz.local),
      NotificationDetails(
          android: AndroidNotificationDetails(
        id.toString(),
        'Happy Ramzan',
        importance: Importance.max,
        icon: "@mipmap/ic_launcher",
      )),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}
