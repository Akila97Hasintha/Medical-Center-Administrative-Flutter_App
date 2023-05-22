import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../bottomTabBar/FabTabs.dart';
import '../drawer/sidemenu.dart';
import '../news/news.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> news =[];
  late Timer _timer;
  int _currentIndex = 0;
  int _currentIndex2 = 0;
  final List<String> _imageUrls = [
    'assests/RuhunaHome1.jpg',
    'assests/RuhunaHome2.jpg',
    'assests/RuhunaHome3.jpg',
  ];

  double _buttonSize1 = 120.0;
  double _buttonSize2 = 120.0;

  @override
  void initState() {
    super.initState();
    _fetchNews();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if(mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _imageUrls.length;
          _currentIndex2 = (_currentIndex2 + 1) % news.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // get all news from api
  Future<void> _fetchNews() async {
    String url = dotenv.get("API",fallback:"");
    final response = await http.get(Uri.parse('$url/news/getLeatestNews'));

    // print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> newsList = jsonDecode(response.body)['data']['news'];
      //print('news?: $newsList');
      //print('Fetched ${newsList.length} news items');
      List<Map<String, String>> newNews =[];
      for (var newsMap in newsList) {
        Map<String, String> newsItem = {
          '_id': newsMap['_id'],
          'title': newsMap['title'],
          'description': newsMap['description'],
          'url' : newsMap['url'],
          'date': newsMap['date'],
        };
        newNews.add(newsItem);
      }
      setState(() {
        news = newNews;

      });

    } else {
      if (kDebugMode) {
        print('Failed to fetch news: ${response.statusCode}');
      }
    }


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const SideMenu(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: AppBar(
            backgroundColor: const Color(0xff011422),
            toolbarHeight: 150,
            centerTitle: true,
            title: Column(
              children: [
                Image.asset(
                  "assests/mc_logo_white.png",

                  // height: 72.5,
                  // width: 275.0,

                  height: 60.5,
                  width: 300.0,
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          children: [
            // Can Add SizedBox or Container
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_imageUrls[_currentIndex]),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(.3),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Image.asset(
                        'assests/newruh1.png',
                        height: 100,
                        //width: 150,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Welcome to Ruhuna Medical Center',
                        style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'All Registered students and staff are entitled to '
                        'free consultations, free basic medicinal drugs, '
                        'free laboratory services and other required '
                        'health services.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                SizedBox(width: 20),
                Text(
                  'Our Services',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF0D47A1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 5, horizontal: 60), // outer padding
              child: Container(
                padding: const EdgeInsets.all(10), // inner padding
                decoration: BoxDecoration(
                  color: Colors.white30,
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: const [
                    Text(
                      'Free Checkup',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Take advantage of our free checkup offer, available to all new patients. Our experienced medical professionals will conduct a thorough assessment and provide personalized recommendations for maintaining your health. Book now.',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Expert Consultancy',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Our experienced physicians and specialists provide expert consultancy for a wide range of medical conditions. Get personalized treatment plans and ongoing support to manage your health effectively',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Total Care',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'We provide total care for your health needs, including preventive care, diagnostics, treatments, and ongoing management. Our dedicated team of professionals is committed to your well-being.',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Medicines',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'We offer a wide range of high-quality medicines, including prescription and over-the-counter options. Our pharmacists provide expert advice and ensure safe and efficient dispensing of medications. Visit us today.',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),
            Row(
              children: const [
                SizedBox(width: 20),
                Text(
                  'News',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF0D47A1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const News() ),
                );
              },
              child: SizedBox(
                height: 200,

                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: news != null && news.isNotEmpty && _currentIndex2 < news.length && news[_currentIndex2] != null
                            ? Image.network(
                          news[_currentIndex2]['url']!,
                          height: 150,
                          width: 250,
                          fit: BoxFit.cover,
                        )
                            : Container(),
                      ),
                      const SizedBox(height: 5),

                      Text(
                        news.isNotEmpty ? news[_currentIndex2]['title'] ?? 'Title not available' : 'No news available',
                        // news[_currentIndex2]['title']!,
                        // (news[_currentIndex2]['title'] == null)
                        //       ? news[_currentIndex2]['title'].toString()
                        //       : 'Title not available',
                        style: const TextStyle(fontWeight: FontWeight.bold,fontSize:16),
                      ),
                    ],
                  ),

                ),

              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        _buttonSize1 = 140;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        _buttonSize1 = 120;
                      });
                    },
                    child: SizedBox(
                      width: _buttonSize1,
                      height: _buttonSize1,
                      child: Material(
                        child: Ink.image(
                          image: const AssetImage('assests/bmi_calculator.png'),
                          fit: BoxFit.cover,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      FabTabs(selectedIndex: 7),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        _buttonSize2 = 140;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        _buttonSize2 = 120;
                      });
                    },
                    child: SizedBox(
                      width: _buttonSize2,
                      height: _buttonSize2,
                      child: Material(
                        child: Ink.image(
                          image: const AssetImage('assests/water.png'),
                          fit: BoxFit.cover,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      FabTabs(selectedIndex: 8),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MouseRegion(
                    child: Column(
                      children: const [
                        Text(
                          'BMI Calculator',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0D47A1),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Other widgets...
                      ],
                    ),
                  ),
                  MouseRegion(
                    child: Column(
                      children: const [
                        Text(
                          'Daily Water Intake\n       Calculator',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0D47A1),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Other widgets...
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Container(
            //   height: 200,
            //   color: Colors.greenAccent,
            // ),
          ],
        ),
      ),
    );
  }
}
