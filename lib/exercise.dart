import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

String _baseURL = 'gymrat.sportsontheweb.net';

class Exercise {
  int eid;
  String name;
  String imageUrl;
  String muscleTarget;

  Exercise(
      {required this.eid, required this.name, required this.imageUrl, required this.muscleTarget});

  @override
  String toString() {
    return 'Exercise{id: $eid, name: $name, imageUrl: $imageUrl, targetMuscle: $muscleTarget}';
  }
}

List<Exercise> exercises = [];

void getExercise(Function(bool success) update) async {
  try {
    final url = Uri.http(_baseURL, '4510049_exercises/GetExercises.php');
    final response = await http.get(url).timeout(const Duration(seconds: 5)); // max timeout 5 seconds

    exercises.clear(); // clear old exercises

    if (response.statusCode == 200) { // if successful call
      final jsonResponse = convert.jsonDecode(response.body); // create dart json object from json array
      for (var row in jsonResponse) { // iterate over all rows in the json array
        Exercise x = Exercise( // create a Exercise object from JSON row object
            eid: int.parse(row['id']),
            name: row['name'],
            imageUrl: row['imageUrl'],
            muscleTarget: row['targetMuscle']);
        exercises.add(x); // add the exercise object to the exercises list
      }
      update(true); // callback update method to inform that we completed retrieving data
    } else {
      update(false); // if the response code is not 200
    }
  } catch (e) {
    print('Error loading data with error ${e.toString()}');
    update(false); // inform through callback that we failed to get data
  }
}

void getExerciseByName(Function(String text) update, String name) async {
  try {
    final url = Uri.http(_baseURL, '4510049_exercises/GetExercisesByName.php', {'name': name});
    final response = await http.get(url).timeout(const Duration(seconds: 5)); // max timeout 5 seconds

    if (response.statusCode == 200) { // if successful call
      final jsonResponse = convert.jsonDecode(response.body); // create dart json object from json array
      if (jsonResponse.isEmpty) {
        update("No exercise found");
      } else {
        for (var row in jsonResponse) { // iterate over all rows in the json array, there should be at most one exercise as name is unique
          Exercise x = Exercise(
              eid: int.parse(row['id']),
              name: row['name'],
              imageUrl: row['imageUrl'],
              muscleTarget: row['targetMuscle']);
          update(x.toString()); // callback update method to inform that we completed retrieving data
          break;
        }
      }
    } else {
      update("Can't load data"); // if the response code is not 200
    }
  } catch (e) {
    print('Error loading data with error ${e.toString()}');
    update("Can't load data"); // inform through callback that we failed to get data
  }
}
