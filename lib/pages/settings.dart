import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/about.dart';
import 'package:pharmacy_appnew/pages/account.dart';
import 'package:pharmacy_appnew/pages/password_security.dart';
import 'package:pharmacy_appnew/pages/home.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
            color: Color(0xffefffff),
          ),
          child: Column(children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, screenHeight * 0.07, 0, screenHeight * 0.04),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08, vertical: screenHeight * 0.005),
              width: screenWidth,
              decoration: const BoxDecoration(
                color: Color(0xff000000),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
              child: Image.asset(
                'lib/images/logo.png',
                width: screenWidth * 0.3,
                height: screenHeight * 0.15,
                fit: BoxFit.cover,
              ),
            ),
            SettingsItem(
              title: 'Account',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage())),
            ),
            SettingsItem(
              title: 'Password & Security',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordAndSecurity())),
            ),
            SettingsItem(
              title: 'Notifications',
              onTap: () {},
            ),
            SettingsItem(
              title: 'About',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage())),
            ),
            SettingsItem(
              title: 'Log Out',
              onTap: () {},
            ),
          ]),
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SettingsItem({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Color(0xffd9d9d9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
