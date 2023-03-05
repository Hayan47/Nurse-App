import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

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
                      await context.setLocale(Locale('en'));
                      Navigator.pop(context);
                    },
                    child: Text(
                      'English',
                      style: TextStyle(
                          fontFamily: 'Shantell',
                          fontSize: 20,
                          color: Color(0xffEE4E34)),
                    )),
                TextButton(
                    onPressed: () async {
                      await context.setLocale(Locale('ar'));
                      Navigator.pop(context);
                    },
                    child: Text(
                      'العربية',
                      style: TextStyle(
                          fontFamily: 'Shantell',
                          fontSize: 20,
                          color: Color(0xffEE4E34)),
                    )),
                TextButton(
                    onPressed: () async {
                      await context.setLocale(Locale('fr'));
                      Navigator.pop(context);
                    },
                    child: Text(
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
