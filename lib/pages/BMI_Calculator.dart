import 'package:flutter/material.dart';

class BMICalculatorPage extends StatefulWidget {
  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  double _feet = 5;
  double _inches = 6;
  double _weight = 50;

  String _bmiResult = '';
  String _status = '';
  String _advice = '';
  IconData? _statusIcon;
  Color _statusColor = Colors.transparent;

  void _calculateBMI() {
    double heightCm = (_feet * 30.48) + (_inches * 2.54);
    double bmi = _weight / ((heightCm / 100) * (heightCm / 100));

    _advice = ""; // Reset advice

    if (bmi < 18.5) {
      _status = "Underweight";
      _statusColor = Colors.blue;
      _statusIcon = Icons.sentiment_dissatisfied;
      _advice = "Try to eat nutritious food and consult a doctor.";
    } else if (bmi < 24.9) {
      _status = "Normal";
      _statusColor = Colors.green;
      _statusIcon = Icons.sentiment_satisfied;
      _advice = "You have a healthy body. Keep it up!";
    } else if (bmi < 29.9) {
      _status = "Overweight";
      _statusColor = Colors.orange;
      _statusIcon = Icons.warning_amber_rounded;
      _advice =
      "Try regular exercise, avoid junk food, and maintain a balanced diet.";
    } else {
      _status = "Obese";
      _statusColor = Colors.red;
      _statusIcon = Icons.warning;
      _advice =
      "You should consult a doctor. Consider a fitness plan and a healthy diet.";
    }

    // Over-height notice
    if (_feet > 6 || (_feet == 6 && _inches > 5)) {
      _advice +=
      "\n\nNote: You are quite tall. Make sure your diet supports your bone and muscle health.";
    }

    setState(() {
      _bmiResult = "Your BMI is ${bmi.toStringAsFixed(1)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0F7FA),
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF006064),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              "Height (Feet & Inches)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text("Feet: ${_feet.toInt()}",
                          style: TextStyle(color: Color(0xFF00796B), fontSize: 16)),
                      Slider(
                        min: 3,
                        max: 7,
                        divisions: 4,
                        value: _feet,
                        onChanged: (value) {
                          setState(() {
                            _feet = value;
                          });
                        },
                        activeColor: Color(0xFF00796B),
                        label: _feet.toStringAsFixed(0),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    children: [
                      Text("Inch: ${_inches.toInt()}",
                          style: TextStyle(color: Color(0xFF00796B), fontSize: 16)),
                      Slider(
                        min: 0,
                        max: 11,
                        divisions: 11,
                        value: _inches,
                        onChanged: (value) {
                          setState(() {
                            _inches = value;
                          });
                        },
                        activeColor: Color(0xFF00796B),
                        label: _inches.toStringAsFixed(0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Weight (kg): ${_weight.toInt()}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              min: 30,
              max: 150,
              divisions: 120,
              value: _weight,
              onChanged: (value) {
                setState(() {
                  _weight = value;
                });
              },
              activeColor: Color(0xFF00796B),
              label: _weight.toStringAsFixed(0),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _calculateBMI,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF004D40),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("CALCULATE BMI",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
            SizedBox(height: 32),
            if (_bmiResult.isNotEmpty)
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: _statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: _statusColor, width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(_statusIcon, size: 48, color: _statusColor),
                    SizedBox(height: 10),
                    Text(
                      _bmiResult,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: _statusColor,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      _status,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: _statusColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    if (_advice.isNotEmpty)
                      Text(
                        _advice,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.black87,
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
