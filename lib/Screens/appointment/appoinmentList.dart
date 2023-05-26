import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../drawer/sidemenu.dart';

class AppoinmentList extends StatefulWidget {
  const AppoinmentList({Key? key}) : super(key: key);

  @override
  State<AppoinmentList> createState() => _HomeState();
}

class _HomeState extends State<AppoinmentList> {
  List<Map<String, String>> news =[];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchAppoinment();
  }
// get all news from api
  Future<void> _fetchAppoinment() async {
    String url = dotenv.get("API",fallback:"");
    final response = await http.get(Uri.parse('$url/channeling/getUserAppointments/643429a23ff79ba4e396b2cf'));

    // print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> newsList = jsonDecode(response.body)['data'];
      //print('news?: $newsList');
      List<Map<String, String>> newNews =[];
      for (var newsMap in newsList) {
        Map<String, String> newsItem = {
          '_id': newsMap['_id'],
          'description': newsMap['description'],
          'date': newsMap['date'],
          'time' : newsMap['time'],
          'status': newsMap['status'],
        };
        newNews.add(newsItem);
      }
      setState(() {
        news = newNews;
        _isLoading = false;
      });

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
          title: const Text("Appointment List"),
          backgroundColor: const Color(0xff011422),
          toolbarHeight: 100,
        ),
      ),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Padding(

                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      news[index]['status']!,
                      style:  TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: news[index]['status'] == 'pending' ? Colors.red : Colors.green,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Text(
                      news[index]['description']!,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Text(
                      news[index]['date']!,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Text(
                      news[index]['time']!,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // Handle delete button press here
                      // You can use the index to identify the item to be deleted
                      // For example:
                      setState(() {
                        news.removeAt(index);
                      });
                    },
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
