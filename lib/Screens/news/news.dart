import 'package:flutter/material.dart';

import '../drawer/sidemenu.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _HomeState();
}

class _HomeState extends State<News> {
  List<Map<String, String>> news = [


    {
      "title": "Covid 19 Cases in Sri lanka",
      "description":
      "According to Sri Lanka's new Covid-19 guidelines, all tourists travelling to the island nation are required to carry vaccination cards and unvaccinated travellers are required to carry a negative PCR report, obtained 72 hours prior to arrival in the country..",
      "image": "assests/news1.jpg",
      //"image": "https://picsum.photos/200/300?random=1", // By using can get online random pictures
      "date": "2023-03-05",

    },
    {
      "title": "Dengue and severe dengue",
      "description":
      "Dengue is a viral infection transmitted to humans through the bite of infected mosquitoes. The primary vectors that transmit the disease are Aedes aegypti mosquitoes and, to a lesser extent, Ae. albopictus.",
      "image": "assests/news2.jpg",
      //"image": "https://picsum.photos/200/300?random=2",
      "date": "2023-03-04",
    },
    {
      "title": "Sri Lanka reports 1st monkeypox case",
      "description":
      "Sri Lanka has reported the first case of monkeypox in a youth who had arrived from Dubai, Health Minister announced on Friday.",
      "image": "assests/news3.jpg",
      //"image": "https://picsum.photos/200/300?random=3",
      "date": "2023-03-03",
    },
    {
      "title": "Covid 19 Cases in Sri lanka",
      "description":
      "According to Sri Lanka's new Covid-19 guidelines, all tourists travelling to the island nation are required to carry vaccination cards and unvaccinated travellers are required to carry a negative PCR report, obtained 72 hours prior to arrival in the country..",
      "image": "assests/news1.jpg",
      //"image": "https://picsum.photos/200/300?random=4",
      "date": "2023-03-02",

    },
    {
      "title": "Dengue and severe dengue",
      "description":
      "Dengue is a viral infection transmitted to humans through the bite of infected mosquitoes. The primary vectors that transmit the disease are Aedes aegypti mosquitoes and, to a lesser extent, Ae. albopictus.",
      "image": "assests/news2.jpg",
      //"image": "https://picsum.photos/200/300?random=5",
      "date": "2023-03-01",
    },
  ];

  @override
  Widget build(BuildContext context) {
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
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          news[index]['image']!,
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
