import 'package:flutter/material.dart';
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
            Text(
              'Routines',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
                color: Colors.amberAccent,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20,left: 20),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
                    child: SizedBox(
                      height:50,
                      width: 120,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Text(
                          'New Routine',
                        ),
                        backgroundColor: Colors.white60,

                      ),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: Text(
                        'Explore',
                      ),
                      backgroundColor: Colors.white60,
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}