import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pharmacy_appnew/pages/home.dart';
import 'package:pharmacy_appnew/pages/about_pharmacy.dart';
import 'package:pharmacy_appnew/pages/account.dart';
import 'package:pharmacy_appnew/pages/settings.dart';

class SearchMedicines extends StatefulWidget {
  const SearchMedicines({Key? key}) : super(key: key);

  @override
  _SearchMedicinesState createState() => _SearchMedicinesState();
}

class _SearchMedicinesState extends State<SearchMedicines> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> pharmacies = [];

  @override
  void initState() {
    super.initState();

  }

  void searchMedicine() async {
    String searchQuery = _searchController.text.trim().toLowerCase();
    final result = await FirebaseFirestore.instance
        .collection('pharmacies')
        .where('medicines', arrayContains: searchQuery)
        .get();

    List<Map<String, dynamic>> loadedPharmacies = result.docs
        .map((doc) => {
      "name": doc['name'],
      "location": doc['location'],
      "id": doc.id
    })
        .toList();

    setState(() {
      pharmacies = loadedPharmacies;
    });
  }

  void launchMaps(String location) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$location';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color(0xffefffff),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
                padding: EdgeInsets.fromLTRB(34, 4, 94, 4),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff000000),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '<',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Search Matches',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                width: 160,
                height: 160,
                child: Image.asset('lib/images/logo.png', fit: BoxFit.cover),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 15),
                child: Text(
                  'Can\'t Find Your Medicine? Search Here!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff0d9276),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search for Medicines',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: searchMedicine,
                    ),
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
                      subtitle: Text('ID: ${pharmacy['id']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.map),
                        onPressed: () => launchMaps(pharmacy['location']),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutPharmacy()),
                        );
                      },
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
