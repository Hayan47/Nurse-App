import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nurse_app3/languages/locale_keys.g.dart';
import 'package:nurse_app3/objects/patient.dart';
import 'package:nurse_app3/pages/add_patient.dart';
import 'package:nurse_app3/pages/patient_delete.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  bool _isSearching = false;
  final _searchTextController = TextEditingController();
  late List<patient> searchedForPatients = [];

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: Color(0xffFCEDDA),
      decoration: InputDecoration(
        hintText: 'Find Patient...',
        border: InputBorder.none,
        hintStyle: TextStyle(
            fontFamily: 'Shantell', fontSize: 20, color: Color(0xffFCEDDA)),
      ),
      style: TextStyle(
          fontFamily: 'Shantell', fontSize: 20, color: Color(0xffFCEDDA)),
      onChanged: (searchedPatients) {
        addSearchedForItemsToSearchedList(searchedPatients);
      },
    );
  }

  void addSearchedForItemsToSearchedList(String searchedPatients) {
    searchedForPatients = patients
        .where((patient) =>
            patient.name.toLowerCase().startsWith(searchedPatients))
        .toList();
    setState(() {});
  }

  static List<patient> patients = [
    patient(
        id: 1,
        name: 'hayan',
        caringType: LocaleKeys.takemedicin.tr(),
        reminders: ['8 - 30 AM']),
    patient(
        id: 2,
        name: 'hasan',
        caringType: LocaleKeys.injection.tr(),
        reminders: ['10 - 30 AM']),
    patient(
        id: 3,
        name: 'ahmed',
        caringType: LocaleKeys.pressure.tr(),
        reminders: ['3 - 00 PM']),
    patient(
        id: 4,
        name: 'amjad',
        caringType: LocaleKeys.changeonwound.tr(),
        reminders: ['5 - 20 PM']),
    patient(
      id: 5,
      name: 'khaled',
      caringType: LocaleKeys.catheterization.tr(),
      reminders: ['8 - 10 PM'],
    ),
    patient(
      id: 6,
      name: 'khalil',
      caringType: LocaleKeys.pressure.tr(),
      reminders: ['8 - 10 PM'],
    ),
    patient(
      id: 7,
      name: 'rami',
      caringType: LocaleKeys.changeonwound.tr(),
      reminders: ['8 - 10 PM'],
    ),
    patient(
      id: 8,
      name: 'asaad',
      caringType: LocaleKeys.catheterization.tr(),
      reminders: ['8 - 10 PM'],
    ),
    patient(
      id: 9,
      name: 'rasheed',
      caringType: LocaleKeys.injection.tr(),
      reminders: ['8 - 10 PM'],
    ),
    patient(
      id: 10,
      name: 'mansour',
      caringType: LocaleKeys.takemedicin.tr(),
      reminders: ['8 - 10 PM'],
    ),
    patient(
      id: 11,
      name: 'mohammad',
      caringType: LocaleKeys.pressure.tr(),
      reminders: ['8 - 10 PM'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCEDDA),
      appBar: _isSearching
          ? AppBar(
              backgroundColor: Color(0xffEE4E34),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: IconButton(
                      onPressed: () {
                        _searchTextController.clear();
                        Navigator.pop(context);
                        //_isSearching = false;
                      },
                      icon: Icon(Icons.clear)),
                )
              ],
              title: _buildSearchField(),
            )
          : AppBar(
              elevation: 0,
              backgroundColor: Color(0xffEE4E34),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: IconButton(
                    onPressed: () {
                      ModalRoute.of(context)!
                          .addLocalHistoryEntry(LocalHistoryEntry(
                        onRemove: () {
                          setState(() {
                            _searchTextController.clear();
                            _isSearching = false;
                          });
                        },
                      ));
                      setState(() {
                        _isSearching = true;
                      });
                    },
                    icon: Icon(Icons.search),
                  ),
                )
              ],
              title: Text(
                LocaleKeys.patient.tr(),
                style: TextStyle(
                    fontFamily: 'Shantell',
                    fontSize: 25,
                    color: Color(0xffFCEDDA)),
              ),
              centerTitle: true,
            ),
      body: ListView.builder(
        itemCount: _searchTextController.text.isEmpty
            ? patients.length
            : searchedForPatients.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(
              _searchTextController.text.isEmpty
                  ? patients[index].id
                  : searchedForPatients[index].id,
            ),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {},
            confirmDismiss: (direction) async {
              final result = await showDialog(
                  context: context, builder: (_) => PatientDelete());
              return result;
            },
            background: Container(
              color: Color(0xffEE4E34),
              padding: EdgeInsets.only(left: 16),
              child: Align(
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            child: Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Color(0xffEE4E34),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _searchTextController.text.isEmpty
                          ? patients[index].name
                          : searchedForPatients[index].name,
                      style: TextStyle(
                          fontFamily: 'Shantell',
                          fontSize: 25,
                          color: Color(0xffEE4E34)),
                    ),
                    SizedBox(width: 25),
                    Row(
                      children: [
                        Text('('),
                        Text(
                          _searchTextController.text.isEmpty
                              ? patients[index].id.toString()
                              : searchedForPatients[index].id.toString(),
                          style: TextStyle(
                              fontFamily: 'Shantell',
                              fontSize: 20,
                              color: Color(0xffEE4E34)),
                        ),
                        Text(')'),
                      ],
                    ),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _searchTextController.text.isEmpty
                          ? patients[index].reminders.toString()
                          : searchedForPatients[index].reminders.toString(),
                    ),
                    Flexible(
                      child: Text(
                        _searchTextController.text.isEmpty
                            ? patients[index].caringType.toString()
                            : searchedForPatients[index].caringType.toString(),
                        style: GoogleFonts.poppins(),
                      ),
                    )
                  ],
                ),
                trailing: Icon(
                  Icons.add,
                  color: Color(0xffEE4E34),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              //Navigator.pushNamed(context, '/add_patient');
              showDialog(context: context, builder: (_) => AddPatient());
            },
            backgroundColor: Color(0xffEE4E34),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                LocaleKeys.addpatient.tr(),
                style: TextStyle(
                    fontFamily: 'Shantell',
                    fontSize: 8,
                    color: Color(0xffFCCDDA)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
