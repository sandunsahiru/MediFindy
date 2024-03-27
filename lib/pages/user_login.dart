import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pharmacy_appnew/firebase_options.dart';
import 'package:pharmacy_appnew/pages/widget/common_textfiled.dart';
import 'package:pharmacy_appnew/pages/widget/password_field.dart';
import 'package:pharmacy_appnew/pages/widget/primary_btn.dart';
import 'package:pharmacy_appnew/utils/custom_snack.dart';
import 'package:pharmacy_appnew/utils/loading_animation.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final _controller = UserLoginController();

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
                          // TextSpan(
                          //   text: ' Login',
                          //   style: TextStyle(
                          //     fontFamily: 'Quicksand',
                          //     fontSize: 15,
                          //     fontWeight: FontWeight.w700,
                          //     height: 1.25,
                          //     color: Color(0xff1c7947),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              CommonTextfield(
                  controller: _controller._usernameController,
                  hintText: "Username"),
              PasswordField(
                  passwordController: _controller._passwordController),
              PrimaryBtn(onPressed: () {
                _controller.login().then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }).catchError((error) {
                  CustomSnackbar.showWarning(context, error.toString());
                });
              })
            ],
          ),
        ),
      ),
    );
  }
}

class UserLoginController {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login() async {
    try {
      String username = _usernameController.text.trim();
      String password = _passwordController.text.trim();

      showLoadingAnimation();
      final DocumentSnapshot docSnapshot =
          await _firestore.collection('username_to_email').doc(username).get();

      if (docSnapshot.exists) {
        final String email =
            (docSnapshot.data() as Map<String, dynamic>)['email'];
        final UserCredential userCredential =
            await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        throw 'Invalid username';
      }
      closeLoadingAnimation();
    } catch (e) {
      closeLoadingAnimation();
      rethrow;
    }
  }

  void inputVerification(String username, String password) {
    if (username.isEmpty || password.isEmpty) {
      throw 'Please fill in all fields';
    }
  }
}
