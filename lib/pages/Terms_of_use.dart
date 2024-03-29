import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/about.dart';
import 'package:pharmacy_appnew/pages/account.dart';
import 'package:pharmacy_appnew/pages/settings.dart';
import 'package:pharmacy_appnew/pages/home.dart';


class TermsOfUse extends StatelessWidget {
  const TermsOfUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem = 1;
    double ffem = 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms of Use',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // welcometomedifindythesetermsof (177:186)
              margin: EdgeInsets.fromLTRB(
                  20 * fem, 0 * fem, 10 * fem, 18 * fem),
              constraints: BoxConstraints(
                maxWidth: 360 * fem,
              ),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 10 * ffem,
                    fontWeight: FontWeight.w600,
                    height: 1.25 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                  children: [
                    TextSpan(
                      text:
                      'Welcome to Medi Findy! These Terms of Use ("Terms") govern your access to and use of the Medi Findy mobile application ("App") and the services provided through the App. By using the App, you agree to these Terms.\n\n',
                    ),
                    TextSpan(
                      text: 'Use of the App\n',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 10 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff4942e4),
                      ),
                    ),
                    TextSpan(
                      text:
                      'Eligibility You must be at least 18 years old to use the App.\nUser Account You may need an account for certain App features. Keep your account details confidential.\nUse Restrictions Do not use the App unlawfully, attempt unauthorized access, or disrupt its operation.\n',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 10 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                    TextSpan(
                      text: '\n',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 10 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff4942e4),
                      ),
                    ),
                    TextSpan(
                      text: 'Medical Information\n',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 10 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff4942e4),
                      ),
                    ),
                    TextSpan(
                      text:
                      'Disclaimer Information on the App is for information purposes only.\nConsultation Always consult a qualified health provider for medical advice.\n',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 10 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                    TextSpan(
                      text: '\n',
                    ),
                    TextSpan(
                      text: 'Intellectual Property\n',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 10 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff4942e4),
                      ),
                    ),
                    TextSpan(
                      text:
                      'Ownership The App and its content are owned by Medi Findy. Do not modify, reproduce, or distribute without permission.\nTrademarks All trademarks on the App belong to Medi Findy or third parties. Do not use without permission.\n',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 10 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                    TextSpan(
                      text: '\n',
                    ),
                    TextSpan(
                      text: 'Privacy\n',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 10 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff4942e4),
                      ),
                    ),
                    TextSpan(
                      text:
                      'Data Collection We collect and use personal information as described in our Privacy Policy.\nCookies By using the App, you agree to the use of cookies in accordance with our Cookie Policy.\n',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 10 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                    TextSpan(
                      text: '\n',
                    ),
                    TextSpan(
                      text: 'Termination\n',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 10 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff4942e4),
                      ),
                    ),
                    TextSpan(
                      text:
                      'Termination We may suspend or terminate your App access at any time, without notice, for any reason.\nEffect of Termination Your App usage rights cease immediately upon termination.\n',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 10 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                    TextSpan(
                      text: '\n',
                    ),
                    TextSpan(
                      text: 'Governing Law\n',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 10 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff4942e4),
                      ),
                    ),
                    TextSpan(
                      text:
                      'Jurisdiction These Terms are governed by [Jurisdiction]\'s laws, without considering conflicts of law principles.\nDisputes Any disputes arising from these Terms will be resolved in [Jurisdiction]\'s courts.\n',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 10 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                    TextSpan(
                      text: '\n',
                    ),
                    TextSpan(
                      text: 'Changes to Terms\n',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 10 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff4942e4),
                      ),
                    ),
                    TextSpan(
                      text:
                      'Changes We reserve the right to modify these Terms at any time, effective immediately upon posting.\nNotification Updated Terms will be posted on the App to notify you of any changes.\n',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 10 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                    TextSpan(
                      text:
                      '\nBy continuing to use the App after the changes are made, you agree to be bound by the revised Terms.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Implement action or navigate to search page
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => AccountPage()));
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
