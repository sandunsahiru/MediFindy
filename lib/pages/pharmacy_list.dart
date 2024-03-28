import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacy_appnew/pages/about_pharmacy.dart';
import 'package:pharmacy_appnew/pages/home.dart';
import 'package:pharmacy_appnew/pages/account.dart';
import 'package:pharmacy_appnew/pages/settings.dart';

class PharmacyListPage extends StatefulWidget {
  const PharmacyListPage({Key? key}) : super(key: key);

  @override
  _PharmacyListPageState createState() => _PharmacyListPageState();
}

class _PharmacyListPageState extends State<PharmacyListPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot>> getPharmacies() async {
    var pharmacies = await _firestore.collection('pharmacies').get();
    return pharmacies.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Color(0xffefffff)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header
              Container(
                margin: EdgeInsets.only(top: 40, bottom: 31),
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xff000000)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text('<', style: TextStyle(color: Color(0xffffffff), fontSize: 20, fontWeight: FontWeight.w700)),
                    ),
                    Expanded(
                      child: Text(
                        'List of Pharmacies',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xffffffff), fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset('lib/images/logo.png', width: 130, height: 130),

              // Dynamic list of pharmacies
              FutureBuilder<List<QueryDocumentSnapshot>>(
                future: getPharmacies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("No pharmacies found"));
                  }
                  return Column(
                    children: snapshot.data!.map((pharmacy) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutPharmacy(pharmacyId: pharmacy['id'])),
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                          padding: EdgeInsets.all(12),
                          width: double.infinity,
                          decoration: BoxDecoration(color: Color(0xffdddddd), borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            pharmacy['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),

              // Navigation bar
              Positioned(
                bottom: 0,
                child: BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
                    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
                    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
                  ],
                  onTap: (index) {
                    // Handle navigation tap
                    switch (index) {
                      case 0:
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        break;
                      case 1:
                      // Navigate to search or current page refresh
                        break;
                      case 2:
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage()));
                        break;
                      case 3:
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                        break;
                    }
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
