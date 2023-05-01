import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart' ;
import '../bottomTabBar/FabTabs.dart';
import '../login/login.dart';
import '../About Us/about.dart';


class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String name = "";
  String email = "";
  String logout = "";





//Get student personal information
  Future<void> logOut() async {
    final response = await http
        .get(Uri.parse('http://localhost:3000/api/v1/auth/logout'));
     logout = response.body;
  }
  Future<void> fetchPersonalInfo() async {
    SharedPreferences prefs = await SharedPreferences
        .getInstance();
    String? id = prefs.getString('_id');
    final response = await http
        .get(Uri.parse('http://localhost:3000/api/v1/students/getStudent/$id'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final user = data['data']['student'];
      if (user != null) {
        setState(() {
          name = user['name'] ?? '';
          email = user['email'] ?? '';

        });
      } else {
        if (kDebugMode) {
          print('User object is null.');
        }
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

    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: const Color(0xff011422),
            //color: Colors.blue[900],
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assests/profile.jpg'),
                    ),
                  ),
                ),
                 Text(
                  name,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  email,
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined,
                size: 35, color: Color(0xff011422)),
            title: const Text("Home",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FabTabs(selectedIndex: 0)))
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_outlined,
                size: 35, color: Color(0xff011422)),
            title: const Text("Doctor Availability",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FabTabs(selectedIndex: 1)))
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit_calendar,
                size: 35, color: Color(0xff011422)),
            title: const Text("Book an Appointment",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FabTabs(selectedIndex: 2)))
            },
          ),
          ListTile(
            leading: const Icon(Icons.menu_book_outlined,
                size: 35, color: Colors.red),
            title: const Text("Medical Records",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FabTabs(selectedIndex: 3)))
            },
          ),
          ListTile(
            leading:
                const Icon(Icons.person, size: 35, color: Color(0xff011422)),
            title: const Text("Personal Information",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FabTabs(selectedIndex: 4)))
            },
          ),
          ListTile(
            leading: const Icon(Icons.newspaper_outlined,
                size: 35, color: Color(0xff011422)),
            title: const Text("News",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FabTabs(selectedIndex: 5)))
            },
          ),
          // Update password page navigation
          ListTile(
            leading: const Icon(Icons.key,
                size: 35, color: Color(0xff011422)),
            title: const Text("Update Password",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FabTabs(selectedIndex: 6)
                ),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined,
                size: 35, color: Color(0xff011422)),
            title: const Text("Logout",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            onTap: () {

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Are you sure log out!!"),
                    content: const Text("Are you sure you want to logout ?"),
                    actions: [
                      TextButton(

                        child: const Text("Cancel"),
                        onPressed: () {
                          logOut();
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Logout'),
                        onPressed: () async {
                          SharedPreferences prefs = await SharedPreferences
                              .getInstance();
                          await prefs.remove('_id');
                          await prefs.remove('token');

                          if (!mounted) return;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_rounded,
                size: 35, color: Color(0xff011422)),
            title: const Text("About Us",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const About()),
              )
            },
          ),
        ],
      ),
    );
  }
}
