import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../drawer/sidemenu.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

typedef NewNotificationCallback = void Function(bool isNewNotification);
class NotificationView extends StatefulWidget {
  final NewNotificationCallback? newNotificationCallback;
  const NotificationView({Key? key, this.newNotificationCallback }) : super(key: key);

  @override
  State<NotificationView> createState() => _HomeState();
}

class _HomeState extends State<NotificationView> {
  List<dynamic> news =[];
  bool _isLoading = true;
  Timer? _timer;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  bool isNewNotifican = false;

  @override
  void initState() {
    super.initState();
    _fetchAppointment();
    startTimer();
    // _initializeNotifications();
  }
  @override
  void dispose() {
    // Cancel the timer when the state is disposed
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    // Define the duration for the timer (5 seconds)
    const duration = Duration(seconds: 5);

    // Create a periodic timer that runs every 5 seconds
    _timer = Timer.periodic(duration, (timer) {
      // Refresh the page by calling setState
      setState(() {});
      if (widget.newNotificationCallback != null) {
        widget.newNotificationCallback!(isNewNotifican);
      }
    });
  }

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
     if(news.length<newsList.length){
       isNewNotifican = true;
     }

     // print(news);
    } else {
      if (kDebugMode) {
        print('Failed to fetch news: ${response.statusCode}');
      }
    }
  }


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
