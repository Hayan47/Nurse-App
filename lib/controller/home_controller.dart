import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/patient.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final idController = TextEditingController();
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

  List<Patient> patients = [
    Patient(
        id: 1,
        name: 'hayan',
        caringType: 'take medicin',
        reminder: TimeOfDay(hour: 8, minute: 30)),
    Patient(
        id: 2,
        name: 'hasan',
        caringType: 'injection',
        reminder: TimeOfDay(hour: 8, minute: 30)),
    Patient(
        id: 3,
        name: 'ahmed',
        caringType: 'pressure',
        reminder: TimeOfDay(hour: 8, minute: 30)),
    Patient(
        id: 4,
        name: 'amjad',
        caringType: 'changeonwound',
        reminder: TimeOfDay(hour: 8, minute: 30)),
    Patient(
      id: 5,
      name: 'khaled',
      caringType: 'catheterization',
      reminder: TimeOfDay(hour: 8, minute: 30),
    ),
    Patient(
      id: 6,
      name: 'khalil',
      caringType: 'pressure',
      reminder: TimeOfDay(hour: 8, minute: 30),
    ),
    Patient(
      id: 7,
      name: 'rami',
      caringType: 'changeonwound',
      reminder: TimeOfDay(hour: 8, minute: 30),
    ),
    Patient(
      id: 8,
      name: 'asaad',
      caringType: 'catheterization',
      reminder: TimeOfDay(hour: 8, minute: 30),
    ),
    Patient(
      id: 9,
      name: 'rasheed',
      caringType: 'injection',
      reminder: TimeOfDay(hour: 8, minute: 30),
    ),
    Patient(
      id: 10,
      name: 'mansour',
      caringType: 'takemedicin',
      reminder: TimeOfDay(hour: 8, minute: 30),
    ),
    Patient(
      id: 11,
      name: 'mohammad',
      caringType: 'pressure',
      reminder: TimeOfDay(hour: 8, minute: 30),
    ),
  ].obs;

  void addPatient(Patient patient) {
    patients.add(patient);
    update();
  }

  void deletePatient(int index) {
    patients.removeAt(index);
    update();
  }

  String getformattedTime(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }
}
