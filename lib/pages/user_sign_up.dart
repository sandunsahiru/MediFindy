import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pharmacy_appnew/pages/user_login.dart';
import 'package:pharmacy_appnew/pages/widget/common_textfiled.dart';
import 'package:pharmacy_appnew/pages/widget/email_field.dart';
import 'package:pharmacy_appnew/pages/widget/password_field.dart';
import 'package:pharmacy_appnew/pages/widget/primary_btn.dart';
import 'package:pharmacy_appnew/utils/custom_snack.dart';
import 'package:pharmacy_appnew/utils/loading_animation.dart';

class UserSignUpPage extends StatefulWidget {
  const UserSignUpPage({Key? key}) : super(key: key);

  @override
  State<UserSignUpPage> createState() => _UserSignUpPageState();
}

class _UserSignUpPageState extends State<UserSignUpPage> {
  final UserSignupController _controller = UserSignupController();

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
              const SizedBox(height: 40),
              CommonTextfield(
                controller: _controller._usernameController,
                hintText: "Username",
              ),
              // Email TextField
              EmailField(emailController: _controller._emailController),
              // Password TextField
              PasswordField(
                  passwordController: _controller._passwordController),
              // SIGN UP Button
              PrimaryBtn(
                  text: "SIGN UP",
                  onPressed: () async {
                    _controller.signUp().then((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserLoginPage()),
                      );
                    }).catchError((e) {
                      CustomSnackbar.showWarning(context, e.toString());
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class UserSignupController {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp() async {
    final String username = _usernameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    validateInput(username, email, password);
    showLoadingAnimation();

    final DocumentSnapshot usernameSnapshot = await FirebaseFirestore.instance
        .collection('username_to_email')
        .doc(username)
        .get();

    if (usernameSnapshot.exists) {
      closeLoadingAnimation();
      throw 'Username already exists';
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('username_to_email')
            .doc(username)
            .set({
          'email': email,
        });
        String? token = await FirebaseMessaging.instance.getToken();
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'username': username,
          'email': email,
          'token': token,
        });
      } else {
        throw 'User was not created successfully. Please try again.';
      }
      closeLoadingAnimation();
    } catch (e) {
      throw 'Failed to sign up: ${e.toString()}';
    }
  }

  void validateInput(String username, String email, String password) {
    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      throw 'Please fill all fields';
    }
    if (email.contains('@') == false || email.contains('.') == false) {
      throw 'Please enter a valid email address';
    }
  }
}
