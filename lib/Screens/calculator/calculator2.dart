import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../drawer/sidemenu.dart';

class Calculator2 extends StatefulWidget {

  const Calculator2({Key? key}) : super(key: key);

  @override
  State<Calculator2> createState() => _HomeState();
}

class _HomeState extends State<Calculator2> {
  TextEditingController weightController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  late double weight;
  late int minut;
  late String activity="Sedentary";

  void clWater(double weight , int minut, double activity){
      double weightInLbs = weight * 2.20462;
      double waterOunce = weightInLbs * minut / 30 * activity;
      double waterLeter = waterOunce * 0.02957;

      print(waterLeter);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        drawer: const SideMenu(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            title: const Text("Water Intake Calculator"),
            backgroundColor: const Color(0xff011422),
            toolbarHeight: 100,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(

            image: DecorationImage(
              image: AssetImage('assests/MyWater.png'),
              fit: BoxFit.cover,

            ),
          ),
          height: double.infinity,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white70,
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[

                        Container(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            //width:350,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: weightController,
                              decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.line_weight),
                                labelText: 'Your Weight',
                                border: OutlineInputBorder(),

                              ),
                              validator: Validators.compose([Validators.required('require Weight..')] ),
                              onChanged: (value){
                              double? parsedWeight = double.tryParse(value);
                                if (parsedWeight != null) {
                                   setState(() {
                                    weight = parsedWeight;
                                   });

                              }
                              },
                            ),
                          ),

                        ),
                        const SizedBox(height: 20,),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            //width:350,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: minuteController,
                              decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.height),
                                labelText: 'Active Minutes',
                                border: OutlineInputBorder(),

                              ),
                              validator: Validators.compose([Validators.required('require Weight..')] ),
                              onChanged: (value){
                                int? parsedInt = int.tryParse(value);
                                if (parsedInt != null) {
                                  setState(() {
                                    minut = parsedInt;
                                  });

                                }
                              },
                            ),
                          ),

                        ),
                        const SizedBox(height: 20,),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            //width:350,
                            child:  DropdownButton<String>(
                              value:activity,
                              items: <String>[
                                'Sedentary',
                                'Lightly Active',
                                'Moderately Active',
                                'Very Active',
                                'Extra Active',
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  activity = newValue!;
                                });
                              },
                            ),
                          ),

                        ),
                        const SizedBox(height: 20,),
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
                                  //print(email);
                                }





                                // pass to email to the endpoint

                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Row(
                                        children: const <Widget>[
                                          CircularProgressIndicator(),
                                          SizedBox(width: 20),
                                          Text("Logging in..."),
                                        ],
                                      ),
                                    );
                                  },
                                );


                              }

                            },
                            child: const Text(
                                'Calculate Water In Litres'
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
    );
  }

}