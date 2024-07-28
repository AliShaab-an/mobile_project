import 'package:flutter/material.dart';
import 'exercise.dart';
import 'ExercisesList.dart';


class Workout extends StatefulWidget {
  const Workout({super.key});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent[400],
        title: Text(
          'Log Workout',
          style:TextStyle(
            color: Colors.grey[850],
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 60,
              height: 30,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.lightGreenAccent[400],
                child: Text(
                  'Finish',
                  style: TextStyle(
                    color: Colors.grey[850],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Volume',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 85,
                ),
                Text(
                  'Sets',
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
                Text(
                  '0Kg',
                  style: TextStyle(
                    color: Colors.lightGreenAccent[400],
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 105,
                ),
                Text(
                  '0',
                  style: TextStyle(
                    color: Colors.lightGreenAccent[400],
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                final exercise = exercises[index];
                return Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(exercise.imageUrl),
                        ),
                        SizedBox(width: 10),
                        Text(
                          exercise.name,
                          style: TextStyle(
                            color: Colors.lightGreenAccent[400],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.grey),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              width: 300,
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => exercisesList()
                  ),
                  );
                },
                label: Text('Add Exercise',
                style:TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[850],
                ) ,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                icon: Icon(Icons.add),
                backgroundColor: Colors.lightGreenAccent[400],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




