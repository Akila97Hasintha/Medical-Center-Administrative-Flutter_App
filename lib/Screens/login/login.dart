import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_center_dart/Screens/doctor_availability/doctor_availability_guest.dart';

import '../doctor_availability/doctor_availability.dart';
import 'login_form.dart';

//import 'package:medical_center_dart/Screens/login_form.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      /*appBar: AppBar(

        title: Text("Medical Center"),
      ),*/
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              // left:0,
              child: SizedBox(
                height: 200,
                //width: size.width,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assests/black_theam1.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 80,
              child: SizedBox(
                width: 90,
                height: 90,
                child: Image.asset(
                  'assests/newruh1.png',
                  //width: ,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            Positioned(
              top: size.height / 4,
              child: SizedBox(
                width: 320,
                height: 200,
                child: Image.asset(
                  'assests/main_logo.png',
                  height: size.height * 10,
                ),
              ),
            ),
            Positioned(
              top: 350,
              child: Image.asset(
                "assests/user.png",
                height: 100,
              ),
            ),
            Positioned(
              bottom: 260,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const LoginForm()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xff011422), // Set the button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        5), // Set the button border radius
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 24), // Set the button padding
                ),
                child: const Text(
                  'Log In!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Set the button text color
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 200,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (_) => const DoctorAvailable_Guest()),
                  );
                },
                child: const Text(
                  'Check Doctor Availability',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blueAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Text(
                'University of Ruhuna',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  height: 10,
                  letterSpacing: 3.75,
                  color: const Color(0xff011422),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
