import 'package:flutter/material.dart';
import 'home.dart';
class Bmi extends StatelessWidget {
  const Bmi({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text(
        'BMI Calculater',
        style:TextStyle(
    ),
    ),
        ), );
  }
}
