class patient {
  int id;
  String name;
  String caringType;
  List reminders = [];

  patient(
      {required this.id,
      required this.name,
      required this.caringType,
      required this.reminders});
}
