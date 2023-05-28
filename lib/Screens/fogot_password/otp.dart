import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'resetPassword.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => OtpState();
}

class OtpState extends State<Otp> {

  //var id="";
  late var mobileNumber = "09009" ; // Example mobile number
  int _secondsRemaining = 120;
  Timer? _timer;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController textField1Controller = TextEditingController();
  final TextEditingController textField2Controller = TextEditingController();
  final TextEditingController textField3Controller = TextEditingController();
  final TextEditingController textField4Controller = TextEditingController();


  getMobile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('mobile') != null){
      mobileNumber = prefs.getString('mobile')!;
    }

    print(mobileNumber);
  }



  @override
  void initState() {
    super.initState();
    startTimer();
    getMobile();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_secondsRemaining <= 0) {
          _timer?.cancel();
        } else {
          _secondsRemaining--;
        }
      });
    });
  }

  String getFormattedTime() {
    final minutes = (_secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsRemaining % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  // call the api

  sendOtp(otp) async {
    String urL = dotenv.get("API",fallback:"");
    var url = "$urL/auth/resetPasswordViaOTP/mobile";

    final response = await http.post(
      Uri.parse(url),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',

      },
      body: jsonEncode(<String, String>{
        'passwordResetOTP':otp,

      }),
    );

    if (kDebugMode) {
      print(response.body);
    }
    var parse = jsonDecode(response.body);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(response.statusCode == 201){

      if(parse['status'] == "success"){
        await prefs.setString('status', parse['status']);


      }

    }else{
      if(parse['status'] == "fail"){
        //await prefs.setString('status', parse['success']);
      }
      String? message = prefs.getString("status");

      if (kDebugMode) {
        print("otp field");
      }
      if (kDebugMode) {
        print(otp);
      }

    }
  }

  //resend Opt

  sendEmail(email) async{
    String urL = dotenv.get("API",fallback:"");
    var url = "$urL/auth/forgotPasswordMobile";

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

    bool showResendButton = _secondsRemaining <= 0;
    if (_timer == null || !_timer!.isActive) {
      startTimer();
    }
    String maskedNumber = 'XXX-XXX-X${mobileNumber.substring(mobileNumber.length - 3)}';
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
                const SizedBox(height: 50,),

                const Text(
                  'Enter Verification Code',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),),
                const SizedBox(height: 20,),
                Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 20,),
                      const Text('We have send verification to'),
                      const SizedBox(height: 10,),
                      Text(maskedNumber),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              controller: textField1Controller,
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.red,
                              inputFormatters: [LengthLimitingTextInputFormatter(1)],
                              textAlign: TextAlign.center,
                              validator: Validators.compose([Validators.required('required')] ),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              controller: textField2Controller,
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.red,
                              inputFormatters: [LengthLimitingTextInputFormatter(1)],
                              textAlign: TextAlign.center,
                              validator: Validators.compose([Validators.required('required')] ),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              controller: textField3Controller,
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.red,
                              inputFormatters: [LengthLimitingTextInputFormatter(1)],
                              textAlign: TextAlign.center,
                              validator: Validators.compose([Validators.required('required')] ),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              controller: textField4Controller,
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.red,
                              inputFormatters: [LengthLimitingTextInputFormatter(1)],
                              textAlign: TextAlign.center,
                              validator: Validators.compose([Validators.required('required')] ),
                            ),
                          )
                        ],
                      ),
                      Text("Resend Code after ${getFormattedTime()}"),
                      const SizedBox(height: 50,),


                      Row(

                        //padding: const EdgeInsets.fromLTRB(10, 10, 10,10),
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(shape:const StadiumBorder() ,
                              // minimumSize: const Size.fromHeight(50),
                            ),

                            onPressed: showResendButton ? () async {
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              String? email = prefs.getString('email');
                              sendEmail(email);

                            } : null,
                            child: const Text(
                                'Resend Code'
                            ),

                          ),
                          const SizedBox(width: 20,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(shape:const StadiumBorder() ,
                              //minimumSize: const Size.fromHeight(4),
                            ),

                            onPressed: !showResendButton ? () async {

                              if (_formkey.currentState!.validate()) {
                                String concatenatedString = textField1Controller.text +
                                    textField2Controller.text +
                                    textField3Controller.text +
                                    textField4Controller.text;
                                print(concatenatedString);

                                // call sendOtp
                                if(concatenatedString != null){
                                  sendOtp(concatenatedString);
                                }

                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                String? message = prefs.getString("status");
                                if (message == "success") {
                                  print('Success');
                                  if (!mounted) return;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const R_password()),
                                  );
                                }

                                //print(email);




                              }

                            }:null,
                            child: const Text(
                                'Confirm code'
                            ),

                          ),
                        ],
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
