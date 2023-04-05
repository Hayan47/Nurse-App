import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home_controller.dart';
import 'package:getx/view/patient_delete.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_patient.dart';

class PatientPage extends StatelessWidget {
  final HomeController c = Get.put(HomeController());
  PatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCEDDA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffEE4E34),
        title: const Text(
          'patients',
          style: TextStyle(
              fontFamily: 'Shantell', fontSize: 25, color: Color(0xffFCEDDA)),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) => ListView.builder(
          itemCount: controller.patients.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {},
              confirmDismiss: (direction) async {
                final result = await showDialog(
                    context: context,
                    builder: (_) => PatientDelete(selectedIndex: index));
                return result;
              },
              background: Container(
                color: const Color(0xffEE4E34),
                padding: const EdgeInsets.only(left: 16),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              child: Card(
                elevation: 3,
                child: ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Color(0xffEE4E34),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.patients[index].name,
                        style: const TextStyle(
                            fontFamily: 'Shantell',
                            fontSize: 25,
                            color: Color(0xffEE4E34)),
                      ),
                      const SizedBox(width: 25),
                      Row(
                        children: [
                          const Text('('),
                          Text(
                            controller.patients[index].id.toString(),
                            style: const TextStyle(
                                fontFamily: 'Shantell',
                                fontSize: 20,
                                color: Color(0xffEE4E34)),
                          ),
                          const Text(')'),
                        ],
                      ),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.getformattedTime(
                            controller.patients[index].reminder),
                      ),
                      Flexible(
                        child: Text(
                          controller.patients[index].caringType.toString(),
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  ),
                  trailing: const Icon(
                    Icons.add,
                    color: Color(0xffEE4E34),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              //Navigator.pushNamed(context, '/add_patient');
              showDialog(context: context, builder: (_) => AddPatient());
            },
            // ignore: prefer_const_constructors
            backgroundColor: Color(0xffEE4E34),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'add patient',
                style: TextStyle(
                    fontFamily: 'Shantell',
                    fontSize: 8,
                    color: Color(0xffFCCDDA)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
