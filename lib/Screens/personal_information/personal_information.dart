
import 'package:flutter/material.dart';
import '../../Services/api_data.dart';
import '../drawer/sidemenu.dart';
import '/Models/studentModel.dart';


class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _HomeState();
}


class _HomeState extends State<PersonalInformation> {
  late Student _student;
  bool _isLoading = true;


  @override
  void initState()  {
    super.initState();
    _fetchPersonalInfo();

  }

  // call the api services
  Future<void> _fetchPersonalInfo() async {
    final apiData = ApiData();
    final student = await apiData.fetchPersonalInfo();
    setState(() {
      _student = student;
      _isLoading = false;
    });
  }
  // String extractLastFiveNumbers(String input) {
  //   return input.substring(input.length - 5);
  // }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
////// get data from student model
    final name = _student.name;
    final email = _student.email;
    final role = _student.role;
    final dayOb = _student.dayOb;
    final rNum = _student.rNum;
    final age = _student.age;
     final fac = _student.fac;
    final mobile = _student.mobile;
    final gender = _student.Gender;
    final address = _student.address;
    final civilStatus = _student.civilStatus;
    // String lastFiveNumbers = extractLastFiveNumbers(_student.rNum);


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
                children:  [
                   const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assests/profile.jpg'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    email,
                    style: const TextStyle(
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
                children:  [
                  ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    title: const Text(
                      'Full Name :',
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      name,
                      //style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email, color: Colors.red),
                    title:
                        const Text('Email', style: TextStyle(color: Colors.purple)),
                    subtitle: Text(email,
                        style: const TextStyle(color: Colors.pink)),
                  ),
                   ListTile(
                    leading: const Icon(Icons.phone, color: Colors.green),
                    title: const Text('Phone', style: TextStyle(color: Colors.black)),
                    subtitle: Text(mobile),
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.cake, color: Colors.blue),
                    title: const Text('Date of Birth',
                        style: TextStyle(color: Colors.black)),
                    subtitle: Text(dayOb),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_on, color: Colors.orange),
                    title:
                        const Text('Address', style: TextStyle(color: Colors.black)),
                    subtitle: Text(address),
                  ),
                   ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                    title: const Text(
                      'Faculty',
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      fac,
                      //style: TextStyle(color: Colors.black),
                    ),
                  ),

                  ListTile(
                    leading: const Icon(Icons.app_registration, color: Colors.green),
                    title: const Text("Registration No", style: TextStyle(color: Colors.black)),
                    subtitle: Text(rNum),
                  ),
                  ListTile(
                    leading:
                    const Icon(
                      Icons.business_center,
                      size: 20,
                      color: Colors.blue,
                    ),

                    title: const Text('Role',
                        style: TextStyle(color: Colors.black)),
                    subtitle: Text(role),
                  ),
                  ListTile(
                    leading:  Icon(
                      gender == 'male' ? Icons.male : Icons.female,
                      size: 20,
                      color: gender == 'male' ? Colors.blue : Colors.pink,
                    ),
                    title:
                        const Text('Gender', style: TextStyle(color: Colors.black)),
                    subtitle: Text(gender),
                  ),
                  ListTile(
                    leading: const Icon(Icons.people_outline_sharp, color: Colors.orange),
                    title:
                    const Text('age', style: TextStyle(color: Colors.black)),
                    subtitle: Text(age.toString()),
                  ),
                  ListTile(
                    leading: Icon(
                      civilStatus == 'single' ? Icons.person : Icons.favorite,
                      size: 40,
                      color: civilStatus == 'single' ? Colors.green : Colors.red,
                    ),
                    title:
                    const Text('Civil Status', style: TextStyle(color: Colors.black)),
                    subtitle: Text(civilStatus),
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

