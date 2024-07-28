import 'package:flutter/material.dart';
import 'WorkoutPage.dart';
import 'BmiBmrPage.dart';


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
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(
              color: Colors.grey[400],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,8.0,0,0),
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
              padding: const EdgeInsets.fromLTRB(10.0,10,10,10),
              child: FloatingActionButton.extended(
                label: Text('Start Empty Workout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[850],
                ),
                ),
                icon: Icon(Icons.add),
                backgroundColor: Colors.lightGreenAccent[400],
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Workout()));
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                child:
                Image.network(
                  'data:image/jpeg;base64,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',
                  width: 300,
                  height:300,
                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0,10,10,10),
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
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BMICalculatorScreen()));
              },
              backgroundColor: Colors.lightGreenAccent[400],
              icon: Icon(Icons.calculate),
              label:  Padding(
                padding: const EdgeInsets.fromLTRB(10.10,10,10,10),
                child: Text('Claculate Your BMI',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[850],
                ),
                ),
              ),
                        ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(right: 20,left: 20),
            )
          ],
        ),
      ),
    );
  }
}