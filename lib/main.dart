import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/sevices/localization.dart';
import 'package:getx/sevices/notifications.dart';
import 'package:getx/view/home_page.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_localizations/flutter_localizations.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  tz.initializeTimeZones();
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
      theme: ThemeData(
          androidOverscrollIndicator: AndroidOverscrollIndicator.stretch),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('en'), Locale('ar'), Locale('fr')],
      translations: Localization(),
      locale: GetStorage().read('language') == null
          ? Get.deviceLocale
          : Locale(GetStorage().read('language')),
      fallbackLocale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
