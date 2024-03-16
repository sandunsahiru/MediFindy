import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/sign_in_sign_up_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

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
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1 * fem, 0 * fem),
              width: 335 * fem,
              height: 282 * fem,
              child: Image(
                image: AssetImage('lib/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 58 * fem),
              constraints: BoxConstraints(
                maxWidth: 254 * fem,
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Quando',
                    fontSize: 12 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.25 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                  children: [
                    TextSpan(
                      text: 'Welcome to Medi FIndy!\n',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                    TextSpan(
                      text: '\n',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 12 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                    TextSpan(
                      text:
                          'Your one-stop solution for finding medicines and pharmacies with ease. \nSearch, discover, and connect seamlessly. Get the medicines you need, when you need them.',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 13 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff095062),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to another page when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInSignUpPage()),
                );
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(
                    144 * fem, 0 * fem, 144 * fem, 28 * fem),
                width: double.infinity,
                height: 31 * fem,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff000000)),
                  color: Color(0xff7bd3ea),
                  borderRadius: BorderRadius.circular(5 * fem),
                ),
                child: Center(
                  child: Text(
                    'Log In',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.25 * ffem / fem,
                      color: Color(0xff0e185f),
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
                  MaterialPageRoute(builder: (context) => SignInSignUpPage()),
                );
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(
                    144 * fem, 0 * fem, 144 * fem, 144 * fem),
                width: double.infinity,
                height: 31 * fem,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff000000)),
                  color: Color(0xff7bd3ea),
                  borderRadius: BorderRadius.circular(5 * fem),
                ),
                child: Center(
                  child: Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.25 * ffem / fem,
                      color: Color(0xff0e185f),
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
