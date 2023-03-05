import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nurse_app3/languages/locale_keys.g.dart';
import 'package:nurse_app3/objects/patient.dart';
import 'patient_page.dart';
import 'package:nurse_app3/pages/patient_page.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({super.key});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  final List<String> caringType = [
    LocaleKeys.takemedicin.tr(),
    LocaleKeys.changeonwound.tr(),
    LocaleKeys.catheterization.tr(),
    LocaleKeys.injection.tr(),
    LocaleKeys.pressure.tr()
  ];

  TimeOfDay _timeOfDay = TimeOfDay(hour: 8, minute: 30);

  void _showTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  String dropdownValue = LocaleKeys.takemedicin.tr();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Center(
            child: Text(
              LocaleKeys.addpatient.tr(),
              style: TextStyle(
                  fontFamily: 'Shantell',
                  fontSize: 30,
                  color: Color(0xffEE4E34)),
            ),
          ),
          content: Column(
            children: [
              Text(
                LocaleKeys.id.tr(),
                style: TextStyle(
                    fontFamily: 'Shantell',
                    fontSize: 20,
                    color: Color(0xffEE4E34)),
              ),
              TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              Text(
                LocaleKeys.name.tr(),
                style: TextStyle(
                    fontFamily: 'Shantell',
                    fontSize: 20,
                    color: Color(0xffEE4E34)),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              Text(
                LocaleKeys.caringtype.tr(),
                style: TextStyle(
                    fontFamily: 'Shantell',
                    fontSize: 20,
                    color: Color(0xffEE4E34)),
              ),
              Row(
                children: [
                  DropdownButton(
                    borderRadius: BorderRadius.circular(20),
                    style: TextStyle(
                        fontFamily: 'Shantell',
                        fontSize: 15,
                        color: Color(0xffEE4E34)),
                    elevation: 0,
                    dropdownColor: Color(0xffFCEDDA),
                    value: dropdownValue,
                    items: caringType
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
              SizedBox(height: 25),
              Text(
                LocaleKeys.reminder.tr(),
                style: TextStyle(
                    fontFamily: 'Shantell',
                    fontSize: 20,
                    color: Color(0xffEE4E34)),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () => _showTimePicker(),
                child: Text(
                  _timeOfDay.format(context).toString(),
                  style: TextStyle(
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
                  Navigator.pop(context);
                },
                child: Text(
                  LocaleKeys.save.tr(),
                  style: TextStyle(color: Color(0xffEE4E34)),
                ))
          ],
        ),
      ),
    );
  }
}
