import 'dart:async';
import 'Screens/login.dart';
import 'Screens/loading.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';/// import dart packege
import 'package:google_fonts/google_fonts.dart';
import 'package:mongo_dart/mongo_dart.dart';
// import 'dbHelper/mongodb.dart';


void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await MongoDatabase.connect();

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:loding_page(),
    );
  }
}



