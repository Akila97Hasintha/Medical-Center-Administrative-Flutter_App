import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'otp.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class F_password extends StatefulWidget {
  const F_password({Key? key}) : super(key: key);

  @override
  State<F_password> createState() => F_passwordState();
}

class F_passwordState extends State<F_password> {
  var email="";
  var password="";
  //var id="";
  TextEditingController nameController = TextEditingController();

  final _formkey = GlobalKey<FormState>();


  sendEmail(email) async{
    String urL = dotenv.get("API",fallback:"");
    var url = "$urL/auth/forgotPasswordMobile";
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
        'email':email,

      }),
    );

    if (kDebugMode) {
      //print(response.body);
    }
    var parse = jsonDecode(response.body);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(response.statusCode == 200){

      if(parse['status'] == "success"){
        await prefs.setString('message', parse['message']);
        await prefs.setString('_id', parse['OneOfStudent']['_id']);
        await prefs.setString('mobile', parse['OneOfStudent']['mobile']);
        await prefs.setString('email', email);


      }

    }else{
      if(parse['status'] == "fail"){
        await prefs.setString('message', parse['message']);
      }
      String? message = prefs.getString("message");

      if (kDebugMode) {
        print("otp field");
      }
      if (kDebugMode) {
        print(message);
      }

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
                        child: SizedBox(
                          //width:350,
                          child: TextFormField(

                            controller: nameController,
                            decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.people),
                              labelText: 'Enter Your Email',
                              border: OutlineInputBorder(),

                            ),
                            validator: Validators.compose([Validators.required('require user Email..')] ),
                            onChanged: (value){
                              email= value;
                            },
                          ),
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
                                //print('Success');

                                print(email);
                                //call send email
                                sendEmail(email);

                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Otp()),
                              );


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
