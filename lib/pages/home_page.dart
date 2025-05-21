import 'package:development/FoodAndNutritionPage.dart';
import 'package:flutter/material.dart';
import 'package:development/pages/BMI_Calculator.dart';
import 'package:development/IBW_Calculator.dart';

import '../health_tips.dart'; // Import new page

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Health Assistant',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Welcome to Health Assistant',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildFeatureCard(context, 'Find a Doctor', Icons.local_hospital,
                    'Locate doctors and book appointments'),
                _buildFeatureCard(context, 'Blood Bank', Icons.bloodtype,
                    'Find blood centers and donations'),
                _buildFeatureCard(
                  context,
                  'Health Tips',
                  Icons.lightbulb_outline,
                  'Get personalized tips for better health',
                  navigateToHealthTips: true,
                ),
                _buildFeatureCard(
                  context,
                  'IBW Calculator',
                  Icons.fitness_center,
                  'Calculate your ideal body weight',
                  navigateToIBW: true,
                ),
                _buildFeatureCard(
                  context,
                  'Food & Nutrition',
                  Icons.food_bank,
                  'Learn about balanced diet and healthy eating',
                  navigateToFoodAndNutrition: true,
                ),
                _buildFeatureCard(
                  context,
                  'BMI Calculator',
                  Icons.accessibility,
                  'Calculate your BMI',
                  navigateToBMI: true,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility), label: 'BMI'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: 'IBW'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble), label: 'Chatbot'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
      BuildContext context,
      String title,
      IconData icon,
      String description, {
        bool navigateToBMI = false,
        bool navigateToIBW = false,
        bool navigateToHealthTips = false,
        bool navigateToFoodAndNutrition = false,
      }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          if (navigateToBMI) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BMICalculatorPage()),
            );
          } else if (navigateToIBW) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => IBWCalculatorPage()),
            );
          } else if (navigateToHealthTips) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HealthTipsPage()),
            );
          } else if (navigateToFoodAndNutrition) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FoodAndNutritionPage()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('More details coming soon for $title')),
            );
          }
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.green),
              SizedBox(height: 10),
              Text(title,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text(description, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}