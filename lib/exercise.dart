import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Exercise {
  final String name;
  final String imageUrl;
  final String targetMuscle;

  Exercise(
      {required this.name, required this.imageUrl, required this.targetMuscle});

}

List <Exercise> exercises=[];


void getExercises(Function(bool success) update) async {
  const _baseURL = 'gymrat.sportsontheweb.net'; // Replace with your actual base URL

  try {
    final url = Uri.http(_baseURL, 'mycompany/getProducts.php');
    final response = await http.get(url).timeout(
        const Duration(seconds: 5)); // max timeout 5 seconds

    exercises.clear();

    if (response.statusCode == 200) { // if successful call
      final jsonResponse = convert.jsonDecode(
          response.body); // create dart json object from json array

      for (var row in jsonResponse) { // iterate over all rows in the json array
         Exercise exercise = Exercise.fromJson(row);
         exercises.add(
             exercise); // add the exercise object to the exercises list


      update(
          true); // callback update method to inform that we completed retrieving data
    } else {
      throw Exception('Failed to load exercises');
    }
  } catch (e) {
    print('Error loading data with error: ${e.toString()}');
    update(false); // inform through callback that we failed to get data
  }
}