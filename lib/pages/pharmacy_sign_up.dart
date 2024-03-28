import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pharmacy_appnew/pages/pharmacy_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacy_appnew/pages/widget/common_textfiled.dart';
import 'package:pharmacy_appnew/pages/widget/email_field.dart';
import 'package:pharmacy_appnew/pages/widget/password_field.dart';
import 'package:pharmacy_appnew/pages/widget/primary_btn.dart';
import 'package:pharmacy_appnew/utils/constant.dart';
import 'package:pharmacy_appnew/utils/custom_snack.dart';
import 'package:pharmacy_appnew/utils/loading_animation.dart';

class PharmacySignUp extends StatefulWidget {
  const PharmacySignUp({Key? key}) : super(key: key);

  @override
  _PharmacySignUpState createState() => _PharmacySignUpState();
}

class _PharmacySignUpState extends State<PharmacySignUp> {
  final PharmacySignUpController _controller = PharmacySignUpController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xffefffff),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Column(
                children: [
                  Container(
                    height: 220,
                    child: const Image(
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
                ],
              ),
              const SizedBox(height: 50),
              CommonTextfield(
                controller: _controller._pharmacyIdController,
                hintText: 'Pharmacy ID',
              ),
              EmailField(emailController: _controller._emailController),
              CommonTextfield(
                  controller: _controller._pharmacyNameController,
                  hintText: "Pharmacy Name"),
              CommonTextfield(
                  controller: _controller._addressLine1Controller,
                  hintText: "Address line 1"),
              CommonTextfield(
                  controller: _controller._addressLine2Controller,
                  hintText: "Address line 2"),
              CommonTextfield(
                controller: _controller._cityController,
                hintText: "City",
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 74, vertical: 15),
                padding: const EdgeInsets.symmetric(horizontal: 17),
                decoration: BoxDecoration(
                  color: const Color(0xfff4f9f9),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _controller._selectedValue,
                    hint: const Text(
                      'Your district',
                      style: TextStyle(
                        color: Color(0xffb4b4b8),
                      ),
                    ),
                    items: districtsInSriLanka
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _controller._selectedValue = newValue;
                      });
                    },
                  ),
                ),
              ),
              PasswordField(
                passwordController: _controller._passwordController,
              ),
              PrimaryBtn(
                text: 'SIGN UP',
                onPressed: () {
                  _controller.signUp().then((_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PharmacyLoginPage()),
                    );
                  }).catchError((e) {
                    CustomSnackbar.showWarning(context, e.toString());
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PharmacySignUpController {
  String? _selectedValue;
  final TextEditingController _pharmacyIdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _pharmacyNameController = TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signUp() async {
    try {
      showLoadingAnimation();
      inputValidation();

      final String pharmacyId = _pharmacyIdController.text.trim();
      final String email = _emailController.text.trim();
      final String pharmacyName = _pharmacyNameController.text.trim();
      final String addressLine1 = _addressLine1Controller.text.trim();
      final String addressLine2 = _addressLine2Controller.text.trim();
      final String city = _cityController.text.trim();

      final DocumentSnapshot pharmacyIdSnapshot = await _firestore
          .collection('pharmacyId_to_email')
          .doc(pharmacyId)
          .get();

      if (pharmacyIdSnapshot.exists) {
        closeLoadingAnimation();
        throw 'Pharmacy ID already exists';
      }

      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: _passwordController.text.trim(),
      );

      await _firestore.collection('pharmacyId_to_email').doc(pharmacyId).set({
        'email': email,
      });

      String? token = await FirebaseMessaging.instance.getToken();

      await _firestore
          .collection('pharmacy_admins')
          .doc(userCredential.user!.uid)
          .set({
        'pharmacyID': pharmacyId,
        'email': email,
        'district': _selectedValue,
        'pharmacyName': pharmacyName,
        'addressLine1': addressLine1,
        'addressLine2': addressLine2,
        'city': city,
        'token': token,
      });
      closeLoadingAnimation();
    } catch (e) {
      closeLoadingAnimation();
      rethrow;
    }
  }

  void inputValidation() {
    if (_pharmacyIdController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _selectedValue == null) {
      throw 'Please fill in all fields.';
    } else {
      _emailController.text.contains('@') && _emailController.text.contains('.')
          ? null
          : throw 'Please enter a valid email address.';
    }
  }
}
