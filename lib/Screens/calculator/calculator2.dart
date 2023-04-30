import 'package:flutter/material.dart';

import '../drawer/sidemenu.dart';

class Calculator2 extends StatefulWidget {
  const Calculator2({Key? key}) : super(key: key);

  @override
  State<Calculator2> createState() => _HomeState();
}

class _HomeState extends State<Calculator2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: const Text("Calculator 2"),
          backgroundColor: const Color(0xff011422),
          toolbarHeight: 100,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Calculator 2 Page',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}