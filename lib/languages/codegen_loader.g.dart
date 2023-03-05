// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "welocme": "اهلا بك في تطبيق Nurse App \n \t دليلك المثالي",
  "continu": "متابعة",
  "takemedicin": "اخذ دواء",
  "changeonwound": "تغيير على جرح",
  "catheterization": "قسطرة",
  "injection": "حقنة",
  "pressure": "قياس ضغط",
  "addpatient": "اضافة مريض",
  "id": "الرقم",
  "name": "الاسم",
  "caringtype": "نوع العناية",
  "reminder": "منبه",
  "save": "حفظ",
  "language": "تغيير اللغة",
  "delete": "حذف",
  "confirm": "هل انت متاكد من حذف المريض ؟",
  "yes": "نعم",
  "no": "لا",
  "patient": "مريض"
};
static const Map<String,dynamic> en = {
  "welocme": "welcome to Nurse App \n \t your perfect guide",
  "continu": "continue",
  "takemedicin": "take medecin",
  "changeonwound": "change on wound",
  "catheterization": "catheterization",
  "injection": "injection",
  "pressure": "pressure gauge",
  "addpatient": "add patient",
  "id": "id",
  "name": "name",
  "caringtype": "caring type",
  "reminder": "reminder",
  "save": "save",
  "language": "change language",
  "delete": "delete",
  "confirm": "Are you sure you want to delete this patient?",
  "yes": "yes",
  "no": "no",
  "patient": "patient"
};
static const Map<String,dynamic> fr = {
  "welocme": "bienvenue dans Nurse App \n \t votre guide parfait",
  "continu": "continuer",
  "takemedicin": "prendre des medicaments",
  "changeonwound": "changement sur blessure",
  "catheterization": "catheterisme",
  "injection": "injection",
  "pressure": "manometre",
  "addpatient": "ajouter un patient",
  "id": "identifiant",
  "name": "nom",
  "caringtype": "genre attentionne",
  "reminder": "rappel",
  "save": "sauvegarder",
  "language": "changer de langue",
  "delete": "supprimer",
  "confirm": "etes-vous sur de vouloir supprimer ce patient ?",
  "yes": "oui",
  "no": "non",
  "patient": "patient"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en, "fr": fr};
}
