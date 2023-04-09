import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:getx/model/patient.dart';

//MAIN CLASS
class DatabaseHelper {
  static Database? _database;

  //DATABASE GETTER
  Future<Database?> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
      return _database;
    }
    return _database;
  }

  //INITIALIZE DATABASE
  Future<Database> initializeDatabase() async {
    //get directory
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}patients.db';
    Database mydatabase =
        await openDatabase(path, version: 1, onCreate: createTables);
    return mydatabase;
  }

  //CREATE TABLE
  static Future<void> createTables(Database database, int newVersion) async {
    await database.execute(
      '''
        CREATE TABLE "patient_table"(
        "_id" INTEGER PRIMARY KEY AUTOINCREMENT,
        "name" TEXT NOT NULL,
        "room_number" INTEGER NOT NULL,
        "caring_type" TEXT NOT NULL,
        "reminder" TEXT NOT NULL,
        "enable_reminder" INTEGER NOT NULL)
        ''',
    );
  }

  //CLOSE DATABASE
  Future closeDatabase() async {
    final db = await database;
    db!.close();
    // Directory directory = await getApplicationDocumentsDirectory();
    // String path = '${directory.path}patients.db';
    // databaseFactory.deleteDatabase(path);
  }

  //FETCH: GET ALL OBJECTS
  Future<List<Map<String, dynamic>>> getPatients() async {
    Database? db = await database;

    var result = await db!.query('patient_table');
    return result;
  }

  //INSERT: ADD OBJECT
  Future<int> addPatient(Patient patient) async {
    Database? db = await database;

    var result = await db!.insert('patient_table', patient.toMap());
    return result;
  }

  //DELETE: DELETE OBJECT
  Future<int> deletePatient(int id) async {
    Database? db = await database;

    int result =
        await db!.delete('patient_table', where: '_id = ?', whereArgs: [id]);
    return result;
  }

  //GET NUMBER OF PATIENTS
  Future<int> getPatientsCount() async {
    Database? db = await database;
    List<Map<String, dynamic>> x =
        await db!.rawQuery('SELECT COUNT (*) from patient_table');
    int result = Sqflite.firstIntValue(x)!;
    return result;
  }

  //CONVERT MAP INTO LIST OF PATIENTS
  Future<List<Patient>> getPatientList() async {
    var patientsMapList = await getPatients();
    int count = patientsMapList.length;
    List<Patient> patientsList = [];
    //for loop to add items to the list
    for (int i = 0; i < count; i++) {
      patientsList.add(Patient.fromMap(patientsMapList[i]));
    }
    //or
    //patientsMapList.map((e) => Patient.fromMap(e)).toList();
    return patientsList;
  }
}
