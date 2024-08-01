import 'package:flutter/material.dart';
import 'exercise.dart';

class ExercisesList extends StatefulWidget {
  const ExercisesList({super.key});

  @override
  State<ExercisesList> createState() => _ExercisesListState();
}

class _ExercisesListState extends State<ExercisesList> {
  TextEditingController _controllerName = TextEditingController();
  bool _load = false;
  List<Exercise> _exercises = [];
  List<Exercise> _filteredExercises = []; // List to hold filtered exercises

  @override
  void initState() {
    super.initState();
    getExercise(update);
  }

  void update(bool success) {
    setState(() {
      _load = true;
      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Failed to load data',
            style: TextStyle(
              color: Colors.lightGreenAccent[400],
            ),
          ),
        ));
      } else {
        // Assuming getExercise sets the list of exercises
        _exercises = exercises; // Replace with actual exercise data
        _filteredExercises = _exercises;
      }
    });
  }

  void filterExercises(String query) {
    List<Exercise> filteredList = _exercises.where((exercise) {
      return exercise.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      _filteredExercises = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent[400],
        centerTitle: true,
        title: Text(
          'Add Exercise',
          style: TextStyle(
            color: Colors.grey[850],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextField(
                  controller: _controllerName,
                  onChanged: filterExercises,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.lightGreenAccent[400],
                  ),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightGreenAccent,
                      ),
                    ),
                    hintText: 'Search exercise',
                    hintStyle: const TextStyle(
                      color: Colors.lightGreenAccent,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightGreenAccent,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightGreenAccent,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightGreenAccent,
                      ),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightGreenAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredExercises.length,
                itemBuilder: (context, index) {
                  final exercise = _filteredExercises[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context, exercise);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Row(
                        children: [
                          Hero(
                            tag: 'exercise-image-$index',
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(exercise.imageUrl),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                exercise.name,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightGreenAccent[400],
                                ),
                              ),
                              Text(
                                exercise.muscleTarget,
                                style: TextStyle(
                                  color: Colors.lightGreenAccent[400],
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
