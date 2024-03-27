import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/account.dart';
import 'package:pharmacy_appnew/pages/location.dart';
import 'package:pharmacy_appnew/pages/location_3.dart';
import 'package:pharmacy_appnew/pages/home.dart';

import 'package:pharmacy_appnew/pages/settings.dart';

class Location_2_Page extends StatelessWidget {
  const Location_2_Page({Key? key}) : super(key: key);

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
          decoration: const BoxDecoration(
            color: Color(0xffefffff),
          ),
          child: Column(children: [
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 60 * fem, 0 * fem, 31 * fem),
              padding:
                  EdgeInsets.fromLTRB(34 * fem, 4 * fem, 94 * fem, 4 * fem),
              width: double.infinity,
              decoration: const BoxDecoration(
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
                            builder: (context) => const LocationPage()),
                      );
                    },
                    child: Container(
                      // 21M (36:582)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 110 * fem, 0 * fem),
                      child: Text(
                        '<',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.25 * ffem / fem,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    // specialrequestsHKM (36:581)
                    'Location',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.25 * ffem / fem,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupgnq5eHd (GpWyzUGWxk9rt6BwfLgNQ5)
              padding:
                  EdgeInsets.fromLTRB(40 * fem, 0 * fem, 32 * fem, 0 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // screenshot284withoutnameremove (36:587)
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 6 * fem, 0 * fem),
                    width: 160 * fem,
                    height: 160 * fem,
                    child: const Image(
                      image: AssetImage('lib/images/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsets.fromLTRB(35 * fem, 5 * fem, 35 * fem, 10 * fem),
              padding: EdgeInsets.symmetric(horizontal: 10 * fem),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 193, 219, 235)
                        .withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 50 * fem,
                    height: 50 * fem,
                    child: const Image(
                      image:
                          AssetImage('lib/images/location.png'), // Image asset
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 5 * fem,
                  ),
                  const Expanded(
                    child: TextField(
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search for Location.......',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Icon(Icons.search),
                ],
              ),
            ),
            SizedBox(
              height: 40 * fem,
            ),
            Row(
              children: [
                Container(
                  margin:
                      EdgeInsets.fromLTRB(65 * fem, 5 * fem, 0 * fem, 10 * fem),
                  width: 40 * fem,
                  height: 40 * fem,
                  child: const Image(
                    image: AssetImage('lib/images/loc_pin.png'), // Image asset
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 15 * fem,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to another page when tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Location_3_Page()),
                    );
                  },
                  child: Text(
                    'SET LOCATION ON MAP!',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 18 * fem, // Adjust font size as needed
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF004225),
                      // Adjust text color as needed
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 220 * fem,
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
                          decoration: const BoxDecoration(
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
                          // Navigate to another page when tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                        child: SizedBox(
                          width: 31 * fem,
                          height: 32 * fem,
                          child: const Image(
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
                          // Navigate to another page when tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                        child: SizedBox(
                          width: 37 * fem,
                          height: 32 * fem,
                          child: const Image(
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
                          // Navigate to another page when tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AccountPage()),
                          );
                        },
                        child: SizedBox(
                          width: 42 * fem,
                          height: 43 * fem,
                          child: const Image(
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
                                builder: (context) => const SettingsPage()),
                          );
                        },
                        child: SizedBox(
                          width: 96 * fem,
                          height: 51 * fem,
                          child: const Image(
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
