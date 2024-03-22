import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/pharmacy_login.dart';
import 'package:pharmacy_appnew/pages/pharmacy_sign_up.dart';
import 'package:pharmacy_appnew/pages/user_login.dart';
import 'package:pharmacy_appnew/pages/user_sign_up.dart';

class SignInSignUpPage extends StatelessWidget {
  const SignInSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 40),
        width: width,
        decoration: BoxDecoration(
          color: Color(0xffefffff),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, 4),
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.05),
            Container(
              margin: EdgeInsets.only(right: 1),
              width: width * 0.8,
              height: height * 0.3,
              child: Image(
                image: AssetImage('lib/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Sign In as a,',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xff0c359e),
              ),
            ),
            _buildActionContainer(context, 'Pharmacy Admin', PharmacyLoginPage(), width, height * 0.04),
            _buildActionContainer(context, 'User', UserLoginPage(), width, height * 0.04),
            Text(
              'Sign Up as a,',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xff0c359e),
              ),
            ),
            _buildActionContainer(context, 'Pharmacy Admin', PharmacySignUp(), width, height * 0.04),
            _buildActionContainer(context, 'User', UserSignUpPage(), width, height * 0.04),
          ],
        ),
      ),
    );
  }

  Widget _buildActionContainer(BuildContext context, String text, Widget page, double width, double containerHeight) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.25, vertical: 10),
        width: double.infinity,
        height: containerHeight,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff000000)),
          color: Color(0xff98ded9),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xff000000),
            ),
          ),
        ),
      ),
    );
  }
}
