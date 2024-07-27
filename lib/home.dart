import 'package:flutter/material.dart';
import 'WorkoutPage.dart';
import 'BmiPage.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
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
            Text(
              'Quick Start',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                color: Colors.amberAccent,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0,10,10,10),
              child: FloatingActionButton.extended(
                label: const Text('Start Empty Workout'),
                icon: Icon(Icons.add),
                backgroundColor: Colors.white60,
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
                  'https://images.unsplash.com/photo-1637430308606-86576d8fef3c?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with your image URL
                  width: 300,
                  height:300,
                  fit: BoxFit.cover,
                ),
              ),
            Text(
              'Body Mass Index',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                color: Colors.amberAccent,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0,10,10,10),
              child: FloatingActionButton.extended(
                label: const Text('Claculate Your BMI'),
                icon: Icon(Icons.calculate),
                backgroundColor: Colors.white60,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Bmi()));
                },
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