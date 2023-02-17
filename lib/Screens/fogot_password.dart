import 'package:flutter/material.dart';

class f_password extends StatefulWidget {
  const f_password({Key? key}) : super(key: key);

  @override
  State<f_password> createState() => _f_passwordState();
}

class _f_passwordState extends State<f_password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:Container(
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.people),
          labelText: 'User name',
          border: OutlineInputBorder(),

        ),
      ),
        ),
      );

  }
}
