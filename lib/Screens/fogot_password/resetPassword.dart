import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'otp.dart';
import 'package:http/http.dart' as http;
import '../login/login_form.dart';

class R_password extends StatefulWidget {
  const R_password({Key? key}) : super(key: key);

  @override
  State<R_password> createState() => R_passwordState();
}

class R_passwordState extends State<R_password> {
  var newPassword="";
  var newConfirmPassword="";
  var id="00";

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool _isObscure = true;

  passwordReset(newPassword, newConfirmPassword,id) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //String? id = prefs.getString('id');
    String urL = dotenv.get("API",fallback:"");
    var url = "$urL/auth/resetpasswordMobile";
    final response = await http.patch(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',

      },
      body: jsonEncode(<String, String>{
        'newPassword':newPassword,'newConfirmPassword':newConfirmPassword,'id':id,
      }),
    );

    if (kDebugMode) {
      print(response.body);
    }
    var parse = jsonDecode(response.body);


    if(response.statusCode == 201){

      if(parse['status'] == "success"){
        await prefs.setString('token', parse["token"]);
        String message = parse['status'];
        if (!mounted) return;
        // Navigator.pop(context);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Password Reset Success"),
              content: Text(message!),
              actions: <Widget>[
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>
                            Builder(
                              builder: (BuildContext builderContext) =>
                              const LoginForm(),
                            )),
                      ),
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );


      }



    }else{
      SharedPreferences prefs = await SharedPreferences
          .getInstance();

      if(parse['status'] == "fail"){
        await prefs.setString('message', parse['status']);
      }
      String? message = prefs.getString("message");
      if (!mounted) return;
      Navigator.pop(context);
      if (kDebugMode) {
        print("password reset faild");
      }
      if (kDebugMode) {
        print(message);
      }

      await prefs.remove('_id');
      await prefs.remove('token');
      //await prefs.remove('status');
      showDialog(
        context: context,
        builder: (BuildContext context) {

          return AlertDialog(
            title: const Text("Password Reset Failed"),
            content: Text(message!),
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

    }



  }




  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body:Container(
          height:double.infinity,
          width: size.width,
          color:Colors.white ,
          child:SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[


                Container(
                  //color:Color(0xff011422),
                  height:200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assests/black_theam1.png',),
                    ),
                  ),


                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 90,
                        width: 90,

                        child: Image.asset('assests/newruh1.png',),
                      ),
                    ],

                  ),

                ),

                SizedBox(
                  width: 320,
                  height: 200,
                  child: Image.asset(
                    'assests/main_logo.png',
                    height: 100,
                  ),
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      const Text('Reset Password'),

                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          obscureText: _isObscure,
                          controller: passwordController,
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
                            newPassword = value;
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          obscureText: _isObscure,
                          controller: passwordController,
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
                            labelText: 'New Password Confirm',
                          ),
                          validator: Validators.compose([Validators.required('require password..')] ),
                          onChanged:(value){
                            newConfirmPassword = value;
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
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            String? id = prefs.getString('_id');
                            if (_formkey.currentState!.validate()) {
                              if (kDebugMode) {
                                print('Success');
                                //print(email);

                              }
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Row(
                                      children: const <Widget>[
                                        CircularProgressIndicator(),
                                        SizedBox(width: 20),
                                        Text("Password reset..."),
                                      ],
                                    ),
                                  );
                                },
                              );
                              // call passwordReset
                              passwordReset(newPassword, newConfirmPassword, id);


                            }

                          },
                          child: const Text(
                              'Password reset'
                          ),

                        ),
                      ),

                      Text(
                        'University of Ruhuna',
                        textAlign: TextAlign.center,
                        style:GoogleFonts.inter(
                          fontSize:  20,
                          fontWeight:  FontWeight.w400,
                          height:  10,
                          letterSpacing:  3.75,
                          color:  const Color(0xff011422),
                        ),
                      ),



                    ],
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );


  }



}
