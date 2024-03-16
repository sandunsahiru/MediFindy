import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/about.dart';
import 'package:pharmacy_appnew/pages/settings.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem = 1; // Assuming you have defined fem somewhere
    double ffem = 1; // Assuming you have defined ffem somewhere

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 805,
          decoration: BoxDecoration(
            color: Color(0xffefffff),
          ),
          child: Column(children: [
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 50 * fem, 0 * fem, 31 * fem),
              padding:
                  EdgeInsets.fromLTRB(34 * fem, 4 * fem, 20 * fem, 4 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff000000),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                          // Navigate to another page when tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutPage()),
                          );
                        },
                    child: Container(
                      // 21M (36:582)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 80 * fem, 0 * fem),
                      child: Text(
                        '<',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.25 * ffem / fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),

                  Text(
                    // specialrequestsHKM (36:581)
                    'Terms of Use',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.25 * ffem / fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                  SizedBox(
                      width: 60 *
                          fem), // Adding a gap of 10 * fem between the icon and the text

                  Positioned(
                    // screenshot284removebgpreview1q (177:131)

                    left: 0 * fem,
                    top: 0 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 45 * fem,
                        height: 40 * fem,
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
            Expanded(
              child: ListView(
                physics:
                    BouncingScrollPhysics(), // Enable scrolling for the text section
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
            Container(
              // autogroupcsidAFy (GpWypZPNC8wdGxhcobCsiD)
              width: double.infinity,
              height: 130 * fem,
              child: Stack(
                children: [
                  Positioned(
                    // rectangle97S7 (38:663)
                    left: 0 * fem,
                    top: 80 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 390 * fem,
                        height: 55 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffbbe2ec),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // homeiconsilhouettefreeiconsdes (38:664)
                    left: 40 * fem,
                    top: 88 * fem,
                    child: Align(
                      child: GestureDetector(
                        onTap: () {
                          print(" icon tapped");
                          // Perform your action when the user icon is tapped
                        },
                        child: SizedBox(
                          width: 31 * fem,
                          height: 32 * fem,
                          child: Image(
                            image: AssetImage('lib/images/home.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // freesearchpngsvgiconremovebgpr (38:665)
                    left: 135 * fem,
                    top: 90 * fem,
                    child: Align(
                      child: GestureDetector(
                        onTap: () {
                          print(" icon tapped");
                          // Perform your action when the user icon is tapped
                        },
                        child: SizedBox(
                          width: 37 * fem,
                          height: 32 * fem,
                          child: Image(
                            image: AssetImage('lib/images/search.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // downloadremovebgpreview1SMu (38:666)
                    left: 304 * fem,
                    top: 85 * fem,
                    child: Align(
                      child: GestureDetector(
                        onTap: () {
                          print(" icon tapped");
                          // Perform your action when the user icon is tapped
                        },
                        child: SizedBox(
                          width: 42 * fem,
                          height: 43 * fem,
                          child: Image(
                            image: AssetImage('lib/images/user.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // settingiconremovebgpreview1mQB (38:667)
                    left: 195 * fem,
                    top: 80 * fem,
                    child: Align(
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to another page when tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsPage()),
                          );
                        },
                        child: SizedBox(
                          width: 96 * fem,
                          height: 51 * fem,
                          child: Image(
                            image: AssetImage('lib/images/settings.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
