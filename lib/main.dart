import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx/sevices/notifications.dart';
import 'package:getx/view/home_page.dart';
import 'package:timezone/data/latest.dart' as tz;

Future main() async {
  tz.initializeTimeZones();
  AndroidOverscrollIndicator.stretch;
  WidgetsFlutterBinding.ensureInitialized();
  Notifications().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
