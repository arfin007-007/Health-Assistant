import 'package:flutter/material.dart';

class FindDoctorScreen extends StatelessWidget {
  final List<Map<String, dynamic>> diseases = [
    {'name': 'Diabetes', 'icon': Icons.opacity},
    {'name': 'Cardiology', 'icon': Icons.favorite},
    {'name': 'Dermatology', 'icon': Icons.healing},
    {'name': 'Pediatrics', 'icon': Icons.child_care},
    {'name': 'Neurology', 'icon': Icons.psychology},
    {'name': 'Orthopedics', 'icon': Icons.accessibility_new},
    {'name': 'Psychiatry', 'icon': Icons.psychology},
    {'name': 'Gastroenterology', 'icon': Icons.ramen_dining},
    {'name': 'Oncology', 'icon': Icons.local_hospital},
    {'name': 'Ophthalmology', 'icon': Icons.remove_red_eye},
  ];

  final Map<String, List<Map<String, String>>> doctorsByDisease = {
    'Diabetes': [
      {'name': 'Dr. John Smith', 'qualification': 'MD Endocrinology', 'phone': '+880123456789'},
      {'name': 'Dr. Alice Brown', 'qualification': 'Diabetes Specialist', 'phone': '+880987654321'},
      {'name': 'Dr. Robert Wilson', 'qualification': 'MD Internal Medicine', 'phone': '+880112233445'},
      {'name': 'Dr. Emily Davis', 'qualification': 'Endocrinologist', 'phone': '+880556677889'},
      {'name': 'Dr. Michael Lee', 'qualification': 'MD Endocrinology', 'phone': '+880998877665'},
    ],
    'Cardiology': [
      {'name': 'Dr. David Johnson', 'qualification': 'MD Cardiology', 'phone': '+880111222333'},
      {'name': 'Dr. Sarah White', 'qualification': 'Heart Specialist', 'phone': '+880444555666'},
      {'name': 'Dr. Kevin Moore', 'qualification': 'MD Cardiologist', 'phone': '+880777888999'},
      {'name': 'Dr. Laura Martin', 'qualification': 'Cardiology Consultant', 'phone': '+880123123123'},
      {'name': 'Dr. James Taylor', 'qualification': 'MD Cardiology', 'phone': '+880321321321'},
    ],
    'Dermatology': [
      {'name': 'Dr. Jessica Green', 'qualification': 'MD Dermatology', 'phone': '+880222333444'},
      {'name': 'Dr. Brian Thompson', 'qualification': 'Skin Specialist', 'phone': '+880555666777'},
      {'name': 'Dr. Amanda Clark', 'qualification': 'MD Dermatology', 'phone': '+880888999000'},
      {'name': 'Dr. Steven Rodriguez', 'qualification': 'Dermatologist', 'phone': '+880101010101'},
      {'name': 'Dr. Megan Lewis', 'qualification': 'MD Dermatology', 'phone': '+880202020202'},
    ],
    'Pediatrics': [
      {'name': 'Dr. Olivia Walker', 'qualification': 'MD Pediatrics', 'phone': '+880303030303'},
      {'name': 'Dr. Daniel Harris', 'qualification': 'Child Specialist', 'phone': '+880404040404'},
      {'name': 'Dr. Sophia Hall', 'qualification': 'Pediatrician', 'phone': '+880505050505'},
      {'name': 'Dr. Matthew Allen', 'qualification': 'MD Pediatrics', 'phone': '+880606060606'},
      {'name': 'Dr. Chloe Young', 'qualification': 'Child Health Expert', 'phone': '+880707070707'},
    ],
    'Neurology': [
      {'name': 'Dr. George King', 'qualification': 'MD Neurology', 'phone': '+880808080808'},
      {'name': 'Dr. Emma Scott', 'qualification': 'Neurologist', 'phone': '+880909090909'},
      {'name': 'Dr. Henry Adams', 'qualification': 'Neuro Specialist', 'phone': '+880121212121'},
      {'name': 'Dr. Laura Moore', 'qualification': 'MD Neurology', 'phone': '+880232323232'},
      {'name': 'Dr. Kevin Brown', 'qualification': 'Neurologist', 'phone': '+880343434343'},
    ],
    'Orthopedics': [
      {'name': 'Dr. Richard Lee', 'qualification': 'MD Orthopedics', 'phone': '+880454545454'},
      {'name': 'Dr. Anna Wilson', 'qualification': 'Orthopedic Surgeon', 'phone': '+880565656565'},
      {'name': 'Dr. Peter Clark', 'qualification': 'MD Orthopedics', 'phone': '+880676767676'},
      {'name': 'Dr. Michelle Young', 'qualification': 'Orthopedic Specialist', 'phone': '+880787878787'},
      {'name': 'Dr. Thomas Harris', 'qualification': 'MD Orthopedics', 'phone': '+880898989898'},
    ],
    'Psychiatry': [
      {'name': 'Dr. Susan White', 'qualification': 'MD Psychiatry', 'phone': '+880909001122'},
      {'name': 'Dr. Mark Davis', 'qualification': 'Psychiatrist', 'phone': '+880123443211'},
      {'name': 'Dr. Linda Thompson', 'qualification': 'MD Psychiatry', 'phone': '+880987650123'},
      {'name': 'Dr. Brian Scott', 'qualification': 'Mental Health Specialist', 'phone': '+880564738291'},
      {'name': 'Dr. Karen Miller', 'qualification': 'Psychiatrist', 'phone': '+880192837465'},
    ],
    'Gastroenterology': [
      {'name': 'Dr. James Anderson', 'qualification': 'MD Gastroenterology', 'phone': '+8801123581321'},
      {'name': 'Dr. Lisa Roberts', 'qualification': 'GI Specialist', 'phone': '+8803141592653'},
      {'name': 'Dr. Paul Walker', 'qualification': 'MD Gastroenterology', 'phone': '+8802718281828'},
      {'name': 'Dr. Emily Turner', 'qualification': 'GI Consultant', 'phone': '+8801618033988'},
      {'name': 'Dr. David Hill', 'qualification': 'MD Gastroenterology', 'phone': '+8802236067977'},
    ],
    'Oncology': [
      {'name': 'Dr. Michelle Adams', 'qualification': 'MD Oncology', 'phone': '+8801987654321'},
      {'name': 'Dr. Robert Johnson', 'qualification': 'Cancer Specialist', 'phone': '+8801234987654'},
      {'name': 'Dr. Sarah Lewis', 'qualification': 'MD Oncology', 'phone': '+8805678123490'},
      {'name': 'Dr. Kevin Wilson', 'qualification': 'Oncologist', 'phone': '+8804321098765'},
      {'name': 'Dr. Laura Clark', 'qualification': 'MD Oncology', 'phone': '+8803456789012'},
    ],
    'Ophthalmology': [
      {'name': 'Dr. Nancy Walker', 'qualification': 'MD Ophthalmology', 'phone': '+8800987654321'},
      {'name': 'Dr. George Hall', 'qualification': 'Eye Specialist', 'phone': '+8801234567809'},
      {'name': 'Dr. Rachel King', 'qualification': 'MD Ophthalmology', 'phone': '+8809876543210'},
      {'name': 'Dr. Steven Allen', 'qualification': 'Ophthalmologist', 'phone': '+8808765432109'},
      {'name': 'Dr. Patricia Moore', 'qualification': 'MD Ophthalmology', 'phone': '+8807654321098'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Find Doctor',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        backgroundColor: Colors.green[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: diseases.length,
        itemBuilder: (context, index) {
          final disease = diseases[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.green[100],
                child: Icon(
                  disease['icon'],
                  size: 32,
                  color: Colors.green[700],
                ),
              ),
              title: Text(
                disease['name'],
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900],
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.green[700]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoctorListScreen(
                      diseaseName: disease['name'],
                      doctors: doctorsByDisease[disease['name']] ?? [],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DoctorListScreen extends StatelessWidget {
  final String diseaseName;
  final List<Map<String, String>> doctors;

  const DoctorListScreen({
    Key? key,
    required this.diseaseName,
    required this.doctors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$diseaseName Doctors',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.green[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.lightBlue[100],
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.2),
                  blurRadius: 6,
                  offset: Offset(3, 4),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: Colors.green[700],
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(
                doctor['name'] ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6),
                  Text(
                    doctor['qualification'] ?? '',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Phone: ${doctor['phone'] ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
