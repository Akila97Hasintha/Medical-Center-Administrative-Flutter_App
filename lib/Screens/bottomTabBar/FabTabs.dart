import 'package:flutter/material.dart';
import '../appointment/appointment.dart';
import '../doctor_availability/doctor_availability.dart';
import '../home/home.dart';
import '../medical_records/medical_records.dart';
import '../news/news.dart';
import '../personal_information/personal_information.dart';

class FabTabs extends StatefulWidget {
  int selectedIndex = 0;
  FabTabs({super.key, required this.selectedIndex});

  @override
  State<FabTabs> createState() => _FabTabsState();
}

class _FabTabsState extends State<FabTabs> {
  int currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
      currentIndex = widget.selectedIndex;
    });
  }

  @override
  void initState() {
    onItemTapped(widget.selectedIndex);
    // TODO: implement initState
    super.initState();
  }

  final List<Widget> pages = [
    const Home(),
    const DoctorAvailable(),
    const Appointment(),
    const MedicalRecords(),
    const PersonalInformation(),
    const News()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    Widget currentScreen = currentIndex == 0
        ? const Home()
        : currentIndex == 1
            ? const DoctorAvailable()
            : currentIndex == 2
                ? const Appointment()
                : currentIndex == 3
                    ? const MedicalRecords()
                    : currentIndex == 4
                        ? const PersonalInformation()
                        : const News();
    // : currentIndex == 5
    //     ? const News()
    //     : const Logout();
    // When Add new interface Should change Always

    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      // floatingActionButton: FloatingActionButton(  // This is a Add Button( + mark). this is not required medical center application
      //   backgroundColor: Colors.purple,
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     print("add fab button");
      //   },
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          color: Colors.blueGrey,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Home();
                        currentIndex = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentIndex == 0
                              ? Colors.pinkAccent
                              : Colors.black,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                              color: currentIndex == 0
                                  ? Colors.pinkAccent
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = const DoctorAvailable();
                        currentIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.people,
                          color: currentIndex == 1
                              ? Colors.yellowAccent
                              : Colors.black,
                        ),
                        Text(
                          "Doctors",
                          style: TextStyle(
                              color: currentIndex == 1
                                  ? Colors.yellow
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Appointment();
                        currentIndex = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit_calendar,
                          color: currentIndex == 2 ? Colors.blue : Colors.black,
                        ),
                        Text(
                          "Appointment",
                          style: TextStyle(
                              color: currentIndex == 2
                                  ? Colors.blue
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = const MedicalRecords();
                        currentIndex = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.menu_book,
                          color: currentIndex == 3
                              ? Colors.greenAccent
                              : Colors.black,
                        ),
                        Text(
                          "MC-R",
                          style: TextStyle(
                              color: currentIndex == 3
                                  ? Colors.greenAccent
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () {
                      setState(() {
                        currentScreen = const PersonalInformation();
                        currentIndex = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentIndex == 4
                              ? Colors.orangeAccent
                              : Colors.black,
                        ),
                        Text(
                          "Info",
                          style: TextStyle(
                              color: currentIndex == 4
                                  ? Colors.orangeAccent
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
