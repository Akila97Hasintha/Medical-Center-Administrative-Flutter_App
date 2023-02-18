import 'package:flutter/material.dart';

import '../drawer/sidemenu.dart';

class DoctorAvailable extends StatefulWidget {
  const DoctorAvailable({Key? key}) : super(key: key);

  @override
  State<DoctorAvailable> createState() => _HomeState();
}

class _HomeState extends State<DoctorAvailable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: const Text("Doctor Availability"),
          backgroundColor: const Color(0xff011422),
          toolbarHeight: 100,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Doctors Availability Page',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
