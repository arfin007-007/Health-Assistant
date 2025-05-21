import 'package:flutter/material.dart';

class HealthTipsPage extends StatelessWidget {
  final List<Map<String, dynamic>> healthTips = [
    {
      'title': 'Stay Hydrated',
      'description': 'Drink at least 8 glasses of water every day to stay healthy and energized.',
      'icon': Icons.local_drink,
      'color': Colors.blueAccent,
    },
    {
      'title': 'Exercise Regularly',
      'description': 'Engage in at least 30 minutes of physical activity daily.',
      'icon': Icons.fitness_center,
      'color': Colors.orangeAccent,
    },
    {
      'title': 'Eat a Balanced Diet',
      'description': 'Include fruits, vegetables, whole grains, and lean proteins in your meals.',
      'icon': Icons.restaurant,
      'color': Colors.green,
    },
    {
      'title': 'Get Enough Sleep',
      'description': 'Aim for 7-9 hours of quality sleep each night.',
      'icon': Icons.bedtime,
      'color': Colors.purple,
    },
    {
      'title': 'Manage Stress',
      'description': 'Practice meditation, breathing exercises, or hobbies to reduce stress.',
      'icon': Icons.self_improvement,
      'color': Colors.teal,
    },
    {
      'title': 'Avoid Junk Food',
      'description': 'Reduce intake of sugary drinks, fried foods, and snacks.',
      'icon': Icons.no_food,
      'color': Colors.redAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        title: Text(
          'Health Tips',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: healthTips.length,
        itemBuilder: (context, index) {
          final tip = healthTips[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            color: tip['color'].withOpacity(0.1),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: tip['color'],
                child: Icon(tip['icon'], color: Colors.white),
              ),
              title: Text(
                tip['title'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: tip['color'],
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  tip['description'],
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
