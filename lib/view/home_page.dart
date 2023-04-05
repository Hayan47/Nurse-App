import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx/view/patient_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //EE4E34
  //FCEDDA

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCEDDA),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //1
          const SizedBox(height: 1),

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
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Welcome to Nurse App \n \t your perfect guide',
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
                    Get.to(PatientPage());
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                        fontFamily: 'Shantell',
                        fontSize: 20,
                        color: Color(0xffEE4E34)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
