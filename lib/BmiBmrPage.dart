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

  static const double optimalBMIUpper = 24.0;
  static const double overweightBMIUpper = 29.0;
  static const double minBMI = 19.0;

  void _calculateMetrics() {
    final heightCm = double.tryParse(_heightController.text);
    final weight = double.tryParse(_weightController.text);
    final age = int.tryParse(_ageController.text);

    if (heightCm == null || weight == null || age == null || heightCm <= 0 || weight <= 0 || age <= 0 || _selectedGender == null) {
      setState(() {
        _bmi = 0;
        _bmr = 0;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter valid values for all fields and select a gender')),
      );
      return;
    }

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
  }

  Color _getColorForBMI(double bmi) {
    if (bmi <= 0) {
      return Colors.transparent; // Default color for invalid BMI
    } else if (bmi >= minBMI && bmi <= optimalBMIUpper) {
      return Colors.green;
    } else if (bmi > optimalBMIUpper && bmi <= overweightBMIUpper) {
      return Colors.yellow;
    } else if (bmi < minBMI) {
      return Colors.blue;
    } else if (bmi > overweightBMIUpper) {
      return Colors.red;
    } else {
      return Colors.transparent;
    }
  }

  String _getBMICategory(double bmi) {
    if (bmi >= minBMI && bmi <= optimalBMIUpper) {
      return 'Optimal ($minBMI - $optimalBMIUpper)';
    } else if (bmi > optimalBMIUpper && bmi <= overweightBMIUpper) {
      return 'Overweight (${optimalBMIUpper} - ${overweightBMIUpper})';
    } else if (bmi < minBMI) {
      return 'Underweight (below $minBMI)';
    } else if (bmi > overweightBMIUpper) {
      return 'Obese (above $overweightBMIUpper)';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final fontSize = screenWidth * 0.05;

    final labelStyle = TextStyle(fontSize: fontSize * 0.8, color: Colors.lightGreenAccent[400]);
    final textStyle = TextStyle(fontSize: fontSize, color: Colors.lightGreenAccent[400]);
    final boxHeight = 20.0;

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
            _buildTextField(_heightController, 'Height (cm)', fontSize, labelStyle, textStyle),
            SizedBox(height: boxHeight),
            _buildTextField(_weightController, 'Weight (kg)', fontSize, labelStyle, textStyle),
            SizedBox(height: boxHeight),
            _buildTextField(_ageController, 'Age (years)', fontSize, labelStyle, textStyle),
            SizedBox(height: boxHeight),
            _buildGenderSelection(fontSize, labelStyle, textStyle),
            SizedBox(height: boxHeight),
            Text(
              _bmi > 0
                  ? 'Your BMI is ${_bmi.toStringAsFixed(2)}\nYour BMR is ${_bmr.toStringAsFixed(2)} kcal/day'
                  : 'Enter valid values and select gender',
              textAlign: TextAlign.center,
              style: textStyle,
            ),
            SizedBox(height: boxHeight),
            FloatingActionButton.extended(
              label: Text('Calculate', style: TextStyle(fontSize: fontSize)),
              icon: Icon(Icons.calculate, size: fontSize),
              backgroundColor: Colors.lightGreenAccent[400],
              onPressed: _calculateMetrics,
            ),
            SizedBox(height: boxHeight * 2), // Extra space before the color container
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  widthFactor: 0.9, // Adjust width factor as needed
                  child: Container(
                    height: screenWidth * 0.9, // Make height proportional to the width for a circle
                    decoration: BoxDecoration(
                      color: _getColorForBMI(_bmi),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        _bmi > 0 ? _getBMICategory(_bmi) : '',
                        style: textStyle.copyWith(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, double fontSize, TextStyle labelStyle, TextStyle textStyle) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: labelStyle,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightGreenAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightGreenAccent),
        ),
      ),
      style: textStyle,
      cursorColor: Colors.lightGreenAccent[400],
    );
  }

  Widget _buildGenderSelection(double fontSize, TextStyle labelStyle, TextStyle textStyle) {
    return Row(
      children: [
        Text('Gender:', style: labelStyle),
        SizedBox(width: fontSize * 0.5),
        Expanded(
          child: Row(
            children: [
              _buildGenderRadio('male', 'Male', fontSize, textStyle),
              SizedBox(width: fontSize),
              _buildGenderRadio('female', 'Female', fontSize, textStyle),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGenderRadio(String value, String label, double fontSize, TextStyle textStyle) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: _selectedGender,
          onChanged: (value) {
            setState(() {
              _selectedGender = value;
            });
          },
        ),
        Text(label, style: textStyle),
      ],
    );
  }
}
