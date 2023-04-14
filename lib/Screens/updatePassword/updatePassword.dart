import 'dart:convert';
import 'package:flutter/foundation.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../drawer/sidemenu.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import '../home/home.dart';


class UpdatePassword extends StatefulWidget {
  const UpdatePassword({Key? key}) : super(key: key);

  @override
  State<UpdatePassword> createState() => _HomeState();
}
//String id =constraint.id;

class _HomeState extends State<UpdatePassword> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool _isObscure = true;
  String name = "";
  String email = "";
  String role = "";
  String dayOb = "";
  String rNum = "";
  int age =0;
  String fac = "";
  //String mobile = "";
  //String Gender ="";
  //String address = "";
// Update password api call
  String passwordCurrent = "";
  String password = "";
  String passwordConfirm = "";







//Get student personal information

  Future<void> fetchPersonalInfo() async {
    SharedPreferences prefs = await SharedPreferences
        .getInstance();
    String? id = prefs.getString('_id');
    final response = await http
        .get(Uri.parse('http://localhost:3000/api/v1/students/getStudent/$id'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final user = data['data']['student'];
      setState(() {
        name = user['name'];
        email = user['email'];
        role = user['role'];
        dayOb = user['dateOfBirth'];
        rNum = user['regNo'];
        age = user['age'];
        //fac = user['faculty'];
        //mobile = user['mobile'];
        //Gender = user['gender'];
        //address = user['address'];



      });


      if (kDebugMode) {
        print(name);
      }
    } else {
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}.');
      }
    }


  }

  @override
  void initState() {
    super.initState();
    fetchPersonalInfo();

  }
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        drawer: const SideMenu(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            title: const Text("Update Password"),
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
                      backgroundImage: NetworkImage('assests/profile.jpg'),
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
              const SizedBox(height: 100,),
              Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[

                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        obscureText: _isObscure,
                        //controller: passwordController,
                        decoration: InputDecoration(
                          //suffix: Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  if(_isObscure){
                                    _isObscure = false;
                                  }else{
                                    _isObscure = true;
                                  }
                                });
                              },

                              icon:Icon(
                                  _isObscure == true?Icons.remove_red_eye:Icons.password
                              )


                          ),
                          border: const OutlineInputBorder(),
                          labelText: 'Current Password',
                        ),
                        validator: Validators.compose([Validators.required('require password..')] ),
                        onChanged:(value){
                          passwordCurrent = value;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        obscureText: _isObscure,
                        //controller: passwordController,
                        decoration: InputDecoration(
                          //suffix: Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  if(_isObscure){
                                    _isObscure = false;
                                  }else{
                                    _isObscure = true;
                                  }
                                });
                              },

                              icon:Icon(
                                  _isObscure == true?Icons.remove_red_eye:Icons.password
                              )


                          ),
                          border: const OutlineInputBorder(),
                          labelText: 'New Password',
                        ),
                        validator: Validators.compose([Validators.required('require password..')] ),
                        onChanged:(value){
                          password = value;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        obscureText: _isObscure,
                       // controller: passwordController,
                        decoration: InputDecoration(
                          //suffix: Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  if(_isObscure){
                                    _isObscure = false;
                                  }else{
                                    _isObscure = true;
                                  }
                                });
                              },

                              icon:Icon(
                                  _isObscure == true?Icons.remove_red_eye:Icons.password
                              )


                          ),
                          border: const OutlineInputBorder(),
                          labelText: 'Confirm Password',
                        ),
                        validator: Validators.compose([Validators.required('require password..')] ),
                        onChanged:(value){
                          passwordConfirm = value;
                        },
                      ),
                    ),
                    Container(

                      padding: const EdgeInsets.fromLTRB(10, 10, 10,10),

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape:const StadiumBorder() ,
                          minimumSize: const Size.fromHeight(50),
                        ),

                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            if (kDebugMode) {
                              print('Success');
                              print(email);
                            }





                            // pass to email to the endpoint
                            // showDialog(
                            //   context: context,
                            //   barrierDismissible: false,
                            //   builder: (BuildContext context) {
                            //     return AlertDialog(
                            //       content: Row(
                            //         children: const <Widget>[
                            //           CircularProgressIndicator(),
                            //           SizedBox(width: 20),
                            //           Text("Logging in..."),
                            //         ],
                            //       ),
                            //     );
                            //   },
                            // );
                            updatePassword(passwordCurrent, password, passwordConfirm);


                          }

                        },
                        child: const Text(
                            'Update Password'
                        ),

                      ),
                    ),





                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  updatePassword(passwordCurrent, password,passwordConfirm) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('_id');
    var url = "http://localhost:3000/api/v1/auth/updatePassword/$id";
    final response = await http.patch(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',

      },
      body: jsonEncode(<String, String>{
        'passwordCurrent':passwordCurrent,'password':password,'passwordConfirm':passwordConfirm
      }),
    );

    if (kDebugMode) {
      print(response.body);
    }
    var parse = jsonDecode(response.body);


    if(response.statusCode == 200){

      if(parse['status'] == "success"){

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Update Password"),
              content: const Text("Updated Successfully"),
              actions: <Widget>[
                TextButton(
                  onPressed: () =>
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                ),
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }



    }else{
      if(parse['status'] == "error"){
        await prefs.setString('update_message', parse['message']);
        String? message = prefs.getString("update_message");
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Update Password"),
              content:  Text(message!),
              actions: <Widget>[
                TextButton(
                  onPressed: () =>
                      Navigator.pop(context),
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
        if (kDebugMode) {
          print(message);
        }
      }

      //if (!mounted) return;






    }



  }

}

