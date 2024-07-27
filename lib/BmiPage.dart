import 'package:flutter/material.dart';
import 'home.dart';
class Bmi extends StatelessWidget {
  const Bmi({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent[400],
        title: Text(
        'BMI Calculater',
        style:TextStyle(
         ),
        ),
          centerTitle: true,
      ),
    );
  }
}
