import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../drawer/sidemenu.dart';
import '../login/login.dart';

class DoctorAvailable_Guest extends StatefulWidget {
  const DoctorAvailable_Guest({Key? key}) : super(key: key);

  @override
  State<DoctorAvailable_Guest> createState() => _HomeState();
}

class _HomeState extends State<DoctorAvailable_Guest> {
  late String doctor1name = "";
  late String doctor1status = "";
  late String doctor2name = "";
  late String doctor2status = "";
  late String doctor3name = "";
  late String doctor3status = "";
  late String doctor4name = "";
  late String doctor4status = "";
  late String doctor5name = "";
  late String doctor5status = "";
  late String date = "";

  // get Doctor availability
  fetchData() async {
    String url = dotenv.get("API", fallback: "");
    final response =
        await http.get(Uri.parse('$url/doctorAvailability/mobile'));
    // print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var doctor1 = data['data']['DoctorOne'];
      var doctor2 = data['data']['DoctorTwo'];
      var doctor3 = data['data']['DoctorThree'];
      var doctor4 = data['data']['PhysioTherapist'];
      var doctor5 = data['data']['Dentist'];
      var timeD = data['data']['TimeStamp'];

      setState(() {
        date = timeD;
        doctor1name = doctor1['name'];
        doctor1status = doctor1['status'];
        doctor2name = doctor2['name'];
        doctor2status = doctor2['status'];
        doctor3name = doctor3['name'];
        doctor3status = doctor3['status'];
        doctor4name = doctor4['name'];
        doctor4status = doctor4['status'];
        doctor5name = doctor5['name'];
        doctor5status = doctor5['status'];
        _isLoading = false;
      });
    } else {
      log('error get doctor Avaliablity');
      // print("error");
    }
  }

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: const Text("Doctor Availability"),
          backgroundColor: const Color(0xff011422),
          toolbarHeight: 100,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (_) => LoginPage(),
              ));
            },
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text(
                "We are open Monday to Friday 8.00am to 4 pm. Poya days are closed",
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
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Dr.(Mrs) K.Rathanayaka",
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
                        color: doctor1status == 'Available'
                            ? Colors.green
                            : Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        doctor1status == 'Available'
                            ? 'Available'
                            : 'Not Available',
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
                      "Dr.L.G.S.Yapa (CMO)",
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
                        color: doctor2status == 'Available'
                            ? Colors.green
                            : Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        doctor2status == 'Available'
                            ? 'Available'
                            : 'Not Available',
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
                      "Dr.A.Weerasinhe(CMO)",
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
                        color: doctor3status == 'Available'
                            ? Colors.green
                            : Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        doctor3status == 'Available'
                            ? 'Available'
                            : 'Not Available',
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
                  "PHI",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "MR.L.S.H.B.P.Pushpakumara ",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: doctor4status == 'Available'
                            ? Colors.green
                            : Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        doctor4status == 'Available'
                            ? 'Available'
                            : 'Not Available',
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

                const Text(
                  "Dental Doctors",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Dr. S.Athapaththu",
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
                        color: doctor5status == 'Available'
                            ? Colors.green
                            : Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        doctor5status == 'Available'
                            ? 'Available'
                            : 'Not Available',
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
                  'Last Update : $date',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
