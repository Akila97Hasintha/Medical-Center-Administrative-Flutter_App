import 'package:flutter/material.dart';
import '../drawer/sidemenu.dart';
import '../login/login_form.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _HomeState();
}
String id =constraint.id;

class _HomeState extends State<PersonalInformation> {
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
                children: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('assests/profile.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'A.B.C Perera De Silva',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'pereradesiva123@gmail.com',
                    style: TextStyle(
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
                children: const [
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Full Name :',
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      'A.B.C Perera De Silva',
                      //style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.red),
                    title:
                        Text('Email', style: TextStyle(color: Colors.purple)),
                    subtitle: Text('pereradesiva123@gmail.com',
                        style: TextStyle(color: Colors.pink)),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.green),
                    title: Text('Phone', style: TextStyle(color: Colors.black)),
                    subtitle: Text('077-123-4567'),
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.calendar_month_rounded, color: Colors.blue),
                    title: Text('Date of Birth',
                        style: TextStyle(color: Colors.black)),
                    subtitle: Text('January 31, 1998'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.orange),
                    title:
                        Text('Address', style: TextStyle(color: Colors.black)),
                    subtitle: Text('123 Main St, Wellamadama, Matara'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Full Name :',
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      'A.B.C Perera De Silva',
                      //style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.red),
                    title:
                        Text('Email', style: TextStyle(color: Colors.purple)),
                    subtitle: Text('pereradesiva123@gmail.com',
                        style: TextStyle(color: Colors.pink)),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.green),
                    title: Text('Phone', style: TextStyle(color: Colors.black)),
                    subtitle: Text('077-123-4567'),
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.calendar_month_rounded, color: Colors.blue),
                    title: Text('Date of Birth',
                        style: TextStyle(color: Colors.black)),
                    subtitle: Text('January 31, 1998'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.orange),
                    title:
                        Text('Address', style: TextStyle(color: Colors.black)),
                    subtitle: Text('123 Main St, Wellamadama, Matara'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Full Name :',
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      'A.B.C Perera De Silva',
                      //style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.red),
                    title:
                        Text('Email', style: TextStyle(color: Colors.purple)),
                    subtitle: Text('pereradesiva123@gmail.com',
                        style: TextStyle(color: Colors.pink)),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.green),
                    title: Text('Phone', style: TextStyle(color: Colors.black)),
                    subtitle: Text('077-123-4567'),
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.calendar_month_rounded, color: Colors.blue),
                    title: Text('Date of Birth',
                        style: TextStyle(color: Colors.black)),
                    subtitle: Text('January 31, 1998'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.orange),
                    title:
                        Text('Address', style: TextStyle(color: Colors.black)),
                    subtitle: Text('123 Main St, Wellamadama, Matara'),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Full Name'),
                    subtitle: Text('A.B.C Perera De Silva'),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title:
                        Text('Email', style: TextStyle(color: Colors.purple)),
                    subtitle: Text('pereradesiva123@gmail.com',
                        style: TextStyle(color: Colors.pink)),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Phone'),
                    subtitle: Text('077-123-4567'),
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_month_rounded),
                    title: Text('Date of Birth'),
                    subtitle: Text('January 31, 1998'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Address'),
                    subtitle: Text('123 Main St, Wellamadama, Matara'),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Full Name'),
                    subtitle: Text('Saman Kumara Perera'),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title:
                        Text('Email', style: TextStyle(color: Colors.purple)),
                    subtitle: Text('pereradesiva123@gmail.com',
                        style: TextStyle(color: Colors.pink)),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Phone'),
                    subtitle: Text('077-123-4567'),
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_month_rounded),
                    title: Text('Date of Birth'),
                    subtitle: Text('January 31, 1998'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Address'),
                    subtitle: Text('123 Main St, Wellamadama, Matara'),
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

