import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/user_login.dart';

class UserSignUpPage extends StatelessWidget {
  const UserSignUpPage({Key? key});

  @override
  Widget build(BuildContext context) {
    double fem = 1.0; // Assuming fem is defined somewhere in your code
    double ffem = 1.0; // Assuming ffem is defined somewhere in your code

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 8 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffefffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 5 * fem, 0, 0),
                width: double.infinity,
                height: 47 * fem,
                decoration: BoxDecoration(
                  color: Color(0xccefffff),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          14.5 * fem, 17.5 * fem, 15.05 * fem, 17.5 * fem),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xccefffff),
                      ),
                    ),
                  ], // Close children of Row
                ), // Close Row
              ), // Close Container
              Container(
                margin: EdgeInsets.fromLTRB(27 * fem, 40, 28 * fem, 59 * fem),
                width: double.infinity,
                height: 301 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      left: 52.5 * fem,
                      top: 252 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 230 * fem,
                          height: 49 * fem,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 24 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.25 * ffem / fem,
                                color: Color(0xff1c7947),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Create New Account\n',
                                  style: TextStyle(
                                    fontSize: 24 * ffem,
                                    color: Color(0xff006a71),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Already Registered?',
                                  style: TextStyle(
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff00bd56),
                                  ),
                                ),
                                TextSpan(
                                  text: ' Login',
                                  style: TextStyle(
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w700,
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
                          width: 335 * fem,
                          height: 282 * fem,
                          child: Image(
                            image: AssetImage('lib/images/logo.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ], // Close children of Stack
                ), // Close Stack
              ), // Close Container
               Container(
                    margin: EdgeInsets.fromLTRB(74, 0, 74, 31),
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
                  Container(
                    margin: EdgeInsets.fromLTRB(74, 0, 74, 31),
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
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                          color: Color.fromARGB(255, 136, 136, 139),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(74, 0, 74, 36),
                    padding: EdgeInsets.fromLTRB(17, 5, 17, 5),
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xfff4f9f9),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                          color: Color(0xffb4b4b8),
                        ),
                      ),
                    ),
                  ),
              GestureDetector(
                 onTap: () {
                      // Navigate to another page when tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserLoginPage()),
                      );
                    },
                child: Container(
                  margin: EdgeInsets.fromLTRB(138 * fem, 20, 139 * fem, 100 * fem),
                  width: double.infinity,
                  height: 35 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xff006a71),
                    borderRadius: BorderRadius.circular(10 * fem),
                  ),
                  child: Center(
                    child: Text(
                      'SIGN UP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.25 * ffem / fem,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ], // Close children of Column
          ), // Close Column
        ),
      ), // Close Container
    ); // Close Scaffold
  }
}
