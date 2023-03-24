
import 'package:flutter/material.dart';
import '../drawer/sidemenu.dart';



class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _HomeState();
}

class _HomeState extends State<About> {


  @override
  void initState() {
    super.initState();


  }
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        drawer: const SideMenu(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            title: const Text("About Us"),
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
                  children:   [
                    SizedBox(
                      height: 90,
                      width: 90,

                      child: Image.asset('assests/newruh1.png',),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "UNIVERSITY OF RUHUNA",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "DEPARTMENT OF COMPUTER SCIENCE",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100,),

            ],
          ),
        ),
      ),
    );
  }

}

