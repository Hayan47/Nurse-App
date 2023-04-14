import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
          backgroundColor: Theme.of(context).cardColor,
          shadowColor: Theme.of(context).cardColor,
          title: Center(
            child: Column(
              children: [
                TextButton(
                    onPressed: () async {
                      var locale = const Locale('en');
                      GetStorage().write('language', 'en');
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
                      GetStorage().write('language', 'ar');
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
                      GetStorage().write('language', 'fr');
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
