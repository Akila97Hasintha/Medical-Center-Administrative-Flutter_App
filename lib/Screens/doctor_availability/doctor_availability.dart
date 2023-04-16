import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../drawer/sidemenu.dart';

class DoctorAvailable extends StatefulWidget {
  const DoctorAvailable({Key? key}) : super(key: key);

  @override
  State<DoctorAvailable> createState() => _HomeState();
}

class _HomeState extends State<DoctorAvailable> {

  late Future<Map<String, dynamic>> futureData;


  late final bool isActive = true;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: const Text("Doctor Availability"),
          backgroundColor: const Color(0xff011422),
          toolbarHeight: 100,
        ),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      margin: const EdgeInsets.all(20),
                      child: const Text(
                        "We are open Monday to friday 8.00am to 4 pm."
                            "poya days are closed",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,

                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Text(
                          "Doctors",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),),
                        const SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'doctor1  : ',
                              style: TextStyle(
                                //color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: snapshot.data!['doctor1'] == 'Available'? Colors.green : Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                snapshot.data!['doctor1'] == 'Available' ? 'Available' : 'Unavailable',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'doctor2  : ',
                              style: TextStyle(
                                //color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: snapshot.data!['doctor2'] == 'Available'? Colors.green : Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                snapshot.data!['doctor2'] == 'Available' ? 'Available' : 'Unavailable',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'doctor3  : ',
                              style: TextStyle(
                                //color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: snapshot.data!['doctor3'] == 'Available'? Colors.green : Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                snapshot.data!['doctor3'] == 'Available' ? 'Available' : 'Unavailable',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Dental Doctors",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Dentist  : ',
                              style: TextStyle(
                                //color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: snapshot.data!['dentist'] == 'Available'? Colors.green : Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                snapshot.data!['dentist'] == 'Available' ? 'Available' : 'Unavailable',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Physiotherapists",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             const Text(
                              'physiotherapists  : ',
                               style: TextStyle(
                                 //color: Colors.black,
                                 fontWeight: FontWeight.normal,
                                 fontSize: 20,
                               ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: snapshot.data!['physiotherapists'] == 'Available'? Colors.green : Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                snapshot.data!['physiotherapists'] == 'Available' ? 'Available' : 'Unavailable',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                            'Last Updte : ${snapshot.data!['date']}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),


                      ],

                    )

                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),

    );
  }
}

// get Doctor Availability of doctors
  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:3000/api/v1/doctorAvailability'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data']['doctorAvailabilityRes'];
    } else {
      throw Exception('Failed to load data');
    }
  }

