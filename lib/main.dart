import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/sevices/localization.dart';
import 'package:getx/sevices/notifications.dart';
import 'package:getx/view/home_page.dart';
import 'package:timezone/data/latest.dart' as tz;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  AndroidOverscrollIndicator.stretch;
  Notifications().initNotifications();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Localization(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en'),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
