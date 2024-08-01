import 'package:flutter/material.dart';
import 'exercise.dart';
import 'ExercisesList.dart';
import 'workout_summary.dart'; // Import the WorkoutSummary page

class Workout extends StatefulWidget {
  const Workout({super.key});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  List<Map<String, dynamic>> exercises = [];
  int totalSets = 0;
  int totalVolume = 0;

  void addSet(int exerciseIndex) {
    setState(() {
      exercises[exerciseIndex]['sets'].add({
        'set': exercises[exerciseIndex]['sets'].length + 1,
        'weight': 0,
        'reps': 0,
        'checked': false
      });
    });
  }

  void updateSet(int exerciseIndex, int setIndex, String key, String value) {
    setState(() {
      exercises[exerciseIndex]['sets'][setIndex][key] = int.tryParse(value) ?? 0;
      updateVolumeAndSets();
    });
  }

  void toggleCheckbox(int exerciseIndex, int setIndex, bool? value) {
    setState(() {
      exercises[exerciseIndex]['sets'][setIndex]['checked'] = value ?? false;
      updateVolumeAndSets();
    });
  }

  void updateVolumeAndSets() {
    int setsCount = 0;
    int volumeCount = 0;
    for (var exercise in exercises) {
      for (var set in exercise['sets']) {
        if (set['checked'] == true) {
          setsCount++;
          volumeCount += (set['weight'] as int) * (set['reps'] as int);
        }
      }
    }
    totalSets = setsCount;
    totalVolume = volumeCount;
  }

  void addExercise() async {
    final newExercise = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExercisesList()),
    );
    if (newExercise != null) {
      setState(() {
        exercises.add({
          'exercise': newExercise,
          'sets': [{'set': 1, 'weight': 0, 'reps': 0, 'checked': false}]
        });
      });
    }
  }

  void finishWorkout() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkoutSummary(
          totalVolume: totalVolume,
          totalSets: totalSets,
        ),
      ),
    );
  }

  void discardWorkout() {
    Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent[400],
        title: Text(
          'Log Workout',
          style: TextStyle(
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
                onPressed: finishWorkout,
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
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Volume: $totalVolume kg',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  'Sets: $totalSets',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, exerciseIndex) {
                final exercise = exercises[exerciseIndex]['exercise'];
                final sets = exercises[exerciseIndex]['sets'] as List<Map<String, dynamic>>;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Hero(
                            tag: 'exercise-image-$exerciseIndex',
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(exercise.imageUrl),
                              radius: 30,
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Text(
                            exercise.name,
                            style: TextStyle(
                              color: Colors.lightGreenAccent[400],
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: sets.length,
                      itemBuilder: (context, setIndex) {
                        final set = sets[setIndex];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Set ${set['set']}',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 16,
                                ),
                              ),
                              Container(
                                width: 80,
                                child: TextField(
                                  onChanged: (value) => updateSet(exerciseIndex, setIndex, 'weight', value),
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                    color: Colors.lightGreenAccent[400],
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Weight',
                                    hintStyle: TextStyle(color: Colors.grey[600]),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.lightGreenAccent),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.lightGreenAccent),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 80,
                                child: TextField(
                                  onChanged: (value) => updateSet(exerciseIndex, setIndex, 'reps', value),
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                    color: Colors.lightGreenAccent[400],
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Reps',
                                    hintStyle: TextStyle(color: Colors.grey[600]),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.lightGreenAccent),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.lightGreenAccent),
                                    ),
                                  ),
                                ),
                              ),
                              Checkbox(
                                value: set['checked'] ?? false,
                                onChanged: (value) => toggleCheckbox(exerciseIndex, setIndex, value),
                                checkColor: Colors.grey[850],
                                activeColor: Colors.lightGreenAccent[400],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 40,
                        width: 300,
                        child: FloatingActionButton.extended(
                          onPressed: () => addSet(exerciseIndex),
                          label: Text(
                            'Add Set',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[850],
                            ),
                          ),
                          icon: Icon(Icons.add),
                          backgroundColor: Colors.lightGreenAccent[400],
                        ),
                      ),
                    ),
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
                onPressed: addExercise,
                label: Text(
                  'Add Exercise',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[850],
                  ),
                ),
                icon: Icon(Icons.add),
                backgroundColor: Colors.lightGreenAccent[400],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              width: 300,
              child: FloatingActionButton.extended(
                onPressed: discardWorkout,
                label: Text(
                  'Discard Workout',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[850],
                  ),
                ),
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
