import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nurse_app3/languages/locale_keys.g.dart';

class PatientDelete extends StatelessWidget {
  const PatientDelete({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        LocaleKeys.delete.tr(),
        style: TextStyle(
            fontFamily: 'Shantell', fontSize: 20, color: Color(0xffEE4E34)),
      ),
      content: Text(LocaleKeys.confirm.tr()),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(
            LocaleKeys.yes.tr(),
            style: TextStyle(
                fontFamily: 'Shantell', fontSize: 20, color: Color(0xffEE4E34)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(
            LocaleKeys.no.tr(),
            style: TextStyle(
                fontFamily: 'Shantell', fontSize: 20, color: Color(0xffEE4E34)),
          ),
        )
      ],
    );
  }
}
