import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../drawer/sidemenu.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _HomeState();
}

class _HomeState extends State<NotificationView> {
  List<dynamic> news =[];
  bool _isLoading = true;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _fetchAppointment();
    // _initializeNotifications();
  }
  //
  // Future<void> _initializeNotifications() async {
  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //   AndroidInitializationSettings('app_icon');
  //   const InitializationSettings initializationSettings =
  //   InitializationSettings(android: initializationSettingsAndroid);
  //   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  // }
// get all news from api
  Future<void> _fetchAppointment() async {
    String url = dotenv.get("API", fallback: "");
    final response = await http.get(Uri.parse('$url/users/getallNotification/643429a23ff79ba4e396b2cf'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<dynamic> newsList = jsonResponse['data']['notification'];

      setState(() {
        news = List<String>.from(newsList);
        _isLoading = false;
      });
      // Display a notification for each new notification
      // for (var notification in newsList) {
      //   String message = notification['message'];
      //
      //   await _showNotification(message);
      // }

     // print(news);
    } else {
      if (kDebugMode) {
        print('Failed to fetch news: ${response.statusCode}');
      }
    }
  }
  // Future<void> _showNotification(String message) async {
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //   AndroidNotificationDetails(
  //     '_id',
  //     'name',
  //     //'description',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );
  //   const NotificationDetails platformChannelSpecifics =
  //   NotificationDetails(android: androidPlatformChannelSpecifics);
  //
  //   await flutterLocalNotificationsPlugin.show(
  //     0, // notification ID
  //     'New Notification', // notification title
  //     message, // notification message
  //     platformChannelSpecifics,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      drawer: const SideMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: const Text("Notifications"),
          backgroundColor: const Color(0xff011422),
          toolbarHeight: 100,
        ),
      ),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          String notification = news[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [



                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Text(
                      notification,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
        ],
              ),
            ),
          );
        },
      ),
    );
  }


}
