import 'package:flutter/material.dart';

import '../bottomTabBar/FabTabs.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
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
                const Text(
                  "A.B.C Perera De Silva",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "pereradesiva123@gmail.com",
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
          ListTile(
            leading: const Icon(Icons.logout_outlined,
                size: 35, color: Color(0xff011422)),
            title: const Text("Logout",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FabTabs(selectedIndex: 6)))
            },
          ),
        ],
      ),
    );
  }
}
