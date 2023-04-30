import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../bottomTabBar/FabTabs.dart';
import '../drawer/sidemenu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Timer _timer;
  int _currentIndex = 0;
  final List<String> _imageUrls = [
    'assests/RuhunaHome1.jpg',
    'assests/RuhunaHome2.jpg',
    'assests/RuhunaHome3.jpg',
  ];

  double _buttonSize1 = 120.0;
  double _buttonSize2 = 120.0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _imageUrls.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const SideMenu(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: AppBar(
            backgroundColor: const Color(0xff011422),
            toolbarHeight: 150,
            centerTitle: true,
            title: Column(
              children: [
                Image.asset(
                  "assests/mc_logo_white.png",

                  // height: 72.5,
                  // width: 275.0,

                  height: 60.5,
                  width: 300.0,
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          children: [
            // Can Add SizedBox or Container
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(_imageUrls[_currentIndex]),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(.3),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Image.asset(
                        'assests/newruh1.png',
                        height: 100,
                        //width: 150,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Welcome to Ruhuna Medical Center',
                        style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'All Registered students and staff are entitled to '
                        'free consultations, free basic medicinal drugs, '
                        'free laboratory services and other required '
                        'health services.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                SizedBox(width: 20),
                Text(
                  'Our Services',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF0D47A1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 5, horizontal: 60), // outer padding
              child: Container(
                padding: const EdgeInsets.all(10), // inner padding
                decoration: BoxDecoration(
                  color: Colors.white30,
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: const [
                    Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.remove_red_eye,
                                color: Color(0xff011422)),
                            alignment: PlaceholderAlignment.middle,
                          ),
                          TextSpan(
                            text: '  Free Checkup',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                        height: 10), // add some space between the text widgets
                    Text('Medical Center Services',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    Text('Medical Center Services',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    Text('Medical Center Services',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    Text('Medical Center Services',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    Text('Medical Center Services',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    //SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),
            Row(
              children: const [
                SizedBox(width: 20),
                Text(
                  'News',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF0D47A1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Padding(
              //padding: EdgeInsets.all(15), // outer padding for all
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Container(
                padding: const EdgeInsets.all(10), // inner padding
                decoration: BoxDecoration(
                  color: Colors.white30,
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Most young people are not getting latest Covid-19 booster.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Container(
                padding: const EdgeInsets.all(10), // inner padding
                decoration: BoxDecoration(
                  color: Colors.white30,
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Most young people are not getting latest Covid-19 booster.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Container(
                padding: const EdgeInsets.all(10), // inner padding
                decoration: BoxDecoration(
                  color: Colors.white30,
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Most young people are not getting latest Covid-19 booster.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Container(
                padding: const EdgeInsets.all(10), // inner padding
                decoration: BoxDecoration(
                  color: Colors.white30,
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Most young people are not getting latest Covid-19 booster.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Container(
                padding: const EdgeInsets.all(10), // inner padding
                decoration: BoxDecoration(
                  color: Colors.white30,
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Most young people are not getting latest Covid-19 booster.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        _buttonSize1 = 140;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        _buttonSize1 = 120;
                      });
                    },
                    child: SizedBox(
                      width: _buttonSize1,
                      height: _buttonSize1,
                      child: Material(
                        child: Ink.image(
                          image: const AssetImage('assests/bmi_calculator.png'),
                          fit: BoxFit.cover,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      FabTabs(selectedIndex: 6),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        _buttonSize2 = 140;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        _buttonSize2 = 120;
                      });
                    },
                    child: SizedBox(
                      width: _buttonSize2,
                      height: _buttonSize2,
                      child: Material(
                        child: Ink.image(
                          image: const AssetImage('assests/water.png'),
                          fit: BoxFit.cover,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      FabTabs(selectedIndex: 7),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MouseRegion(
                    child: Column(
                      children: const [
                        Text(
                          'BMI Calculator',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0D47A1),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Other widgets...
                      ],
                    ),
                  ),
                  MouseRegion(
                    child: Column(
                      children: const [
                        Text(
                          'Daily Water Intake\n       Calculator',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0D47A1),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Other widgets...
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Container(
            //   height: 200,
            //   color: Colors.greenAccent,
            // ),
          ],
        ),
      ),
    );
  }
}
