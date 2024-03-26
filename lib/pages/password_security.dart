import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacy_appnew/pages/account.dart';
import 'package:pharmacy_appnew/pages/home.dart';
import 'package:pharmacy_appnew/pages/settings.dart';

class PasswordAndSecurity extends StatefulWidget {
  const PasswordAndSecurity({Key? key}) : super(key: key);

  @override
  _PasswordAndSecurityState createState() => _PasswordAndSecurityState();
}

class _PasswordAndSecurityState extends State<PasswordAndSecurity> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _retypeNewPasswordController = TextEditingController();

  Future<void> _changePassword() async {
    String currentPassword = _currentPasswordController.text.trim();
    String newPassword = _newPasswordController.text.trim();
    String retypeNewPassword = _retypeNewPasswordController.text.trim();

    if (newPassword != retypeNewPassword) {

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("New passwords do not match")));
      return;
    }


    User? user = FirebaseAuth.instance.currentUser;
    String email = user!.email!;


    try {
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: currentPassword);
      await user.reauthenticateWithCredential(credential);


      await user.updatePassword(newPassword);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password successfully updated")));



    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An error occurred: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Color(0xffefffff)),
          child: Column(children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 55, 0, 31),
              padding: EdgeInsets.fromLTRB(34, 4, 94, 4),
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
                      'Password & Security',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xffffffff), fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 6, 0),
              width: 150,
              height: 150,
              child: Image.asset('lib/images/logo.png', fit: BoxFit.cover),
            ),
            SizedBox(height: 35),


            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: _currentPasswordController,
                    decoration: InputDecoration(labelText: 'Current Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _newPasswordController,
                    decoration: InputDecoration(labelText: 'New Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _retypeNewPasswordController,
                    decoration: InputDecoration(labelText: 'Re-type New Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _changePassword,
                    child: Text('Change Password'),
                  ),
                ],
              ),
            ),

            // Navigation bar
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage())),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Implement action or navigate to search page
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.account_circle),
                    onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => AccountPage())),
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => SettingsPage())),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
