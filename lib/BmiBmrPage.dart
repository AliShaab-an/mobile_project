import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();
  String? _selectedGender;
  double _bmi = 0;
  double _bmr = 0;

  void _calculateMetrics() {
    final heightCm = double.tryParse(_heightController.text) ?? 0;
    final weight = double.tryParse(_weightController.text) ?? 0;
    final age = int.tryParse(_ageController.text) ?? 0;

    if (heightCm > 0 && weight > 0 && age > 0 && _selectedGender != null) {

      final heightM = heightCm / 100;


      final bmi = weight / (heightM * heightM);


      double bmr;
      if (_selectedGender == 'male') {
        bmr = 10 * weight + 6.25 * heightCm - 5 * age + 5;
      } else {
        bmr = 10 * weight + 6.25 * heightCm - 5 * age - 161;
      }

      setState(() {
        _bmi = bmi;
        _bmr = bmr;
      });
    } else {
      setState(() {
        _bmi = 0;
        _bmr = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;


    double fontSize = screenWidth * 0.05;
    double padding = screenWidth * 0.0;

    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('BMI and BMR Calculator'),
        backgroundColor: Colors.lightGreenAccent[400],
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(_heightController, 'Height (cm)', fontSize),
            SizedBox(height: 20),
            _buildTextField(_weightController, 'Weight (kg)', fontSize),
            SizedBox(height: 20),
            _buildTextField(_ageController, 'Age (years)', fontSize),
            SizedBox(height: 20),
            _buildGenderSelection(fontSize),
            SizedBox(height:20),
            FloatingActionButton.extended(
              label: Text('Calculate', style: TextStyle(fontSize: fontSize)),
              icon: Icon(Icons.calculate, size: fontSize),
              backgroundColor: Colors.lightGreenAccent[400],
              onPressed: _calculateMetrics,
            ),
            SizedBox(height: 20),
            Text(
              _bmi > 0
                  ? 'Your BMI is ${_bmi.toStringAsFixed(2)}\nYour BMR is ${_bmr.toStringAsFixed(2)} kcal/day'
                  : 'Enter valid values and select gender',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: fontSize, color: Colors.lightGreenAccent[400]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, double fontSize) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: fontSize * 0.8, color: Colors.lightGreenAccent[400]),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightGreenAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightGreenAccent),
        ),
      ),
      style: TextStyle(fontSize: fontSize, color: Colors.lightGreenAccent[400]),
      cursorColor: Colors.lightGreenAccent[400],
    );
  }

  Widget _buildGenderSelection(double fontSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Gender:', style: TextStyle(fontSize: fontSize, color: Colors.lightGreenAccent[400])),
        SizedBox(width: fontSize * 0.5),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio<String>(
                value: 'male',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              Text('Male', style: TextStyle(fontSize: fontSize, color: Colors.lightGreenAccent[400])),
              SizedBox(width: fontSize),
              Radio<String>(
                value: 'female',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              Text('Female', style: TextStyle(fontSize: fontSize, color: Colors.lightGreenAccent[400])),
            ],
          ),
        ),
      ],
    );
  }
}
