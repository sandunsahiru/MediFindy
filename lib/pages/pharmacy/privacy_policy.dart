import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/about.dart';
import 'package:pharmacy_appnew/pages/account.dart';
import 'package:pharmacy_appnew/pages/settings.dart';
import 'package:pharmacy_appnew/pages/home.dart';

import 'account.dart';


class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem = 1;
    double ffem = 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Privacy Policy',
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
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => PharmacyAccountPage()));
              },
            ),

            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => SettingsPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
