import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/about.dart';
import 'package:pharmacy_appnew/pages/settings.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

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
                    'Privacy Policy',
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
                    // informationwecollectpersonalin (177:139)
                    margin: EdgeInsets.fromLTRB(
                        20 * fem, 0 * fem, 10 * fem, 0 * fem),
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
                            text: 'Information We Collect\n',
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
                                'Personal Information When you create an account, we may collect personal information such as your name, email address, and phone number.\nLocation Information We may collect your device\'s location information to provide location-based services.\nUsage Data We collect information about how you use the App, such as search queries and interactions with pharmacies.\n',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 10 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.25 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                          TextSpan(
                            text: '\nHow We Use Your Information\n',
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
                                'Provide Services We use your information to provide and improve the services offered through the App, such as finding pharmacies and medicines.\nCommunication We may use your contact information to send you notifications, updates, and promotional messages.\n',
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
                            text: 'Data Sharing\n',
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
                                'Pharmacies We may share your information with pharmacies to fulfill your orders or special requests.\nThird Parties We do not sell or share your personal information with third parties for marketing purposes without your consent.\n',
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
                            text: 'Data Security\n',
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
                                'Security Measures We implement security measures to protect your information from unauthorized access or disclosure.\nData Retention We retain your information for as long as necessary to provide the services and as required by law.\n',
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
                            text: 'Cookies\n',
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
                                'Cookies We use cookies to enhance your experience on the App. You can choose to disable cookies in your browser settings.\nThird-Party Services We may use third-party services that use cookies to provide analytics and improve our services.\n',
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
                            text: 'Your Choices\n',
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
                                'Account Settings You can update your account information and preferences in the App settings.\n',
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
                            text: 'Contact Us\n',
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
                                'If you have any questions about these Terms or Privacy Policy, please contact us at sandunsbandara13@gmail.com.\n',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 10 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.25 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                          TextSpan(
                            text: '\nEffective Date\n',
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
                                'These Terms and Privacy Policy are effective as of 22.03.2024.\n\nBy using the Medi Findy app, you agree to these Terms and consent to the collection and use of your information as described in the Privacy Policy.',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 10 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.25 * ffem / fem,
                              color: Color(0xff000000),
                            ),
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
