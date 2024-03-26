import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/pharmacy_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PharmacySignUp extends StatefulWidget {
  const PharmacySignUp({Key? key}) : super(key: key);

  @override
  _PharmacySignUpState createState() => _PharmacySignUpState();
}

class _PharmacySignUpState extends State<PharmacySignUp> {
  final TextEditingController _pharmacyIdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _signUp() async {
    try {

      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      await _firestore.collection('pharmacies').doc(userCredential.user!.uid).set({
        'pharmacyID': _pharmacyIdController.text.trim(),

      });


      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PharmacyLoginPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign up. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffefffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(27, 110, 28, 59),
                width: double.infinity,
                height: 301,
                child: Stack(
                  children: [
                    Positioned(
                      left: 52.5,
                      top: 252,
                      child: Align(
                        child: SizedBox(
                          width: 230,
                          height: 49,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                height: 1.25,
                                color: Color(0xff1c7947),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Create New Account\n',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    height: 1.25,
                                    color: Color(0xff006a71),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Already Registered?',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    height: 1.25,
                                    color: Color(0xff00bd56),
                                  ),
                                ),
                                TextSpan(
                                  text: ' Login',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    height: 1.25,
                                    color: Color(0xff1c7947),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Align(
                        child: SizedBox(
                          width: 335,
                          height: 282,
                          child: Image(
                            image: AssetImage('lib/images/logo.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Pharmacy ID TextField
              Container(
                margin: EdgeInsets.fromLTRB(74, 0, 74, 31),
                padding: EdgeInsets.fromLTRB(17, 5, 17, 5),
                child: TextField(
                  controller: _pharmacyIdController,
                  decoration: InputDecoration(
                    hintText: 'Pharmacy ID',
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(74, 0, 74, 31),
                padding: EdgeInsets.fromLTRB(17, 5, 17, 5),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',

                  ),
                ),
              ),

              // Password TextField
              Container(
                margin: EdgeInsets.fromLTRB(74, 0, 74, 36),
                padding: EdgeInsets.fromLTRB(17, 5, 17, 5),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',

                  ),
                ),
              ),

              GestureDetector(
                onTap: _signUp,
                child: Container(
                  margin: EdgeInsets.fromLTRB(138, 20, 139, 100),
                  // Button styling
                  child: Center(
                    child: Text('SIGN UP'),
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
