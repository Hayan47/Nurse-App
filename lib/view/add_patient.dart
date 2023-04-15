import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/model/patient.dart';
import 'package:getx/sevices/notifications.dart';
import '../controller/home_controller.dart';
import '../sevices/equatable.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({super.key});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  TimeOfDay _timeOfDay =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      if (value != null) {
        setState(() {
          _timeOfDay = value;
        });
      }
    });
  }

  KeyValueRecordType? dropdownValue;

  final HomeController c = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shadowColor: Theme.of(context).cardColor,
          title: Center(
            child: Text(
              'addpatient'.tr,
              style: const TextStyle(
                  fontFamily: 'Shantell',
                  fontSize: 30,
                  color: Color(0xffEE4E34)),
            ),
          ),
          content: Column(
            children: [
              Text(
                'name'.tr,
                style: const TextStyle(
                    fontFamily: 'Shantell',
                    fontSize: 20,
                    color: Color(0xffEE4E34)),
              ),
              TextFormField(
                controller: c.nameController,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  if (value == '') {
                    return 'validate1'.tr;
                  }
                },
              ),
              const SizedBox(height: 25),
              Text(
                'room'.tr,
                style: const TextStyle(
                    fontFamily: 'Shantell',
                    fontSize: 20,
                    color: Color(0xffEE4E34)),
              ),
              TextFormField(
                controller: c.roomController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  if (value == '') {
                    return 'validate2'.tr;
                  }
                },
              ),
              const SizedBox(height: 25),
              Text(
                'caringtype'.tr,
                style: const TextStyle(
                    fontFamily: 'Shantell',
                    fontSize: 20,
                    color: Color(0xffEE4E34)),
              ),
              const SizedBox(height: 15),
              DropdownButtonHideUnderline(
                child: DropdownButton2<KeyValueRecordType>(
                  hint: Text(
                    'select'.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  style: const TextStyle(
                      fontFamily: 'Shantell',
                      fontSize: 15,
                      color: Color(0xffEE4E34)),
                  value: dropdownValue,
                  items: c.caringType
                      .map<DropdownMenuItem<KeyValueRecordType>>(
                          (e) => DropdownMenuItem<KeyValueRecordType>(
                                value: e,
                                child: Text(e.value),
                              ))
                      .toList(),
                  onChanged: (KeyValueRecordType? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      print(newValue);
                    });
                  },

                  //button style
                  buttonStyleData: ButtonStyleData(
                    height: 40,
                    elevation: 2,
                    // padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: const Color(0xffEE4E34),
                      ),
                    ),
                  ),

                  //icon style
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xffEE4E34),
                      size: 25,
                    ),
                  ),

                  //dropdown style
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).cardColor,
                    ),
                    offset: const Offset(0, 30),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: MaterialStateProperty.all(6),
                      thumbColor: MaterialStateProperty.all(Color(0xffEE4E34)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                'reminder'.tr,
                style: const TextStyle(
                    fontFamily: 'Shantell',
                    fontSize: 20,
                    color: Color(0xffEE4E34)),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () => _showTimePicker(),
                child: Text(
                  _timeOfDay.format(context).toString(),
                  style: const TextStyle(
                      fontFamily: 'Shantell',
                      fontSize: 30,
                      color: Color(0xffEE4E34)),
                ),
              )
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  if (c.roomController.text.isNotEmpty &&
                      c.nameController.text.isNotEmpty &&
                      dropdownValue != null) {
                    Patient patient = Patient(
                      roomNum: int.parse(c.roomController.text),
                      name: c.nameController.text,
                      caringType: dropdownValue!.key,
                      reminder: DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        _timeOfDay.hour,
                        _timeOfDay.minute,
                      ),
                      enableReminder: true,
                    );
                    c.addPatient(patient);
                    Notifications().showSchedualedNotification(
                        id: 1,
                        title: patient.caringType,
                        body:
                            '${c.nameController.text} (${'room'.tr} ${c.roomController.text})',
                        dateTime: DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                          _timeOfDay.hour,
                          _timeOfDay.minute,
                        ));
                    c.nameController.clear();
                    c.roomController.clear();
                    Get.back();
                  }
                },
                child: Text(
                  'save'.tr,
                  style: const TextStyle(color: Color(0xffEE4E34)),
                ))
          ],
        ),
      ),
    );
  }
}
