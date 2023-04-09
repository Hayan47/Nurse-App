import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home_controller.dart';
import 'package:getx/view/patient_delete.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'add_patient.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCEDDA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffEE4E34),
        title: const Text(
          'patients',
          style: TextStyle(
              fontFamily: 'Shantell', fontSize: 25, color: Color(0xffFCEDDA)),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        builder: (c) => c.isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.black),
              )
            : (c.patients.isEmpty)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Start Adding Patients !',
                        style: TextStyle(
                          fontFamily: 'Shantell',
                          fontSize: 25,
                          color: Color(0xffEE4E34),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Lottie.asset('assets/patient.zip'),
                    ],
                  )
                : ListView.builder(
                    itemCount: c.patients.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.startToEnd,
                        onDismissed: (direction) {},
                        confirmDismiss: (direction) async {
                          final result = await showDialog(
                            context: context,
                            builder: (_) => PatientDelete(
                              patient: c.patients[index],
                            ),
                          );
                          return result;
                        },
                        background: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, right: 10, left: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xffEE4E34),
                            ),
                            padding: const EdgeInsets.only(left: 16),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, right: 10, left: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: ListTile(
                              leading: const Icon(
                                Icons.person,
                                color: Color(0xffEE4E34),
                              ),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    c.patients[index].name,
                                    style: const TextStyle(
                                        fontFamily: 'Shantell',
                                        fontSize: 25,
                                        color: Color(0xffEE4E34)),
                                  ),
                                  const SizedBox(width: 25),
                                  Row(
                                    children: [
                                      const Text('Room ('),
                                      Text(
                                        c.patients[index].roomNum.toString(),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    c.getformattedTime(
                                        c.patients[index].reminder),
                                  ),
                                  Flexible(
                                    child: Text(
                                      c.patients[index].caringType.toString(),
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ),
                                ],
                              ),
                              trailing: GestureDetector(
                                  onTap: () {
                                    c.disableReminder(c.patients[index]);
                                  },
                                  child: c.patients[index].enableReminder
                                      ? const Icon(
                                          Icons.alarm_rounded,
                                          color: Color(0xffEE4E34),
                                        )
                                      : const Icon(
                                          Icons.alarm_rounded,
                                          color: Color(0xffFCEDDA),
                                        )),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            showDialog(context: context, builder: (_) => const AddPatient());
          },
          backgroundColor: const Color(0xffEE4E34),
          label: const Text(
            'add patient',
            style: TextStyle(
              fontFamily: 'Shantell',
              fontSize: 15,
              color: Color(0xffFCCDDA),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
