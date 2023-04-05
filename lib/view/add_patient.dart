import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/model/patient.dart';
import '../controller/home_controller.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({super.key});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  TimeOfDay _timeOfDay = const TimeOfDay(hour: 8, minute: 30);

  void _showTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  String dropdownValue = 'take medicin';

  final HomeController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          title: const Center(
            child: Text(
              'add patient',
              style: TextStyle(
                  fontFamily: 'Shantell',
                  fontSize: 30,
                  color: Color(0xffEE4E34)),
            ),
          ),
          content: Column(
            children: [
              const Text(
                'id',
                style: TextStyle(
                    fontFamily: 'Shantell',
                    fontSize: 20,
                    color: Color(0xffEE4E34)),
              ),
              TextField(
                controller: c.idController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              const Text(
                'name',
                style: TextStyle(
                    fontFamily: 'Shantell',
                    fontSize: 20,
                    color: Color(0xffEE4E34)),
              ),
              TextFormField(
                controller: c.nameController,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              const Text(
                'caring type',
                style: TextStyle(
                    fontFamily: 'Shantell',
                    fontSize: 20,
                    color: Color(0xffEE4E34)),
              ),
              Row(
                children: [
                  DropdownButton(
                    borderRadius: BorderRadius.circular(20),
                    style: const TextStyle(
                        fontFamily: 'Shantell',
                        fontSize: 15,
                        color: Color(0xffEE4E34)),
                    elevation: 0,
                    dropdownColor: const Color(0xffFCEDDA),
                    value: dropdownValue,
                    items: c.caringType
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text('$e'),
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(height: 25),
              const Text(
                'reminder',
                style: TextStyle(
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
                  if (c.idController.text.isNotEmpty &&
                      c.nameController.text.isNotEmpty) {
                    c.addPatient(Patient(
                        id: int.parse(c.idController.text),
                        name: c.nameController.text,
                        caringType: dropdownValue,
                        reminder: _timeOfDay));
                  }
                  Get.back();
                },
                child: const Text(
                  'save',
                  style: TextStyle(color: Color(0xffEE4E34)),
                ))
          ],
        ),
      ),
    );
  }
}
