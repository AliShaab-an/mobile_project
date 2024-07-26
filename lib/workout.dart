import 'package:flutter/material.dart';
import 'home.dart';

class Workout extends StatefulWidget {
  const Workout({super.key});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text(
          'Log Workout',
          style:TextStyle(
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 60,
              height: 30,
              child: FloatingActionButton(onPressed: (){},
                backgroundColor: Colors.black,
                  child: Text(
                    'finish',
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
              ),
            ),
          ),
        ],
      ),
      body:const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('volume',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 85,
                ),
                Text('Sets',
                  style: TextStyle(
                  color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('0Kg',
                  style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 105,
                ),
                Text('0',
                  style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Expanded(
        child: ListView.builder(
          itemCount: workouts.length,
            itemBuilder: (context, index){
            return Column(

             ),
         },
        );
      ),

      Expanded(
        child:FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Add Exercise'),
          icon: Icon(Icons.add),
          backgroundColor: Colors.white60,
        ),

      )
    );
  }
}