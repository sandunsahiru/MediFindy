import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PharmacyLoginPage extends StatefulWidget {
  const PharmacyLoginPage({Key? key}) : super(key: key);

  @override
  _PharmacyLoginPageState createState() => _PharmacyLoginPageState();
}

class _PharmacyLoginPageState extends State<PharmacyLoginPage> {
  final TextEditingController _pharmacyIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    try {
      // Attempt to sign in with email and password.
      // Assuming pharmacy ID is used as email
      final UserCredential userCredential =
      await _auth.signInWithEmailAndPassword(
        email: _pharmacyIdController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (userCredential.user != null) {
        // Successful authentication redirects to the HomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } catch (e) {
      // If login fails, display an error message.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Failed to login. Please check your credentials.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffefffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Your existing UI widgets...
              Container(
                margin: EdgeInsets.fromLTRB(74, 0, 74, 33),
                padding: EdgeInsets.fromLTRB(17, 5, 17, 5),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xfff4f9f9),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TextField(
                  controller: _pharmacyIdController, // Bind controller
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Pharmacy ID', // Placeholder for Pharmacy ID
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      color: Color(0xffb4b4b8),
                    ),
                  ),
                ),
              ),
              // Password TextField
              Container(
                margin: EdgeInsets.fromLTRB(74, 0, 74, 51),
                padding: EdgeInsets.fromLTRB(17, 5, 17, 5),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xfff4f9f9),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TextField(
                  controller: _passwordController, // Bind controller
                  obscureText: true, // Hide password
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password', // Placeholder for Password
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      color: Color(0xffb4b4b8),
                    ),
                  ),
                ),
              ),
              // Login Button
              GestureDetector(
                onTap: _login, // Bind onTap event to _login function
                child: Container(
                  margin: EdgeInsets.fromLTRB(138, 30, 139, 100),
                  width: double.infinity,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Color(0xff006a71),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'LOGIN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
