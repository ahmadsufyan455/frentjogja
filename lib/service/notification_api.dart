import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void sendNotification() async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/launcher_icon');
  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'channel_id',
    'channel_name',
    description: 'channel_desc',
    importance: Importance.max,
  );

  flutterLocalNotificationsPlugin.show(
    0,
    'Frent Jogja',
    'Hai, pesanan kamu sudah dikonfirmasi!',
    NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
      ),
    ),
  );
}
