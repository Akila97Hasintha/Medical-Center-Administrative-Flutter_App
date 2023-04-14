import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../drawer/sidemenu.dart';

class DoctorAvailable extends StatefulWidget {
  const DoctorAvailable({Key? key}) : super(key: key);

  @override
  State<DoctorAvailable> createState() => _HomeState();
}

class _HomeState extends State<DoctorAvailable> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: const SideMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: const Text("Doctor Availability"),
          backgroundColor: const Color(0xff011422),
          toolbarHeight: 100,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child:SizedBox(
            height: 400,
            child: Table(
              columnWidths: const {
                0: FixedColumnWidth(50.0),
              },
              border: TableBorder.all(),
              children:const [
                TableRow(
                  children:[
                    TableCell(
                      child: SizedBox(
                        height: 50,
                          child: Center(
                            child: Text(
                                'Title',
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),

                            ),
                          )),
                    ),
                    TableCell(
                      child: SizedBox(
                          height: 50,
                          child: Center(child: Text('Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),))),
                    ),
                    TableCell(
                      child: SizedBox(
                          height: 50,
                          child: Center(child: Text('Unit',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),))),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Text('Row 1, Column 1'),
                    ),
                    TableCell(
                      child: Text('Row 1, Column 2'),
                    ),
                    TableCell(
                      child: Text('Row 1, Column 3'),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Text('Row 2, Column 1'),
                    ),
                    TableCell(
                      child: Text('Row 2, Column 2'),
                    ),
                    TableCell(
                      child: Text('Row 2, Column 3'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  getDoctorAvailability() async{
    SharedPreferences prefs = await SharedPreferences
        .getInstance();
    String? id = prefs.getString('_id');
    final response = await http
        .get(Uri.parse('http://localhost:3000/api/v1/students/getStudent/$id'));
    print(response);
  }

}
