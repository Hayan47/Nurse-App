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
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  KeyValueRecordType? dropdownValue;

  final HomeController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
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
              Row(
                children: [
                  DropdownButton<KeyValueRecordType>(
                    borderRadius: BorderRadius.circular(20),
                    style: const TextStyle(
                        fontFamily: 'Shantell',
                        fontSize: 15,
                        color: Color(0xffEE4E34)),
                    elevation: 0,
                    dropdownColor: const Color(0xffFCEDDA),
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
                  )
                ],
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
                  if (c.roomController.text.isNotEmpty &&
                      c.nameController.text.isNotEmpty) {
                    c.addPatient(patient);
                  }
                  Notifications().showSchedualedNotification(
                      id: 1,
                      title: patient.caringType,
                      body:
                          '${c.nameController.text} (Room ${c.roomController.text})',
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
