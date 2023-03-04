import 'package:flutter/material.dart';
import 'dart:async';
import '../login/login.dart';
//import '../login_form.dart';
import 'package:google_fonts/google_fonts.dart';

class Loding_page extends StatefulWidget {
  const Loding_page({Key? key}) : super(key: key);

  @override
  State<Loding_page> createState() => _Loding_pageState();
}

class _Loding_pageState extends State<Loding_page> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 4),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => LoginPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      /*appBar: AppBar(

        title: Text("Medical Center"),
      ),*/
      body:Container(
        height: double.infinity,
        width: double.infinity,
        color:Colors.white ,
        child: Stack(
          alignment: Alignment.center,
          children:<Widget> [
            Positioned(
            top: 0,
              // left:0,
              child: SizedBox(
                height: 200,
                //width: size.width,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(

                  'assests/black_theam1.png',
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),





            ),
            Positioned(
              top: 80,
              child:SizedBox(
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
              top: size.height/3,
              child: SizedBox(
                width: 320,
                height: 200,
                child: Image.asset(
                  'assests/main_logo.png',
                  height: size.height*10,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Text(
                'University of Ruhuna',
                textAlign: TextAlign.center,
                style:GoogleFonts.inter(
                  fontSize:  20,
                  fontWeight:  FontWeight.w400,
                  height:  10,
                  letterSpacing:  3.75,
                  color:  Color(0xff011422),
                ),
              ),
            ),
            const Positioned(
                bottom: 100,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                )
            ),

          ],

        ),
      ),
    );
  }
}


