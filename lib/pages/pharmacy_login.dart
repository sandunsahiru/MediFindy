import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/pharmacy/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pharmacy_appnew/pages/services/session_manager.dart';
import 'package:pharmacy_appnew/pages/widget/common_textfiled.dart';
import 'package:pharmacy_appnew/pages/widget/password_field.dart';
import 'package:pharmacy_appnew/pages/widget/primary_btn.dart';
import 'package:pharmacy_appnew/utils/custom_snack.dart';
import 'package:pharmacy_appnew/utils/loading_animation.dart';

class PharmacyLoginPage extends StatefulWidget {
  const PharmacyLoginPage({Key? key}) : super(key: key);

  @override
  _PharmacyLoginPageState createState() => _PharmacyLoginPageState();
}

class _PharmacyLoginPageState extends State<PharmacyLoginPage> {
  final PharmacyLoginController _controller = PharmacyLoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xffefffff),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Column(
                children: [
                  const SizedBox(
                    height: 220,
                    child: Image(
                      image: AssetImage('lib/images/logo.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 230,
                    height: 49,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          height: 1.25,
                          color: Color(0xff1c7947),
                        ),
                        children: [
                          TextSpan(
                            text: 'Login\n',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              height: 1.25,
                              color: Color(0xff006a71),
                            ),
                          ),
                          TextSpan(
                            text: 'Sign in to Continue',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              height: 1.25,
                              color: Color(0xff00bd56),
                            ),
                          ),
                        
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              CommonTextfield(
                controller: _controller._pharmacyIdController,
                hintText: "Pharmacy ID",
              ),
              // Password TextField
              PasswordField(
                  passwordController: _controller._passwordController),
              // Login Button
              PrimaryBtn(
                  text: "LOGIN",
                  onPressed: () {
                    _controller.login().then((pharmacyId) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    }).catchError((e) {
                      CustomSnackbar.showWarning(context, e.toString());
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class PharmacyLoginController {
  final TextEditingController _pharmacyIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> login() async {
    try {
      inputValidation();
      String pharmacyId = _pharmacyIdController.text.trim();
      String password = _passwordController.text.trim();
      showLoadingAnimation();
      final DocumentSnapshot docSnapshot = await _firestore
          .collection('pharmacyId_to_email')
          .doc(pharmacyId)
          .get();

      if (docSnapshot.exists) {
        final String email =
            (docSnapshot.data() as Map<String, dynamic>)['email'];
        final UserCredential userCredential =
            await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (userCredential.user != null) {
          SessionManager().setPharmacyId(pharmacyId);
        } else {
          throw 'Invalid credentials';
        }

        closeLoadingAnimation();
        return pharmacyId;
      } else {
        throw 'Invalid pharmacy ID';
      }
    } catch (e) {
      closeLoadingAnimation();
      rethrow;
    }
  }

  void inputValidation() {
    if (_pharmacyIdController.text.isEmpty) {
      throw 'Pharmacy ID cannot be empty';
    }
    if (_passwordController.text.isEmpty) {
      throw 'Password cannot be empty';
    }
  }
}
