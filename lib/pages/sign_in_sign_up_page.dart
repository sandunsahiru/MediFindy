import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/pharmacy_login.dart';
import 'package:pharmacy_appnew/pages/pharmacy_sign_up.dart';
import 'package:pharmacy_appnew/pages/user_login.dart';
import 'package:pharmacy_appnew/pages/user_sign_up.dart';

class SignInSignUpPage extends StatelessWidget {
  const SignInSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem = 1.0; // Assuming fem is defined somewhere in your code
    double ffem = 1.0; // Assuming ffem is defined somewhere in your code

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 40 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffefffff),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0 * fem, 4 * fem),
              blurRadius: 2 * fem,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 45 * fem),
            Container(
              margin: EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 0 * fem),
              width: 335 * fem,
              height: 250 * fem,
              child: Image(
                image: AssetImage('lib/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 16 * fem),
              child: Text(
                'Sign In as a,',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 24 * ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.25 * ffem / fem,
                  color: Color(0xff0c359e),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to another page when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PharmacyLoginPage()),
                );
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(
                    109 * fem, 0 * fem, 109 * fem, 22 * fem),
                width: double.infinity,
                height: 31 * fem,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff000000)),
                  color: Color(0xff98ded9),
                  borderRadius: BorderRadius.circular(5 * fem),
                ),
                child: Center(
                  child: Text(
                    'Pharmacy Admin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.25 * ffem / fem,
                      color: Color(0xff000000),
                    ),
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
                margin: EdgeInsets.fromLTRB(
                    109 * fem, 0 * fem, 109 * fem, 52 * fem),
                width: double.infinity,
                height: 31 * fem,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff000000)),
                  color: Color(0xff98ded9),
                  borderRadius: BorderRadius.circular(5 * fem),
                ),
                child: Center(
                  child: Text(
                    'User',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.25 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 16 * fem),
              child: Text(
                'Sign Up as a,',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 24 * ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.25 * ffem / fem,
                  color: Color(0xff0c359e),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to another page when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PharmacySignUp()),
                );
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(
                    109 * fem, 0 * fem, 109 * fem, 27 * fem),
                width: double.infinity,
                height: 31 * fem,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff000000)),
                  color: Color(0xff98ded9),
                  borderRadius: BorderRadius.circular(5 * fem),
                ),
                child: Center(
                  child: Text(
                    'Pharmacy Admin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.25 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to another page when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserSignUpPage()),
                );
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(
                    109 * fem, 0 * fem, 109 * fem, 122 * fem),
                width: double.infinity,
                height: 31 * fem,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff000000)),
                  color: Color(0xff98ded9),
                  borderRadius: BorderRadius.circular(5 * fem),
                ),
                child: Center(
                  child: Text(
                    'User',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.25 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
