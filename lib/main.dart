import 'dart:async';
import 'Screens/bottomTabBar/FabTabs.dart';
import 'Screens/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(

      DevicePreview(
        //enabled: !kReleaseMode,
         builder: (context) => const MyApp(),
          ), // Wrap your app
    //const MyApp(),

  );
}

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
