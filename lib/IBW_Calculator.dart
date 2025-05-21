import 'package:flutter/material.dart';

class IBWCalculatorPage extends StatefulWidget {
  @override
  _IBWCalculatorPageState createState() => _IBWCalculatorPageState();
}

class _IBWCalculatorPageState extends State<IBWCalculatorPage> {
  double heightFeet = 5;
  double heightInches = 6;
  String gender = 'Male';
  double ibw = 0;

  void calculateIBW() {
    double totalInches = (heightFeet * 12) + heightInches;
    double baseHeight = 60;

    double extraInches = totalInches - baseHeight;
    if (extraInches < 0) extraInches = 0;

    setState(() {
      ibw = gender == 'Male'
          ? 50 + (2.3 * extraInches)
          : 45.5 + (2.3 * extraInches);
    });
  }

  @override
  void initState() {
    super.initState();
    calculateIBW();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back
          },
        ),
        title: Text('IBW Calculator', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.shade700, Colors.green.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.fromLTRB(16, 100, 16, 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('Select Gender'),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(gender, style: TextStyle(fontSize: 18)),
                        DropdownButton<String>(
                          value: gender,
                          items: ['Male', 'Female']
                              .map((g) => DropdownMenuItem(
                            value: g,
                            child: Text(g),
                          ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              gender = value!;
                              calculateIBW();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('Height (Feet & Inches)'),
                    SizedBox(height: 10),
                    _buildSlider('Feet', heightFeet, 4, 7, (value) {
                      setState(() {
                        heightFeet = value;
                        calculateIBW();
                      });
                    }),
                    SizedBox(height: 10),
                    _buildSlider('Inches', heightInches, 0, 11, (value) {
                      setState(() {
                        heightInches = value;
                        calculateIBW();
                      });
                    }),
                  ],
                ),
              ),
              SizedBox(height: 30),
              _buildResultCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.1),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green.shade700),
    );
  }

  Widget _buildSlider(String label, double value, double min, double max, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: ${value.toInt()}', style: TextStyle(fontSize: 16)),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
            activeTrackColor: Colors.green,
            inactiveTrackColor: Colors.green.shade100,
            thumbColor: Colors.green,
            overlayColor: Colors.green.withAlpha(32),
          ),
          child: Slider(
            value: value,
            min: min,
            max: max,
            divisions: (max - min).toInt(),
            onChanged: onChanged,
            label: value.toInt().toString(),
          ),
        ),
      ],
    );
  }

  Widget _buildResultCard() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.green.shade100.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.15),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Your Ideal Body Weight is:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 12),
          Text(
            '${ibw.toStringAsFixed(1)} kg',
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade900,
            ),
          ),
        ],
      ),
    );
  }
}