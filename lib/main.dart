import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/sevices/localization.dart';
import 'package:getx/sevices/notifications.dart';
import 'package:getx/sevices/themes.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
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
