import 'package:flutter/material.dart';

class Patient {
  int id;
  String name;
  String caringType;
  TimeOfDay reminder;

  Patient({
    required this.id,
    required this.name,
    required this.caringType,
    required this.reminder,
  });
}
