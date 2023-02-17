import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fogot_password.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class loginForm extends StatefulWidget {
  const loginForm({super.key, });

  @override
  State<loginForm> createState() => _loginFormState();
}

class _loginFormState extends State<loginForm> {
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
                                   decoration: BoxDecoration(
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
                                padding: EdgeInsets.all(10),
                                child: SizedBox(
                                  //width:350,
                                  child: TextFormField(

                                    controller: nameController,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.people),
                                      labelText: 'User name',
                                      border: OutlineInputBorder(),

                                    ),
                                    validator: Validators.compose([Validators.required('require user name..')] ),
                                  ),
                                ),

                              ),
                              Container(
                                padding: EdgeInsets.all(10),
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
                                    border: OutlineInputBorder(),
                                    labelText: 'password',
                                  ),
                                  validator: Validators.compose([Validators.required('require password..')] ),
                                ),
                              ),
                               Container(

                                padding: EdgeInsets.fromLTRB(10, 10, 10,10),

                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(shape:StadiumBorder() ,
                                    minimumSize: const Size.fromHeight(50),
                                  ),

                                  onPressed: (){
                                    if(_formkey.currentState!.validate()){
                                      print('Succes');
                                    }
                                  },
                                  child: Text(
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
                                child: Text('Fogot Password?'),
                              ),
                              Container(
                                //height: ,
                                margin: EdgeInsets.all(50),
                                child: Text(
                                  'University of Ruhuna',
                                  textAlign: TextAlign.center,
                                  style:GoogleFonts.inter(
                                    fontSize:  20,
                                    fontWeight:  FontWeight.w400,
                                    height:  10,
                                    letterSpacing:  3.75,
                                    color:  Color(0xff011422),
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
