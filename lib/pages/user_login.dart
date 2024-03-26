import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pharmacy_appnew/firebase_options.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _login(BuildContext context) async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    // Query for user in 'users' collection
    var userSnapshot = await _firestore
        .collection('users')
        .where('username', isEqualTo: username)
        .where('password', isEqualTo: password)
        .get();

    // Optionally, query for pharmacy user in 'pharmacy_users' collection
    // var pharmacyUserSnapshot = await _firestore
    //     .collection('pharmacy_users')
    //     .where('username', isEqualTo: username)
    //     .where('password', isEqualTo: password)
    //     .get();

    if (userSnapshot.docs.isNotEmpty /* || pharmacyUserSnapshot.docs.isNotEmpty */) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Handle login failure (e.g., show an error message)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
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
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xffefffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(27, 110, 28, 59),
                width: double.infinity,
                height: 307,
                child: Stack(
                  children: [
                    Positioned(
                      left: 100,
                      top: 258,
                      child: Align(
                        child: SizedBox(
                          width: 135,
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
                                  text: 'Login\n',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    height: 1.25,
                                    color: Color(0xff006a71),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign in to Continue!',
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      color: Color(0xffb4b4b8),
                    ),
                  ),
                ),
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  // Add other decoration properties as needed
                ),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  // Add other decoration properties as needed
                ),
              ),
              GestureDetector(
                onTap: () => _login(context),
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
