import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'fogot_password/fogot_password.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bottomTabBar/FabTabs.dart';
import '../fogot_password/fogot_password.dart';
import 'package:http/http.dart' as http;



class loginForm extends StatefulWidget {
  //final User user;


  const loginForm({super.key, });

  @override
  State<loginForm> createState() => _loginFormState();
}

class _loginFormState extends State<loginForm> {

  var email;
  var password;
  var id;
      TextEditingController nameController = TextEditingController();
      TextEditingController passwordController = TextEditingController();
      final _formkey = GlobalKey<FormState>();
      bool _isObscure = true;



  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;
    return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body:Container(
              height: size.height,
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
                                        Container(
                                          height: 90,
                                          width: 90,

                                          child: Image.asset('assests/newruh1.png',),
                                        ),
                                      ],

                                    ),

                                ),

                    Container(
                      child: SizedBox(
                        width: 320,
                        height: 200,
                        child: Image.asset(
                          'assests/main_logo.png',
                          height: 100,
                        ),
                      ),
                    ),
                    Container(
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: <Widget>[

                              Container(
                                padding: const EdgeInsets.all(10),
                                child: SizedBox(
                                  //width:350,
                                  child: TextFormField(

                                    controller: nameController,
                                    decoration: const InputDecoration(
                                      suffixIcon: Icon(Icons.people),
                                      labelText: 'User name',
                                      border: OutlineInputBorder(),

                                    ),
                                    validator: Validators.compose([Validators.required('require user name..')] ),
                                    onChanged: (value){
                                      email= value;
                                    },
                                  ),
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
                                    labelText: 'password',
                                  ),
                                  validator: Validators.compose([Validators.required('require password..')] ),
                                  onChanged:(value){
                                    password = value;
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
                                    if(_formkey.currentState!.validate()){
                                      print('Succes');
                                    }
                                    print(email);
                                    // pass to email to the endpoint
                                    signup(email, password);
                                    SharedPreferences prefs = await SharedPreferences.getInstance();

                                    String? token =prefs.getString("token");
                                    String? _id =prefs.getString("_id");
                                    id=_id;
                                    constraint.id = _id!;
                                    print(_id);

                                    //get token

                                    if(token != null){
                                      Navigator.of(context).push(

                                        MaterialPageRoute(builder: (context) => FabTabs(selectedIndex:0) ),
                                      );
                                    }else{
                                      print("login error");
                                    }

                                  },
                                  child: const Text(
                                      'LOG IN'
                                  ),

                                ),
                              ),
                              TextButton(
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const f_password()),
                                  );
                                },
                                child: const Text('Fogot Password?'),
                              ),
                              Container(
                                //height: ,
                                margin: const EdgeInsets.all(50),
                                child: Text(
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
                              ),



                            ],
                          ),
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

// Authontication for login

signup(email, password) async{
  var url = "http://localhost:3001/api/v1/users/login";
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email':email,'password':password,
    }),
  );

 print(response.body);


  var parse = jsonDecode(response.body);
  var user = parse["data"]["user"];
  var userId = user["_id"];



  //print(userId);
  SharedPreferences prefs = await SharedPreferences.getInstance();
 await prefs.setString('_id', userId);
  await prefs.setString('token', parse["token"]);



}

class constraint{
  static String id ="";
}






