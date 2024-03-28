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
    // Log the query and city for debugging
    print('Searching for medicine: ${widget.query} in city: ${widget.city}');

    // Get the pharmacy IDs from the city
    final pharmacyIdsResult = await FirebaseFirestore.instance
        .collection('pharmacy_admins')
        .where('city', isEqualTo: widget.city)
        .get();

    final List<String> pharmacyIds = pharmacyIdsResult.docs
        .map((doc) => doc.data()['pharmacyID'] as String)
        .toList();

    // Log the pharmacy IDs found
    print('Pharmacy IDs found: $pharmacyIds');

    // Now get the pharmacies which have the medicine
    final medicinesResult = await FirebaseFirestore.instance
        .collection('medicines')
        .where('medicine', arrayContains: widget.query.toLowerCase())
        .where('pharmacyID', whereIn: pharmacyIds)
        .get();

    // Log the number of medicine documents found
    print('Medicine documents found: ${medicinesResult.docs.length}');

    List<Map<String, dynamic>> loadedPharmacies = [];
    for (var medicineDoc in medicinesResult.docs) {
      final pharmacyData = await FirebaseFirestore.instance
          .collection('pharmacy_admins')
          .doc(medicineDoc['pharmacyID'])
          .get();

      if (pharmacyData.exists) {
        loadedPharmacies.add({
          "name": pharmacyData['pharmacyName'],
          "location": pharmacyData['addressLine1'] + ', ' + pharmacyData['addressLine2'],
          "id": medicineDoc['pharmacyID'],
          "medicines": medicineDoc['medicine'],
        });
        // Log each pharmacy found with the medicine
        print('Pharmacy found: ${pharmacyData['pharmacyName']} with medicine: ${widget.query}');
      }
    }

    if (loadedPharmacies.isEmpty) {
      // If no pharmacies are loaded, log a message
      print('No pharmacies found carrying medicine: ${widget.query}');
    }

    setState(() {
      pharmacies = loadedPharmacies;
    });
    for (var medicineDoc in medicinesResult.docs) {
      final pharmacyDocRef = FirebaseFirestore.instance
          .collection('pharmacy_admins')
          .doc(medicineDoc['pharmacyID']);
      final pharmacyData = await pharmacyDocRef.get();

      if (pharmacyData.exists) {
        print('Pharmacy data: ${pharmacyData.data()}'); // Add this line to print the pharmacy data
        loadedPharmacies.add({
          "name": pharmacyData.data()?['pharmacyName'] ?? 'Unknown Pharmacy',
          "location": (pharmacyData.data()?['addressLine1'] ?? '') + ', ' + (pharmacyData.data()?['addressLine2'] ?? ''),
          "id": medicineDoc['pharmacyID'],
          "medicines": medicineDoc['medicine'],
        });
        print('Pharmacy found: ${pharmacyData.data()?['pharmacyName']} with medicine: ${widget.query}');
      } else {
        // Log if the pharmacy data does not exist or is not found
        print('Pharmacy data with ID ${medicineDoc['pharmacyID']} does not exist.');
      }
    }
  }




  // void searchMedicine() async {
  //   // Fetch pharmacy IDs based on the city from the 'pharmacy_admins' collection
  //   final pharmacyAdminsResult = await FirebaseFirestore.instance
  //       .collection('pharmacy_admins')
  //       .where('city', isEqualTo: widget.city)
  //       .get();
  //
  //   // Extract pharmacy IDs from the query result
  //   final List<String> pharmacyIds = pharmacyAdminsResult.docs
  //       .map((doc) => doc.data()['pharmacyID'] as String)
  //       .toList();
  //
  //   // Check if pharmacy IDs were found
  //   if (pharmacyIds.isEmpty) {
  //     print('No pharmacies found for the city ${widget.city}');
  //     return;
  //   }
  //
  //   // Fetch medicines data from the 'medicines' collection where the medicine array contains the search query
  //   final medicinesResult = await FirebaseFirestore.instance
  //       .collection('medicines')
  //       .where('medicine', arrayContains: widget.query.toLowerCase())
  //       .where('pharmacyID', whereIn: pharmacyIds)
  //       .get();
  //
  //   // Construct a list of pharmacies with their details and the medicines they carry
  //   List<Map<String, dynamic>> loadedPharmacies = [];
  //   for (var medicineDoc in medicinesResult.docs) {
  //     var docData = medicineDoc.data() as Map<String, dynamic>;
  //     // Fetch the detailed data of the pharmacy using the pharmacyID obtained from medicines
  //     final pharmacyDetailResult = await FirebaseFirestore.instance
  //         .collection('pharmacy_admins')
  //         .doc(docData['pharmacyID'])
  //         .get();
  //
  //     if (pharmacyDetailResult.exists) {
  //       var pharmacyData = pharmacyDetailResult.data() as Map<String, dynamic>;
  //       loadedPharmacies.add({
  //         "name": pharmacyData['pharmacyName'],
  //         "location": "${pharmacyData['addressLine1']}, ${pharmacyData['addressLine2']}",
  //         "id": medicineDoc['pharmacyID'],
  //         "medicines": docData['medicine'], // Assuming 'medicine' is an array of strings
  //       });
  //     }
  //   }
  //
  //   // Update the state to display the pharmacies
  //   setState(() {
  //     pharmacies = loadedPharmacies;
  //   });
  //
  //   // If no pharmacies were loaded, it might be a good idea to handle this case (e.g., display a message)
  //   if (loadedPharmacies.isEmpty) {
  //     print('No pharmacies found carrying medicine: ${widget.query}');
  //   }
  // }




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
