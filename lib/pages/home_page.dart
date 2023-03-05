import 'dart:ffi';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:nurse_app3/languages/locale_keys.g.dart';
import 'package:nurse_app3/pages/change_language.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //EE4E34
  //FCEDDA

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFCEDDA),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //1
            SizedBox(height: 1),

            //2
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                  child: Image.asset(
                'assets/images/2.png',
              )),
            ),

            //3
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    //'Welcome to Nurse App \n \t your perfect guide',
                    LocaleKeys.welocme.tr(),
                    style: TextStyle(
                        fontFamily: 'Shantell',
                        fontSize: 28,
                        color: Color(0xffEE4E34)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/patient');
                    },
                    child: Text(
                      LocaleKeys.continu.tr(),
                      style: TextStyle(
                          fontFamily: 'Shantell',
                          fontSize: 20,
                          color: Color(0xffEE4E34)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context, builder: (_) => ChangeLanguage());
                    },
                    child: Text(
                      LocaleKeys.language.tr(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Shantell',
                          fontSize: 25,
                          color: Color(0xffEE4E34)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
