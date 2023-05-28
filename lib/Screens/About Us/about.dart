import 'package:flutter/material.dart';
import '../drawer/sidemenu.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _HomeState();
}

class _HomeState extends State<About> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const SideMenu(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            title: const Text("About"),
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
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xff011422),
                      Colors.blueGrey.shade300,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: Image.asset('assests/newruh1.png'),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "UNIVERSITY OF RUHUNA",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "MEDICAL CENTER",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: const [
                    Text(
                      "About Us",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0D47A1),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "The University Comprehensive Medical Center is a leading healthcare provider, offering a wide range of medical services, including primary care, specialized treatments, diagnostic testing, and advanced surgical procedures. Our state-of-the-art facilities and experienced medical professionals ensure that you receive the best possible care. We are committed to providing personalized and compassionate care to all our patients, with a focus on promoting overall health and well-being.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Our History",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0D47A1),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "The University Comprehensive Medical Center has been a leader in healthcare for decades, with a rich history of innovation and excellence. We are committed to providing compassionate and personalized care to all our patients, with a focus on advancing medical research and education. Our team of expert physicians and researchers are dedicated to improving health outcomes and enhancing the well-being of our community. Trust us for world-class healthcare services and a patient-centric approach that puts your needs first.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
