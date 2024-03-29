import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../drawer/sidemenu.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _HomeState();
}

class _HomeState extends State<News> {
  List<Map<String, String>> news =[];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }
// get all news from api
  Future<void> _fetchNews() async {
    String url = dotenv.get("API",fallback:"");
      final response = await http.get(Uri.parse('$url/news/getAllNews'));

     // print(response.body);
      if (response.statusCode == 200) {
        List<dynamic> newsList = jsonDecode(response.body)['data']['news'];
        //print('news?: $newsList');
        List<Map<String, String>> newNews =[];
        for (var newsMap in newsList) {
          Map<String, String> newsItem = {
            '_id': newsMap['_id'],
            'title': newsMap['title'],
            'description': newsMap['description'],
            'date': newsMap['date'],
            'url' : newsMap['url'],
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
          title: const Text("News"),
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
                  Container(
                    height: 200,
                    decoration:  BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          news[index]['url']!,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      news[index]['title']!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }


}
