import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/timezone.dart' as tz;

class Notifications {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('logo');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification: (id, title, body, payload) {});

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await notificationsPlugin.initialize(
      initializationSettings,
      //onDidReceiveBackgroundNotificationResponse: (details) {},
    );
  }

  // Future<void> showNotification(
  //     {required int id,
  //     required String title,
  //     required String body,
  //     String? payload}) async {
  //   return notificationsPlugin.show(
  //       id, title, body, await notificationDetails());
  // }

  //main function of the reminder
  Future<void> showSchedualedNotification({
    required int id,
    required String title,
    required String body,
    required DateTime dateTime,
    String? payload,
  }) async {
    //get current time zone
    final String currentTimeZone =
        await FlutterNativeTimezone.getLocalTimezone();
    print(currentTimeZone);

    //reoeat every day
    tz.TZDateTime nextInstanceOfReminder() {
      final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

      tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.getLocation(currentTimeZone),
        now.year,
        now.month,
        now.day,
        dateTime.hour,
        dateTime.minute,
      );
      if (scheduledDate.isBefore(now)) {
        scheduledDate = scheduledDate.add(const Duration(days: 1));
      }
      return scheduledDate;
    }

    //zoned scheduel function
    try {
      return notificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        nextInstanceOfReminder(),
        await notificationDetails(),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } catch (e) {
      print('ERROR' + e.toString());
    }
  }

  notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails('channelId', 'channelName',
          importance: Importance.max,
          priority: Priority.max,
          playSound: true,
          icon: 'logo',
          channelShowBadge: true,
          largeIcon: DrawableResourceAndroidBitmap('logo')),
      iOS: DarwinNotificationDetails(),
    );
  }

  //cancel notification
  Future<void> cancelNotification(int id) async {
    await notificationsPlugin.cancel(id);
  }
}
