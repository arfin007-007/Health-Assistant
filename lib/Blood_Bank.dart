import 'package:flutter/material.dart';

class BloodBankScreen extends StatefulWidget {
  @override
  _BloodBankScreenState createState() => _BloodBankScreenState();
}

class _BloodBankScreenState extends State<BloodBankScreen> {
  final List<Map<String, String>> donors = [
    {'name': '1. Rahim Uddin', 'bloodGroup': 'A+', 'location': 'Dhaka', 'contact': '01710000001'},
    {'name': '2. Sadia Jahan', 'bloodGroup': 'A-', 'location': 'Dhaka', 'contact': '01710000002'},
    {'name': '3. Tanjina Akter', 'bloodGroup': 'A+', 'location': 'Chattogram', 'contact': '01710000003'},
    {'name': '4. Imran Kabir', 'bloodGroup': 'A-', 'location': 'Sylhet', 'contact': '01710000004'},
    {'name': '5. Nila Sultana', 'bloodGroup': 'B+', 'location': 'Khulna', 'contact': '01710000005'},
    {'name': '6. Abir Hossain', 'bloodGroup': 'B-', 'location': 'Rajshahi', 'contact': '01710000006'},
    {'name': '7. Lamia Rahman', 'bloodGroup': 'AB+', 'location': 'Barishal', 'contact': '01710000007'},
    {'name': '8. Farhan Jamil', 'bloodGroup': 'AB-', 'location': 'Dhaka', 'contact': '01710000008'},
    {'name': '9. Nusrat Tania', 'bloodGroup': 'O+', 'location': 'Mymensingh', 'contact': '01710000009'},
    {'name': '10. Khaled Mahmud', 'bloodGroup': 'O-', 'location': 'Rangpur', 'contact': '01710000010'},
    {'name': '11. Tarek Aziz', 'bloodGroup': 'A+', 'location': 'Dhaka', 'contact': '01710000011'},
    {'name': '12. Moumita Nahar', 'bloodGroup': 'A-', 'location': 'Chattogram', 'contact': '01710000012'},
    {'name': '13. Zihad Hossain', 'bloodGroup': 'B+', 'location': 'Sylhet', 'contact': '01710000013'},
    {'name': '14. Shila Khatun', 'bloodGroup': 'B-', 'location': 'Khulna', 'contact': '01710000014'},
    {'name': '15. Mamun Reza', 'bloodGroup': 'AB+', 'location': 'Rajshahi', 'contact': '01710000015'},
    {'name': '16. Rokeya Sultana', 'bloodGroup': 'AB-', 'location': 'Barishal', 'contact': '01710000016'},
    {'name': '17. Niloy Das', 'bloodGroup': 'O+', 'location': 'Dhaka', 'contact': '01710000017'},
    {'name': '18. Sabina Yasmin', 'bloodGroup': 'O-', 'location': 'Mymensingh', 'contact': '01710000018'},
    {'name': '19. Mehedi Hasan', 'bloodGroup': 'A+', 'location': 'Rangpur', 'contact': '01710000019'},
    {'name': '20. Rima Aktar', 'bloodGroup': 'A-', 'location': 'Sylhet', 'contact': '01710000020'},
  ];

  String selectedGroup = 'All';

  List<String> bloodGroups = ['All', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  @override
  Widget build(BuildContext context) {
    final filteredDonors = selectedGroup == 'All'
        ? donors
        : donors.where((d) => d['bloodGroup'] == selectedGroup).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blood Bank',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            shadows: [
              Shadow(
                blurRadius: 2,
                color: Colors.black26,
                offset: Offset(1, 1),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.green[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.green[50]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              DropdownButton<String>(
                value: selectedGroup,
                icon: Icon(Icons.arrow_drop_down),
                elevation: 4,
                underline: Container(height: 2, color: Colors.green),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGroup = newValue!;
                  });
                },
                items: bloodGroups.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredDonors.length,
                  itemBuilder: (context, index) {
                    final donor = filteredDonors[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      color: Colors.white,
                      shadowColor: Colors.green[200],
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.red[100],
                          child: Text(
                            donor['bloodGroup']!,
                            style: TextStyle(
                              color: Colors.red[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          donor['name']!,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          '${donor['location']}\nContact: ${donor['contact']}',
                          style: TextStyle(height: 1.4),
                        ),

                        isThreeLine: true,
                    ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
