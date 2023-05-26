import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/studentModel.dart';
import '../../Services/api_data.dart';
import '../drawer/sidemenu.dart';
import '../appointment/appoinmentList.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  // const Appointment({Key? key}) : super(key: key);

  @override
  State<Appointment> createState() => _HomeState();
}

class _HomeState extends State<Appointment> {

  late Student _student;
  bool _isLoading = true;

  @override
  void initState()  {
    super.initState();
    _fetchPersonalInfo();

  }

  // call the api services
  void _fetchPersonalInfo() async {
    final apiData = ApiData();
    final student = await apiData.fetchPersonalInfo();
    setState(() {
      _student = student;
      _isLoading = false;
    });
  }

  addAppointment(userId,title,name,faculty,level,mobile,regNo,date,description,time,status) async{
    String urL = dotenv.get("API",fallback:"");
    var url = "$urL/channeling/bookAppointment";
    //final formattedDate = DateFormat('yyyy-mm-dd').format(date).toString();
    //final formattedTime = DateFormat('hh:mm:ss a').format(time).toString();
    //final formattedTime = time.format(context).toString();
    //print(formattedDate);
    final response = await http.post(
      Uri.parse(url),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',

      },
      body: jsonEncode(<String, String>{
        'userId':userId,
        'title':title,
        'name':name,
        "faculty":faculty,
        'level':level,
        'mobile':mobile,
        'regNo':regNo,
        'date':date.toString(),
        'description':description,
        'time':time.toString(),
        'status':status
      }),
    );

    if (kDebugMode) {
      print(response.body);
    }
    var parse = jsonDecode(response.body);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(response.statusCode == 200){

      if(parse['status'] == "success"){
        await prefs.setString('message', parse['message']);

      }

    }else{
      if(parse['status'] == "fail"){
        await prefs.setString('message', parse['message']);
      }
      String? message = prefs.getString("message");

      if (kDebugMode) {
        print("Appointment faild");
      }
      if (kDebugMode) {
        print(message);
      }

    }
  }


  final _formKey = GlobalKey<FormState>();
  String? _mobile;
  String? _selectedLevel;
  String? _description;
  String? _selectedDoctor;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  final String _status = "pending";

  final List<String> _levels = ['level_1', 'level_2', 'level_3', 'level_4'];
  final List<String> _doctors = ['doctor1', 'doctor2', 'doctor3'];

  String _formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime =
    DateTime(now.day, now.month, now.year, time.hour, time.minute);
    return DateFormat.jm().format(dateTime);
  }

  @override
  Widget build(BuildContext context) {

    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_student == null) {
      return const Center(child: Text('Failed to fetch student data'));
    }
////// get data from student model
    final id = _student.id;
    final title = _student.title;
    final name = _student.name;
    final rNum = _student.rNum;
    final fac = _student.fac;


    return Scaffold(
      drawer: const SideMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: const Text("Appointment"),
          backgroundColor: const Color(0xff011422),
          toolbarHeight: 100,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AppoinmentList()),
                      );

                    },
                    child: const Text(
                      'View Appoinment List',
                      style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Title'),
                    //initialValue: _student?.name,
                    initialValue: _student.title,
                    enabled: false, // Disable editing
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'First Name'),
                    //initialValue: _student?.name,
                    initialValue: _student.name,
                    enabled: false, // Disable editing
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Registration Number'),
                    //initialValue: _student?.name,
                    initialValue: _student.rNum,
                    enabled: false, // Disable editing
                  ),
                  const SizedBox(height: 20),
                  // TextFormField(
                  //   decoration:
                  //   const InputDecoration(labelText: 'Registration Number'),
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter your registration number';
                  //     }
                  //     return null;
                  //   },
                  //   onSaved: (value) {
                  //     _regNo = value;
                  //   },
                  // ),
                  // const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Mobile'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      if (!RegExp(r'^[0-9+]+$').hasMatch(value)) {
                        return 'Please enter correct mobile number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _mobile = value;
                    },
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Faculty'),
                    //initialValue: _student?.name,
                    initialValue: _student.fac,
                    enabled: false, // Disable editing
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Level'),
                    value: _selectedLevel,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedLevel = newValue;
                      });
                    },
                    items:
                    _levels.map<DropdownMenuItem<String>>((String level) {
                      return DropdownMenuItem<String>(
                        value: level,
                        child: Text(level),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a level';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Doctor'),
                    value: _selectedDoctor,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedDoctor = newValue;
                      });
                    },
                    items:
                    _doctors.map<DropdownMenuItem<String>>((String doctor) {
                      return DropdownMenuItem<String>(
                        value: doctor,
                        child: Text(doctor),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a doctor';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Description'),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter description of symptoms';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _description = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: Text(_selectedDate == null
                        ? 'Select a date'
                        : 'Selected Date: ${DateFormat.yMMMd().format(_selectedDate!)}'),
                    onTap: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime.now(),
                          maxTime: DateTime.now().add(const Duration(days: 30)),
                          onConfirm: (date) {
                            setState(() {
                              _selectedDate = date;
                            });
                          }, currentTime: DateTime.now());
                    },
                  ),
                  Text(
                    _selectedDate == null ? 'Please select a date' : '',
                    style: TextStyle(
                      color: _selectedDate == null
                          ? Colors.red
                          : Colors.transparent,
                    ),
                  ),
                  const SizedBox(height: 20),

                  if (_selectedDate != null) ...[
                    //hide time field until select date
                    ListTile(
                      leading: const Icon(Icons.access_time),
                      title: Text(
                        _selectedTime == null
                            ? 'Select a time'
                            : 'Selected Time: ${_formatTimeOfDay(_selectedTime!)}',
                      ),
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: _selectedTime ?? TimeOfDay.now(),
                        ).then((time) {
                          if (time != null) {
                            final selectedDateTime = DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day,
                                time.hour,
                                time.minute,
                                0


                            );

                            if (selectedDateTime.hour >= 8 &&
                                selectedDateTime.hour <= 16) {
                              setState(() {
                                _selectedTime = time;
                              });
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Invalid time'),
                                    content: const Text(
                                        'Please select a time between 8am and 4pm'),
                                    actions: [
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        });
                      },
                    ),
                    Text(
                      _selectedTime == null ? 'Please select a time' : '',
                      style: TextStyle(
                        color: _selectedTime == null
                            ? Colors.red
                            : Colors.transparent,
                      ),
                    ),

                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() &&
                            _selectedDate != null &&
                            _selectedTime != null) {
                          // Save the form data
                          _formKey.currentState!.save();


                          addAppointment(_student.id,_student.title,_student.name,_student.fac,_selectedLevel,_mobile,_student.rNum,_selectedDate,_description,_selectedTime,_status);

                          // print(_student.name);
                          // print(_student.name);
                          // print(_student.rNum);
                          // print(_mobile);
                          // print(_student.fac);
                          // print(_selectedLevel);
                          // print(_selectedDoctor);
                          // print(_description);
                          //print(_selectedDate);
                          // print(_selectedTime);
                          // print(
                          //     DateFormat('MM/dd/yyyy').format(_selectedDate!));
                          // print(_formatTimeOfDay(_selectedTime!));

                          // Reset the form
                          _formKey.currentState!.reset();

                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          String? message = prefs.getString('message');
                          print(message);

                          // Show a success popup
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Appointment submitted successfully!')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff011422),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 20,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ], // hide time field until select date.................
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// get data from  api

}
