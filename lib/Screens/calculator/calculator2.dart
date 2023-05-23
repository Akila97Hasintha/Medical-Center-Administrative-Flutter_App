import 'package:flutter/material.dart';

import '../drawer/sidemenu.dart';

class Calculator2 extends StatefulWidget {
  const Calculator2({Key? key}) : super(key: key);

  @override
  State<Calculator2> createState() => _HomeState();
}

class _HomeState extends State<Calculator2> {
  double _weight = 0.0;
  String _climate = 'Tropical';
  String _activityLevel = 'Sedentary';
  double _waterIntake = 0.0;

  double calculateDailyWaterIntake(
      double weight, String climate, String activityLevel) {
    double waterIntake = 0.0;

    if (activityLevel == 'Sedentary') {
      waterIntake = weight * 30;
    } else if (activityLevel == 'Low Activity') {
      waterIntake = weight * 35;
    } else if (activityLevel == 'Moderate Activity') {
      waterIntake = weight * 40;
    } else if (activityLevel == 'Active') {
      waterIntake = weight * 45;
    } else if (activityLevel == 'Very Active') {
      waterIntake = weight * 50;
    }

    if (climate == 'Tropical') {
      waterIntake += weight * 10;
    } else if (climate == 'Temperate') {
      waterIntake += weight * 5;
    } else if (climate == 'Cold') {
      waterIntake += weight * 3;
    }

    return waterIntake;
  }

  void _calculateWaterIntake() {
    setState(() {
      _waterIntake =
          calculateDailyWaterIntake(_weight, _climate, _activityLevel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: const Text("Daily Water Intake Calculator"),
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
                  color: Colors.blue,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Water Intake',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Daily Water Requirement',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.blueGrey[600],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Water intake is essential for maintaining hydration and overall health. The daily water requirement varies based on factors such as weight, climate, and activity level. This calculator estimates your daily water intake based on the provided information.',
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
                  'Calculate Your Daily Water Intake',
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
                      'Weight (kg) : ',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Climate : ',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 150,
                      child: DropdownButton<String>(
                        value: _climate,
                        onChanged: (String? newValue) {
                          setState(() {
                            _climate = newValue!;
                          });
                        },
                        items: <String>[
                          'Tropical',
                          'Temperate',
                          'Cold',
                        ].map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Activity:',
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Activity Levels'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Sedentary:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Less than 30 minutes per day.',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Low Activity:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          '30-60 minutes per day.',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Moderate Activity:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          '60-90 minutes per day.',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Active:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          '90-120 minutes per day.',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Very Active:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'More than 120 minutes per day.',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Close'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.info_outline),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 150,
                      child: DropdownButton<String>(
                        value: _activityLevel,
                        onChanged: (String? newValue) {
                          setState(() {
                            _activityLevel = newValue!;
                          });
                        },
                        items: <String>[
                          'Sedentary',
                          'Low Activity',
                          'Moderate Activity',
                          'Active',
                          'Very Active',
                        ].map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: _calculateWaterIntake,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey),
                    ),
                    child:
                        const Text('Calculate', style: TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Your Daily Water Intake: ',
                      ),
                      TextSpan(
                        text:
                            '${(_waterIntake / 1000).toStringAsFixed(2)} liters',
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Image.asset(
                  'assests/water_jug.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
