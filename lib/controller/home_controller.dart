import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/patient.dart';
import 'package:intl/intl.dart';

import '../sevices/database_helper.dart';
import '../sevices/notifications.dart';

class HomeController extends GetxController {
  final roomController = TextEditingController();
  final nameController = TextEditingController();
  final caringTypeController = TextEditingController();
  final reminderController = TextEditingController();
  final List<String> caringType = [
    'take medicin',
    'change on wound',
    'catheterization',
    'injection',
    'pressure',
  ].obs;

  List<Patient> patients = [];
  bool isLoading = true;

  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void onInit() async {
    super.onInit();
    patients = await databaseHelper.getPatientList();
    isLoading = false;
    update();
  }

  void addPatient(Patient patient) async {
    await databaseHelper.addPatient(patient);
    patients = await databaseHelper.getPatientList();
    update();
  }

  void deletePatient(Patient patient) async {
    await databaseHelper.deletePatient(patient.id!);
    patients = await databaseHelper.getPatientList();
    update();
  }

  void disableReminder(Patient patient) {
    if (patient.enableReminder == true) {
      patient.enableReminder = false;
      Notifications().cancelNotification(patient.id!);
      update();
    } else {
      patient.enableReminder = true;
      Notifications().showSchedualedNotification(
          id: patient.id!,
          title: patient.caringType,
          body: patient.name,
          dateTime: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            patient.reminder.hour,
            patient.reminder.minute,
          ));
      update();
    }
  }

  String getformattedTime(DateTime tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }
}
