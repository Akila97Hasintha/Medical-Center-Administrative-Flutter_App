import 'package:flutter/material.dart';

import '../drawer/sidemenu.dart';

class Calculator1 extends StatefulWidget {
  const Calculator1({Key? key}) : super(key: key);

  @override
  State<Calculator1> createState() => _HomeState();
}

class _HomeState extends State<Calculator1> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: const Text("BMI Calculator"),
          backgroundColor: const Color(0xff011422),
          toolbarHeight: 100,
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  //color: Color(0xFF0D47A1),
                  color: Colors.blue,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            //padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Body Mass Index',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.blueGrey[600],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'BMI stands for Body Mass Index, which is a measure of body fat based on a person height and weight. It is commonly used as a screening tool to assess whether a person has a healthy body weight. BMI is calculated by dividing a person weight in kilograms by their height in meters squared.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.blueGrey[800],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
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
                    child:
                    const Text('Calculate', style: TextStyle(fontSize: 18)),
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
                  'assests/bmi_range2.jpg',
                  //fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
