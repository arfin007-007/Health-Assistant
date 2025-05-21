import 'package:flutter/material.dart';

class FoodAndNutritionPage extends StatelessWidget {
  final List<FoodGroup> foodGroups = [
    FoodGroup(
      name: 'Fruits',
      items: ['Apple', 'Banana', 'Orange', 'Grapes', 'Pineapple'],
      icon: Icons.apple,
      color: Colors.redAccent,
    ),
    FoodGroup(
      name: 'Vegetables',
      items: ['Broccoli', 'Carrot', 'Spinach', 'Tomato', 'Cucumber'],
      icon: Icons.local_florist,
      color: Colors.green,
    ),
    FoodGroup(
      name: 'Proteins',
      items: ['Chicken', 'Eggs', 'Tofu', 'Fish', 'Lentils'],
      icon: Icons.fastfood,
      color: Colors.orange,
    ),
    FoodGroup(
      name: 'Grains',
      items: ['Brown Rice', 'Oats', 'Quinoa', 'Whole Wheat Bread', 'Barley'],
      icon: Icons.grain,
      color: Colors.brown,
    ),
    FoodGroup(
      name: 'Dairy',
      items: ['Milk', 'Cheese', 'Yogurt', 'Butter', 'Paneer'],
      icon: Icons.icecream_outlined,
      color: Colors.blueGrey,
    ),
  ];

  final List<String> healthyTips = [
    "Eat a variety of colorful fruits and vegetables daily.",
    "Choose whole grains over refined grains for better fiber intake.",
    "Include lean proteins in every meal for muscle repair and growth.",
    "Limit added sugars and saturated fats.",
    "Drink plenty of water throughout the day.",
    "Avoid skipping meals; eat at regular intervals.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food & Nutrition", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Healthy Foods to Include",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ...foodGroups.map((group) => _buildFoodGroupCard(context, group)).toList(),
            SizedBox(height: 30),
            Text(
              "Healthy Eating Tips",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            Column(
              children: healthyTips.map((tip) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle_outline, size: 18, color: Colors.green),
                      SizedBox(width: 8),
                      Expanded(child: Text(tip)),
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodGroupCard(BuildContext context, FoodGroup group) {
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
                Icon(group.icon, color: group.color, size: 28),
                SizedBox(width: 10),
                Text(
                  group.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(color: Colors.grey[300], height: 24),
            Wrap(
              spacing: 10,
              runSpacing: 8,
              children: group.items.map((item) {
                return Chip(
                  label: Text(item),
                  backgroundColor: Colors.green.shade50,
                  avatar: CircleAvatar(
                    backgroundColor: Colors.green.shade100,
                    child: Text(
                      item[0],
                      style: TextStyle(fontSize: 12, color: Colors.green.shade900),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodGroup {
  final String name;
  final List<String> items;
  final IconData icon;
  final Color color;

  FoodGroup({
    required this.name,
    required this.items,
    required this.icon,
    required this.color,
  });
}