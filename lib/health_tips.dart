import 'package:flutter/material.dart';

class HealthTipsPage extends StatelessWidget {
  final List<HealthTip> tips = [
    HealthTip(
      title: "Eat More Vegetables",
      description:
      "Include at least 2–3 servings of colorful vegetables daily. They are rich in vitamins, minerals, and fiber.",
      category: "Nutrition",
      icon: Icons.restaurant,
    ),
    HealthTip(
      title: "Stay Hydrated",
      description:
      "Drink plenty of water throughout the day. It helps maintain energy levels and supports digestion.",
      category: "Hydration",
      icon: Icons.water_drop,
    ),
    HealthTip(
      title: "Move Every Day",
      description:
      "Aim for at least 30 minutes of moderate exercise like walking or cycling. It boosts heart health and mood.",
      category: "Exercise",
      icon: Icons.directions_run,
    ),
    HealthTip(
      title: "Get Enough Sleep",
      description:
      "7–9 hours of quality sleep is essential for recovery, brain function, and overall wellness.",
      category: "Sleep",
      icon: Icons.nightlight_round,
    ),
    HealthTip(
      title: "Manage Stress",
      description:
      "Practice mindfulness, meditation, or yoga to reduce stress and support mental health.",
      category: "Mental Health",
      icon: Icons.psychology_alt,
    ),
    HealthTip(
      title: "Limit Processed Foods",
      description:
      "Avoid excessive intake of sugary snacks, soda, and processed meats to reduce chronic disease risk.",
      category: "Nutrition",
      icon: Icons.fastfood,
    ),
    HealthTip(
      title: "Track Your Progress",
      description:
      "Use apps or journals to monitor your habits and celebrate small milestones toward better health.",
      category: "Habit Building",
      icon: Icons.checklist,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Health Tips", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Daily Health Tips",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ...tips.map((tip) => _buildTipCard(context, tip)).toList(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard(BuildContext context, HealthTip tip) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(tip.icon, color: Colors.green, size: 30),
                SizedBox(width: 10),
                Text(
                  tip.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              tip.category,
              style: TextStyle(fontSize: 12, color: Colors.green.shade800),
            ),
            Divider(color: Colors.grey[300], height: 24),
            Text(
              tip.description,
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

class HealthTip {
  final String title;
  final String description;
  final String category;
  final IconData icon;

  HealthTip({
    required this.title,
    required this.description,
    required this.category,
    required this.icon,
  });
}