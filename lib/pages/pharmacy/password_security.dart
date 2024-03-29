import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacy_appnew/pages/services/session_manager.dart';
import 'package:pharmacy_appnew/pages/pharmacy/settings.dart';
import 'package:pharmacy_appnew/pages/pharmacy/account.dart';

class PasswordAndSecurity extends StatefulWidget {
  const PasswordAndSecurity({Key? key}) : super(key: key);

  @override
  _PasswordAndSecurityState createState() => _PasswordAndSecurityState();
}

class _PasswordAndSecurityState extends State<PasswordAndSecurity> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _retypeNewPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isProcessing = false;

  Future<void> _changePassword() async {
    if (_isProcessing) return;

    setState(() {
      _isProcessing = true;
    });

    String currentPassword = _currentPasswordController.text.trim();
    String newPassword = _newPasswordController.text.trim();
    String retypeNewPassword = _retypeNewPasswordController.text.trim();

    if (newPassword != retypeNewPassword) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("New passwords do not match")));
      setState(() {
        _isProcessing = false;
      });
      return;
    }

    final String? pharmacyId = SessionManager().pharmacyId;
    if (pharmacyId == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Pharmacy ID not found")));
      setState(() {
        _isProcessing = false;
      });
      return;
    }

    // Retrieve the email associated with the pharmacyId
    DocumentSnapshot pharmacySnapshot = await FirebaseFirestore.instance
        .collection('pharmacy_admins')
        .where('pharmacyID', isEqualTo: pharmacyId)
        .limit(1)
        .get()
        .then((snapshot) => snapshot.docs.first);

    String email = pharmacySnapshot['email']; // Assuming 'email' is the field in the document

    User? user = _auth.currentUser;
    if (user == null || user.email != email) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Authenticated user mismatch")));
      setState(() {
        _isProcessing = false;
      });
      return;
    }

    try {
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: currentPassword);
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password successfully updated")));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An error occurred: ${e.message}")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An error occurred: ${e.toString()}")));
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery used to get the screen size for responsive UI
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Password & Security'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              _buildPasswordField(_currentPasswordController, 'Current Password'),
              SizedBox(height: 10),
              _buildPasswordField(_newPasswordController, 'New Password'),
              SizedBox(height: 10),
              _buildPasswordField(_retypeNewPasswordController, 'Re-type New Password'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _changePassword,
                child: Text('Change Password'),
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
              onPressed: () {},
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

  Widget _buildPasswordField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      obscureText: true,
    );
  }

}
