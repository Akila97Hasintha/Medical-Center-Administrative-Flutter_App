import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

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

  double _height = 150.0;
  double _weight = 54.0;
  double _bmi = 0.0;

  void _calculateBMI() {
    setState(() {
      _bmi = _weight / ((_height / 100.0) * (_height / 100.0));
    });
  }

  String getBMICategory() {
    if (_bmi < 18.5) {
      return 'Underweight';
    } else if (_bmi < 25) {
      return 'Normal';
    } else if (_bmi < 30) {
      return 'Overweight';
    } else if (_bmi < 35) {
      return 'Obese';
    } else {
      return 'Extremely Obese';
    }
  }

  Color getBMIColor() {
    if (_bmi < 18.5) {
      return Colors.blue;
    } else if (_bmi < 25) {
      return Colors.green;
    } else if (_bmi < 30) {
      return Colors.yellow;
    } else if (_bmi < 35) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

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

            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Calculate your BMI',
                    style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF0D47A1),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Height (cm): ',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _height = double.tryParse(value) ?? _height;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Weight (kg): ',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _weight = double.tryParse(value) ?? _weight;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: _calculateBMI,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                      child: const Text('Calculate',
                          style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'BMI: ${_bmi.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '(${getBMICategory()})',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: getBMIColor(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'assests/bmi_range.jpg',
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),

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
