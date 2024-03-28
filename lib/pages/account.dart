import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:pharmacy_appnew/pages/services/session_manager.dart';
import 'package:pharmacy_appnew/pages/settings.dart';
// Make sure SessionManager is implemented and contains a getter for userId.

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  late String? _userId; // Declare _userId variable

  @override
  void initState() {
    super.initState();
    _userId = SessionManager().userId; // Get _userId from SessionManager
    _fetchUserDetails(); // Fetch user details when the widget initializes
  }

  // Function to fetch user details from Firestore
  Future<void> _fetchUserDetails() async {
    if (_userId != null) {
      try {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('users').doc(_userId).get();
        _nameController.text = userSnapshot.get('username') ?? '';
        _emailController.text = userSnapshot.get('email') ?? '';
      } catch (error) {
        print('Error fetching user details: $error');
        // Handle error appropriately, e.g., show error message
      }
    }
  }

  // Function for updating user details in the database
  Future<void> _updateUserDetails(BuildContext context) async {
    DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(_userId);
    return userRef
        .update({
      'username': _nameController.text,
      'email': _emailController.text,
    })
        .then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User details updated successfully')),
      );
    })
        .catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update user details')),
      );
    });
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
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Account',
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
              _buildTextField(_nameController, 'User Name', screenWidth),
              SizedBox(height: screenHeight * 0.02),
              _buildTextField(_emailController, 'Your Email', screenWidth),
              SizedBox(height: screenHeight * 0.03),
              ElevatedButton(
                onPressed: () => _updateUserDetails(context),
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
