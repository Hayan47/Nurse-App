import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/view/patient_page.dart';
import 'change_language.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCEDDA),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //1
            //const SizedBox(height: 1),
            //2
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                  child: Image.asset(
                'assets/images/logo.png',
              )),
            ),

            //3
            Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        'welocme'.tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'Shantell',
                            fontSize: 28,
                            color: Color(0xffEE4E34)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Text(
                        'guide'.tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'Shantell',
                            fontSize: 28,
                            color: Color(0xffEE4E34)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const PatientPage());
                        },
                        child: Text(
                          'continu'.tr,
                          style: const TextStyle(
                              fontFamily: 'Shantell',
                              fontSize: 20,
                              color: Color(0xffEE4E34)),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context, builder: (_) => ChangeLanguage());
                    },
                    child: Text(
                      'language'.tr,
                      style: const TextStyle(
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
