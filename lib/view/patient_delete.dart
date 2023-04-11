import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home_controller.dart';
import 'package:getx/model/patient.dart';

class PatientDelete extends StatelessWidget {
  HomeController controller = Get.find();
  Patient patient;
  PatientDelete({required this.patient, super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'delete'.tr,
        style: const TextStyle(
            fontFamily: 'Shantell', fontSize: 20, color: Color(0xffEE4E34)),
      ),
      content: Text('confirm'.tr),
      actions: [
        TextButton(
          onPressed: () {
            controller.deletePatient(patient);
            controller.disableReminder(patient);
            Navigator.of(context).pop(true);
          },
          child: Text(
            'yes'.tr,
            style: const TextStyle(
                fontFamily: 'Shantell', fontSize: 20, color: Color(0xffEE4E34)),
          ),
        ),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'no'.tr,
            style: const TextStyle(
                fontFamily: 'Shantell', fontSize: 20, color: Color(0xffEE4E34)),
          ),
        )
      ],
    );
  }
}
