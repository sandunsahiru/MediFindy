import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacy_appnew/pages/about_pharmacy.dart';

class PharmacyListPage extends StatefulWidget {
  @override
  _PharmacyListPageState createState() => _PharmacyListPageState();
}

class _PharmacyListPageState extends State<PharmacyListPage> {
  String? selectedCity;
  List<String> cities = [
    'Colombo', 'Kandy', 'Galle', 'Matara', 'Jaffna',
    'Anuradhapura', 'Ratnapura', 'Badulla', 'Trincomalee', 'Kurunegala',
  ];
  List<Map<String, dynamic>> pharmacies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pharmacies Nearby'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Your City',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedCity,
              isExpanded: true,
              items: cities.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCity = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchPharmacies, // Fetch pharmacies when the button is pressed
              child: Text('Search'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: pharmacies.length,
                itemBuilder: (context, index) {
                  final pharmacy = pharmacies[index];
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(pharmacy['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Location: ${pharmacy['location']}'),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AboutPharmacy(pharmacyId: pharmacy['id']),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void fetchPharmacies() async {
    if (selectedCity == null || selectedCity!.isEmpty) return;

    try {
      // Search for all pharmacies in the 'pharmacy_admins' collection that are in the selected city
      var querySnapshot = await FirebaseFirestore.instance
          .collection('pharmacy_admins')
          .where('city', isEqualTo: selectedCity)
          .get();

      List<Map<String, dynamic>> loadedPharmacies = querySnapshot.docs.map((doc) {
        return {
          'name': doc.data()['pharmacyName'] as String,
          'location': '${doc.data()['addressLine1']}, ${doc.data()['addressLine2']}',
          'id': doc.data()['pharmacyID'] as String,
        };
      }).toList();

      setState(() {
        pharmacies = loadedPharmacies;
      });
    } catch (e) {
      print('Error fetching pharmacies: $e');
    }
  }
}
