import 'package:flutter/material.dart';
import 'package:nurse_app3/languages/codegen_loader.g.dart';
import 'package:nurse_app3/pages/add_patient.dart';
import 'package:nurse_app3/pages/change_language.dart';
import 'package:nurse_app3/pages/home_page.dart';
import 'package:nurse_app3/pages/patient_page.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/languages/',
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
        Locale('fr'),
      ],
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/patient': (context) => PatientPage(),
        '/add_patient': (context) => AddPatient(),
        '/change_language': (context) => ChangeLanguage()
      },
    );
  }
}
