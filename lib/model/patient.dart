class Patient {
  int? id;
  late int roomNum;
  late String name;
  late String caringType;
  late DateTime reminder;
  late bool enableReminder = true;

  Patient({
    id,
    required this.roomNum,
    required this.name,
    required this.caringType,
    required this.reminder,
    required this.enableReminder,
  });

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['_id'] = id;
    map['room_number'] = roomNum;
    map['name'] = name;
    map['caring_type'] = caringType;
    map['reminder'] = reminder.toIso8601String();
    map['enable_reminder'] = enableReminder ? 1 : 0;

    return map;
  }

  Patient.fromMap(Map<String, dynamic> map) {
    id = map['_id'] as int;
    roomNum = map['room_number'] as int;
    name = map['name'] as String;
    caringType = map['caring_type'] as String;
    reminder = DateTime.parse(map['reminder']);
    enableReminder = map['enable_reminder'] == 1;
  }
}
