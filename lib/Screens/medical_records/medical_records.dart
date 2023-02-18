import 'package:flutter/material.dart';

import '../drawer/sidemenu.dart';

class MedicalRecords extends StatefulWidget {
  const MedicalRecords({Key? key}) : super(key: key);

  @override
  State<MedicalRecords> createState() => _HomeState();
}

class _HomeState extends State<MedicalRecords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: const Text("Medical Records"),
          backgroundColor: const Color(0xff011422),
          toolbarHeight: 100,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Medical Records Page',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
