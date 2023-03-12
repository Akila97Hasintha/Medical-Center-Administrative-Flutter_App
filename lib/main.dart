import 'dart:async';
//import 'Screens/bottomTabBar/FabTabs.dart';
import 'Screens/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

/// import dart packege
import 'package:google_fonts/google_fonts.dart';
import 'package:mongo_dart/mongo_dart.dart';
// import 'dbHelper/mongodb.dart';

// void main() async{
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await MongoDatabase.connect();
//   runApp(new MyApp());
// }

void main() => runApp(  // This is a Device preview Code.Shows virtual Mobile
      DevicePreview(
        //enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of Medical-Center application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context), //remove icon
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //brightness: Brightness.dark,
      ),
      home:const Loding_page(),
      //home:FabTabs(selectedIndex: 0), //  This Code for Development Purpose Only
    );
  }
}
