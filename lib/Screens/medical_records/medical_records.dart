import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../drawer/sidemenu.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart' ;

class MedicalRecords extends StatefulWidget {
  const MedicalRecords({Key? key}) : super(key: key);

  @override
  State<MedicalRecords> createState() => _HomeState();
}

class _HomeState extends State<MedicalRecords> {

  List<Map<String, String>> medicalRecord =[];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchMedicalRecord();
  }

  // fetch medical records from api
  Future<void> _fetchMedicalRecord() async {
    String url = dotenv.get("API",fallback:"");
    SharedPreferences prefs = await SharedPreferences
        .getInstance();
    String? id = prefs.getString('_id');

    final response = await http.get(Uri.parse('$url/history/$id'));

    //print(response.body);
    if (response.statusCode == 201) {
      List<dynamic> medicalList = jsonDecode(response.body)['data']['treatment'];
      //print('news?: $newsList');
      List<Map<String, String>> newMedical =[];
      for (var medicalMap in medicalList) {
        Map<String, String> medicalItem = {
          '_id': medicalMap['_id'],
          'diagnosis': medicalMap['diagnosis'],
          'treatments': medicalMap['treatments'],
          'reminder': medicalMap['reminder'],
        };
        newMedical.add(medicalItem);
      }
      setState(() {
        medicalRecord = newMedical;
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
          title: const Text("Medical Records"),
          backgroundColor: const Color(0xff011422),
          toolbarHeight: 100,
        ),
      ),
      body: ListView.builder(
        itemCount: medicalRecord.length,
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
                      medicalRecord[index]['diagnosis']!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Text(
                      medicalRecord[index]['treatments']!,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Text(
                      medicalRecord[index]['reminder']!,
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
