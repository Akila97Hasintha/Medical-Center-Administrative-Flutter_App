import 'package:flutter/material.dart';

import '../drawer/sidemenu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: AppBar(
          //title: Text("Medical Center"),
          //title: Text("Medical Center",style: TextStyle(color: Colors.white,fontSize: 25)),
          backgroundColor: const Color(0xff011422),
          toolbarHeight: 150,

          centerTitle: true,
          title: Column(
            children: [
              Image.asset(
                "assests/mc_logo_white.png",

                // height: 72.5,
                // width: 275.0,

                height: 60.5,
                width: 300.0,
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          //Container( // SizedBox or Container Can Add
          SizedBox(
            height: 200,
            child: Column(
              children: const [
                Text('Text 1'),
                Text('Text 2'),
                Text('Text 1'),
                Text('Text 2'),
                Text('Text 1'),
                Text('Text 2'),
                Text('Text 1'),
              ],
            ),
          ),

          Container(
            height: 200,
            color: Colors.grey,
            child: const Text("Medical Center Home Page"),
          ),
          Container(
            height: 200,
            color: Colors.green,
          ),
          Container(
            height: 200,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}
