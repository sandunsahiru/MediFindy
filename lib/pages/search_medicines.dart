import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacy_appnew/pages/about_pharmacy.dart';

class SearchMedicines extends StatefulWidget {
  final String city;
  final String query;
  final String userId;

  const SearchMedicines({
    Key? key,
    required this.city,
    required this.query,
    required this.userId,
  }) : super(key: key);

  @override
  _SearchMedicinesState createState() => _SearchMedicinesState();
}

class _SearchMedicinesState extends State<SearchMedicines> {
  List<Map<String, dynamic>> pharmacies = [];

  @override
  void initState() {
    super.initState();
    searchMedicine();
  }

  void searchMedicine() async {
    // Step 1: Search for the medicine across all pharmacies
    final medicinesSnapshot = await FirebaseFirestore.instance
        .collection('medicines')
        .where('medicine', arrayContains: widget.query.toLowerCase())
        .get();

    // This will hold the final list of pharmacies that have the medicine and are in the correct city
    List<Map<String, dynamic>> matchingPharmacies = [];

    // Step 2: For each medicine, check if the pharmacy's city matches the user's selected city
    for (var medicineDoc in medicinesSnapshot.docs) {
      final pharmacyId = medicineDoc['pharmacyID'];

      final pharmacySnapshot = await FirebaseFirestore.instance
          .collection('pharmacy_admins')
          .doc(pharmacyId)
          .get();

      if (pharmacySnapshot.exists) {
        final pharmacyData = pharmacySnapshot.data()!;
        final pharmacyCity = pharmacyData['city'];

        // If the pharmacy's city matches the user's selected city, add it to the list
        if (pharmacyCity == widget.city) {
          matchingPharmacies.add({
            "name": pharmacyData['name'], // Assuming the name is part of the data
            "location": pharmacyData['location'], // And also location
            "id": pharmacyId,
          });
        }
      }
    }

    // Step 3: Update the state with the matching pharmacies
    setState(() {
      pharmacies = matchingPharmacies;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          AppBar(
            title: Text('Search Matches'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Search Results for "${widget.query}" in ${widget.city}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pharmacies.length,
              itemBuilder: (context, index) {
                final pharmacy = pharmacies[index];
                return ListTile(
                  title: Text(pharmacy['name']),
                  subtitle: Text('Location: ${pharmacy['location']}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutPharmacy(pharmacyId: pharmacy['id']),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
