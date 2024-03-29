import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacy_appnew/pages/services/session_manager.dart';
import 'package:pharmacy_appnew/pages/pharmacy/home.dart';
import 'package:pharmacy_appnew/pages/pharmacy/settings.dart';

class PharmacyAccountPage extends StatefulWidget {
  const PharmacyAccountPage({Key? key}) : super(key: key);

  @override
  _PharmacyAccountPageState createState() => _PharmacyAccountPageState();
}

class _PharmacyAccountPageState extends State<PharmacyAccountPage> {
  final TextEditingController _pharmacyNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final String? pharmacyId = SessionManager().pharmacyId;

  @override
  void initState() {
    super.initState();
    if (pharmacyId != null) {
      _fetchPharmacyDetails();
    }
  }

  Future<void> _fetchPharmacyDetails() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('pharmacy_admins')
          .where('pharmacyID', isEqualTo: pharmacyId)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot pharmacySnapshot = querySnapshot.docs.first;
        _pharmacyNameController.text = pharmacySnapshot.get('pharmacyName') ?? '';
        _emailController.text = pharmacySnapshot.get('email') ?? '';
        _addressLine1Controller.text = pharmacySnapshot.get('addressLine1') ?? '';
        _addressLine2Controller.text = pharmacySnapshot.get('addressLine2') ?? '';
        _cityController.text = pharmacySnapshot.get('city') ?? '';
        _districtController.text = pharmacySnapshot.get('district') ?? '';
      }
    } catch (error) {
      print('Error fetching pharmacy details: $error');
    }
  }

  Future<void> _updatePharmacyDetails(BuildContext context) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('pharmacy_admins')
        .where('pharmacyID', isEqualTo: pharmacyId)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot pharmacySnapshot = querySnapshot.docs.first;
      DocumentReference pharmacyRef = pharmacySnapshot.reference;

      return pharmacyRef.update({
        'pharmacyName': _pharmacyNameController.text,
        'email': _emailController.text,
        'addressLine1': _addressLine1Controller.text,
        'addressLine2': _addressLine2Controller.text,
        'city': _cityController.text,
        'district': _districtController.text,
      }).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pharmacy details updated successfully')),
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update pharmacy details')),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()), // Replace HomePage() with your actual home page widget
                (Route<dynamic> route) => false,
          ),

        ),
        title: Text(
          'Pharmacy Account',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            children: [
              CircleAvatar(
                radius: screenWidth * 0.15,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('lib/images/logo.png'),
              ),
              SizedBox(height: screenHeight * 0.03),
              _buildTextField(_pharmacyNameController, 'Pharmacy Name', screenWidth),
              SizedBox(height: screenHeight * 0.02),
              _buildTextField(_emailController, 'Email', screenWidth),
              SizedBox(height: screenHeight * 0.03),
              _buildTextField(_addressLine1Controller, 'Address Line 1', screenWidth),
              SizedBox(height: screenHeight * 0.03),
              _buildTextField(_addressLine2Controller, 'Address Line 2', screenWidth),
              SizedBox(height: screenHeight * 0.03),
              _buildTextField(_cityController, 'City', screenWidth),
              SizedBox(height: screenHeight * 0.03),
              _buildTextField(_districtController, 'District', screenWidth),
              SizedBox(height: screenHeight * 0.03),
              ElevatedButton(
                onPressed: () => _updatePharmacyDetails(context),
                child: Text('Save'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Color(0xffffdbaa),
                  minimumSize: Size(screenWidth * 0.5, 50),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomePage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => PharmacyAccountPage()));
              },
            ),

            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => SettingsPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, double screenWidth) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
