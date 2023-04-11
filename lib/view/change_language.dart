import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Center(
            child: Column(
              children: [
                TextButton(
                    onPressed: () async {
                      var locale = const Locale('en');
                      Get.updateLocale(locale);
                      Get.back();
                    },
                    child: const Text(
                      'English',
                      style: TextStyle(
                          fontFamily: 'Shantell',
                          fontSize: 20,
                          color: Color(0xffEE4E34)),
                    )),
                TextButton(
                    onPressed: () async {
                      var locale = const Locale('ar');
                      Get.updateLocale(locale);
                      Get.back();
                    },
                    child: const Text(
                      'العربية',
                      style: TextStyle(
                          fontFamily: 'Shantell',
                          fontSize: 20,
                          color: Color(0xffEE4E34)),
                    )),
                TextButton(
                    onPressed: () async {
                      var locale = const Locale('fr');
                      Get.updateLocale(locale);
                      Get.back();
                    },
                    child: const Text(
                      'francais',
                      style: TextStyle(
                          fontFamily: 'Shantell',
                          fontSize: 20,
                          color: Color(0xffEE4E34)),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
