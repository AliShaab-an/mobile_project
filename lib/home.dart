import 'package:flutter/material.dart';
import 'login.dart';
import 'BmiBmrPage.dart';
import 'WorkoutPage.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent[400],
        title: Text('Workout'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(
              color: Colors.grey[400],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8.0, 0, 0),
              child: Text(
                'Quick Start',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  color: Colors.lightGreenAccent[400],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 10),
              child: FloatingActionButton.extended(
                label: Text(
                  'Start Empty Workout',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[850],
                  ),
                ),
                icon: Icon(Icons.add),
                backgroundColor: Colors.lightGreenAccent[400],
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Workout()));
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
              child: Image.network(
                'data:image/jpeg;base64,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',
                width: 300,
                height:300,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 10),
              child: Text(
                'Body Mass Index',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  color: Colors.lightGreenAccent[400],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 10),
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BMICalculatorScreen()));
                },
                backgroundColor: Colors.lightGreenAccent[400],
                icon: Icon(Icons.calculate),
                label:  Padding(
                  padding: const EdgeInsets.fromLTRB(10.10, 10, 10, 10),
                  child: Text('Calculate Your BMI',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[850],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(right: 20, left: 20),
            )
          ],
        ),
      ),
    );
  }
}
