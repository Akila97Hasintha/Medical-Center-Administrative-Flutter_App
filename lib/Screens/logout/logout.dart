import 'package:flutter/material.dart';
//import 'package:medical_center6/screens/home/home.dart';

import '../drawer/sidemenu.dart';

class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  State<Logout> createState() => _HomeState();
}

class _HomeState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: const Text("Logout"),
          backgroundColor: const Color(0xff011422),
          toolbarHeight: 100,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Logout Page',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}

/*
void _Logout(context) {
  //final FirebaseAuth _auth = Firebase.instance;
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black54,
          title: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 36,
                ),
              ),

              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Sign out',
                  style: TextStyle(color: Colors.white, fontSize: 28),

                ),
              ),
            ],
          ),
          content: Text(
            'Do you want to Logou?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.canPop(context) ? Navigator.pop(context) : null;
              },
              child: Text(
                'no', style: TextStyle(color: Colors.green, fontSize: 18),),
            ),

            TextButton(
              onPressed: () {
                Navigator.canPop(context) ? Navigator.pop(context) : null;
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              },
              child: Text(
                'Yes', style: TextStyle(color: Colors.green, fontSize: 18),),
            ),
          ],
        );
      }
  );
}

 */
