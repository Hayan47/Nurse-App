import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home_controller.dart';
import 'package:getx/view/patient_delete.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../sevices/themes.dart';
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //appbar
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                currentTheme.toggleTheme();
              },
              icon: const Icon(Icons.brightness_4_rounded))
        ],
        elevation: 0,
        title: Text(
          'patients'.tr,
        ),
        centerTitle: true,
      ),
      //body
      body: GetBuilder<HomeController>(
        builder: (c) => c.isLoading
            //loading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.black),
              )
            : (c.patients.isEmpty)
                //empty list
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'start'.tr,
                        style: const TextStyle(
                          fontFamily: 'Shantell',
                          fontSize: 25,
                          color: Color(0xffEE4E34),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Lottie.asset('assets/patient.zip'),
                      const SizedBox(height: 10),
                    ],
                  )
                //show patients list
                : NotificationListener<UserScrollNotification>(
                    onNotification: (notification) {
                      if (notification.direction == ScrollDirection.forward &&
                          c.isVisible == false) {
                        c.makeVisible(true);
                      } else if (notification.direction ==
                              ScrollDirection.reverse &&
                          c.isVisible == true) {
                        c.makeVisible(false);
                      }

                      return true;
                    },
                    //list view
                    child: ListView.builder(
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
                          //delete icon
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
                          //patient card
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, right: 10, left: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Theme.of(context).cardColor,
                              ),
                              child: ListTile(
                                //person icon + name
                                leading: const Icon(
                                  Icons.person,
                                  color: Color(0xffEE4E34),
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        c.patients[index].name,
                                        style: const TextStyle(
                                            fontFamily: 'Shantell',
                                            fontSize: 25,
                                            color: Color(0xffEE4E34)),
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    const SizedBox(width: 25),
                                    Flexible(
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text: '${'room'.tr}(',
                                            style: TextStyle(
                                              fontFamily: 'Shantell',
                                              fontSize: 16,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          TextSpan(
                                            text: c.patients[index].roomNum
                                                .toString(),
                                            style: const TextStyle(
                                                fontFamily: 'Shantell',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Color(0xffEE4E34)),
                                          ),
                                          TextSpan(
                                            text: ')',
                                            style: TextStyle(
                                              fontFamily: 'Shantell',
                                              fontSize: 16,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                        ]),
                                      ),
                                    )
                                    // Text('${'room'.tr}('),
                                    // Flexible(
                                    //   child: Text(
                                    //     c.patients[index].roomNum
                                    //         .toString(),
                                    // style: const TextStyle(
                                    //     fontFamily: 'Shantell',
                                    //     fontSize: 20,
                                    //     color: Color(0xffEE4E34)),
                                    //     maxLines: 2,
                                    //     textAlign: TextAlign.end,
                                    //     overflow: TextOverflow.clip,
                                    //   ),
                                    // ),
                                    // const Text(')'),
                                  ],
                                ),
                                //reminder + caring type
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      c.getformattedTime(
                                        c.patients[index].reminder,
                                      ),
                                      style: GoogleFonts.poppins(
                                        color: Theme.of(context).shadowColor,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Flexible(
                                      child: Text(
                                        c.patients[index].caringType
                                            .toString()
                                            .tr,
                                        style: GoogleFonts.poppins(
                                          color: Theme.of(context).shadowColor,
                                        ),
                                        maxLines: 2,
                                        textAlign: TextAlign.end,
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GetBuilder<HomeController>(
        id: 'floating',
        builder: (c) => c.isVisible
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton.extended(
                  elevation: 0,
                  onPressed: () {
                    showDialog(
                        context: context, builder: (_) => const AddPatient());
                  },
                  backgroundColor: const Color(0xffEE4E34),
                  label: Text(
                    'addpatient'.tr,
                    style: const TextStyle(
                      fontFamily: 'Shantell',
                      fontSize: 15,
                      color: Color(0xffFCCDDA),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : Container(),
      ),
    );
  }
}
