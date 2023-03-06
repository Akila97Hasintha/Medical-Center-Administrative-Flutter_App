import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../drawer/sidemenu.dart';


class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _HomeState();
}
//String id =constraint.id;

class _HomeState extends State<PersonalInformation> {
  String name = "";
  String email = "";
  String role = "";
  String dayOb = "";
  String rNum = "";
  int age =0;
  String fac = "";
  //String mobile = "";
  //String Gender ="";
  //String address = "";






//Get student personal information

  Future<void> fetchPersonalInfo() async {
    SharedPreferences prefs = await SharedPreferences
        .getInstance();
    String? id = prefs.getString('_id');
    final response = await http
        .get(Uri.parse('http://localhost:3000/api/v1/students/getStudent/$id'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final user = data['data']['student'];
      setState(() {
        name = user['name'];
        email = user['email'];
        role = user['role'];
        dayOb = user['dateOfBirth'];
        rNum = user['regNo'];
        age = user['age'];
        //fac = user['faculty'];
        //mobile = user['mobile'];
        //Gender = user['gender'];
        //address = user['address'];



      });


      if (kDebugMode) {
        print(name);
      }
    } else {
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}.');
      }
    }


  }

  @override
  void initState() {
    super.initState();
    fetchPersonalInfo();

  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      drawer: const SideMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: const Text("Personal Information"),
          backgroundColor: const Color(0xff011422),
          toolbarHeight: 100,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              //width: ,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xff011422),
                    Colors.blueGrey.shade300,
                  ],
                ),
                //color: Colors.green // This code is used to insert sngle background color behind profile
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('assests/profile.jpg'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    email,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                //itemExtent: 50, // Chanege gap between two listview
                children:  [
                  ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    title: const Text(
                      'Full Name :',
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      name,
                      //style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email, color: Colors.red),
                    title:
                        const Text('Email', style: TextStyle(color: Colors.purple)),
                    subtitle: Text(email,
                        style: const TextStyle(color: Colors.pink)),
                  ),
                  const ListTile(
                    leading: Icon(Icons.phone, color: Colors.green),
                    title: Text('Phone', style: TextStyle(color: Colors.black)),
                    subtitle: Text('mobile'),
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.calendar_month_rounded, color: Colors.blue),
                    title: const Text('Date of Birth',
                        style: TextStyle(color: Colors.black)),
                    subtitle: Text(dayOb),
                  ),
                  const ListTile(
                    leading: Icon(Icons.location_on, color: Colors.orange),
                    title:
                        Text('Address', style: TextStyle(color: Colors.black)),
                    subtitle: Text('address'),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Faculty',
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      'fac',
                      //style: TextStyle(color: Colors.black),
                    ),
                  ),

                  ListTile(
                    leading: const Icon(Icons.phone, color: Colors.green),
                    title: const Text("Registration No", style: TextStyle(color: Colors.black)),
                    subtitle: Text(rNum),
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.calendar_month_rounded, color: Colors.blue),
                    title: const Text('Role',
                        style: TextStyle(color: Colors.black)),
                    subtitle: Text(role),
                  ),
                  const ListTile(
                    leading: Icon(Icons.location_on, color: Colors.orange),
                    title:
                        Text('Gender', style: TextStyle(color: Colors.black)),
                    subtitle: Text('Gender'),
                  ),





                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

