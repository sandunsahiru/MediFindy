import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/account.dart';
import 'package:pharmacy_appnew/pages/home.dart';
import 'package:pharmacy_appnew/pages/about_pharmacy.dart';


import 'package:pharmacy_appnew/pages/settings.dart';

class SearchMedicines extends StatelessWidget {
  const SearchMedicines({Key? key}) : super(key: key);

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
              margin: EdgeInsets.fromLTRB(0 * fem, 50 * fem, 0 * fem, 20 * fem),
              padding:
                  EdgeInsets.fromLTRB(34 * fem, 4 * fem, 94 * fem, 4 * fem),
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
                        MaterialPageRoute(builder: (context) => HomePage()),
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
                    'Search Matches',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.25 * ffem / fem,
                      color: Color(0xffffffff),
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
                    child: Image(
                      image: AssetImage('lib/images/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupn1xyTE7 (GpWrnBHVrEXdCkzTUoN1xy)
              margin:
                  EdgeInsets.fromLTRB(40 * fem, 0 * fem, 40 * fem, 15 * fem),
              padding:
                  EdgeInsets.fromLTRB(24 * fem, 5 * fem, 37 * fem, 4 * fem),
              width: 350,
              height: 58 * fem,
              decoration: BoxDecoration(
                color: Color(0xffc1f2b0),
                borderRadius: BorderRadius.circular(5 * fem),
              ),
              child: Center(
                // addressno59malwattaroadwadduwa (31:488)
                child: SizedBox(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 254 * fem,
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 13 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.25 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                        children: [
                          TextSpan(
                            text: 'Generic Name:',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 13 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.25 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                          TextSpan(
                            text: ' Paracetamol\n',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 13 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.25 * ffem / fem,
                              color: Color(0xFF0802A3),
                            ),
                          ),
                          TextSpan(
                            text: 'Brand Names: ',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 13 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.25 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                          TextSpan(
                            text:
                                '  Dymadon®, Lemsip®, Panadol®, Panamax®, Tylenol®\n',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 13 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.25 * ffem / fem,
                              color: Color(0xFF0802A3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.fromLTRB(45 * fem, 0 * fem, 40 * fem, 25 * fem),
              child: Text(
                'Pharmacies with the Required Medication',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 15 * fem, // Adjust font size as needed
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF088395),
                  // Adjust text color as needed
                ),
              ),
            ),
            SizedBox(
              height: 5 * fem,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                                  // Navigate to another page when tapped
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AboutPharmacy()),
                                  );
                                },
                      child: Container(
                        // autogroupgagpX4K (KjockFG45Aqo4dGdZVGAGP)
                        padding: EdgeInsets.fromLTRB(
                            15 * fem, 6 * fem, 15 * fem, 5 * fem),
                        margin: EdgeInsets.fromLTRB(
                            30 * fem, 0 * fem, 20 * fem, 1 * fem),
                        width: 180,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xffF8F1F1),
                          borderRadius: BorderRadius.circular(10 * fem),
                        ),
                        child: Row(
                          children: [
                            Container(
                              // accountEzK (38:712)
                              margin: EdgeInsets.fromLTRB(
                                  18 * fem, 0 * fem, 10 * fem, 1 * fem),
                              child: Text(
                                'ABC Pharmacy',
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
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5 * fem,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to another page when tapped
                      },
                      child: Container(
                        // autogroupgagpX4K (KjockFG45Aqo4dGdZVGAGP)
                        padding: EdgeInsets.fromLTRB(
                            15 * fem, 6 * fem, 5 * fem, 5 * fem),
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xffE2F6CA),
                          borderRadius: BorderRadius.circular(10 * fem),
                        ),
                        child: Row(
                          children: [
                            Container(
                              // accountEzK (38:712)
                              margin: EdgeInsets.fromLTRB(
                                  12 * fem, 0 * fem, 5 * fem, 1 * fem),
                              child: Text(
                                'Locate  📍',
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20 * fem,
                ),
                Row(
                  children: [
                    GestureDetector(
                     onTap: () {
                                  // Navigate to another page when tapped
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AboutPharmacy()),
                                  );
                                },
                      child: Container(
                        // autogroupgagpX4K (KjockFG45Aqo4dGdZVGAGP)
                        padding: EdgeInsets.fromLTRB(
                            15 * fem, 6 * fem, 15 * fem, 5 * fem),
                        margin: EdgeInsets.fromLTRB(
                            30 * fem, 0 * fem, 20 * fem, 1 * fem),
                        width: 180,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xffF8F1F1),
                          borderRadius: BorderRadius.circular(10 * fem),
                        ),
                        child: Row(
                          children: [
                            Container(
                              // accountEzK (38:712)
                              margin: EdgeInsets.fromLTRB(
                                  18 * fem, 0 * fem, 10 * fem, 1 * fem),
                              child: Text(
                                'DEF Pharmacy',
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
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5 * fem,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to another page when tapped
                      },
                      child: Container(
                        // autogroupgagpX4K (KjockFG45Aqo4dGdZVGAGP)
                        padding: EdgeInsets.fromLTRB(
                            15 * fem, 6 * fem, 5 * fem, 5 * fem),
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xffE2F6CA),
                          borderRadius: BorderRadius.circular(10 * fem),
                        ),
                        child: Row(
                          children: [
                            Container(
                              // accountEzK (38:712)
                              margin: EdgeInsets.fromLTRB(
                                  12 * fem, 0 * fem, 5 * fem, 1 * fem),
                              child: Text(
                                'Locate  📍',
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20 * fem,
                ),
                Row(
                  children: [
                    GestureDetector(
                     onTap: () {
                                  // Navigate to another page when tapped
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AboutPharmacy()),
                                  );
                                },
                      child: Container(
                        // autogroupgagpX4K (KjockFG45Aqo4dGdZVGAGP)
                        padding: EdgeInsets.fromLTRB(
                            15 * fem, 6 * fem, 15 * fem, 5 * fem),
                        margin: EdgeInsets.fromLTRB(
                            30 * fem, 0 * fem, 20 * fem, 1 * fem),
                        width: 180,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xffF8F1F1),
                          borderRadius: BorderRadius.circular(10 * fem),
                        ),
                        child: Row(
                          children: [
                            Container(
                              // accountEzK (38:712)
                              margin: EdgeInsets.fromLTRB(
                                  18 * fem, 0 * fem, 10 * fem, 1 * fem),
                              child: Text(
                                'HIJ Pharmacy',
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
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5 * fem,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to another page when tapped
                      },
                      child: Container(
                        // autogroupgagpX4K (KjockFG45Aqo4dGdZVGAGP)
                        padding: EdgeInsets.fromLTRB(
                            15 * fem, 6 * fem, 5 * fem, 5 * fem),
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xffE2F6CA),
                          borderRadius: BorderRadius.circular(10 * fem),
                        ),
                        child: Row(
                          children: [
                            Container(
                              // accountEzK (38:712)
                              margin: EdgeInsets.fromLTRB(
                                  12 * fem, 0 * fem, 5 * fem, 1 * fem),
                              child: Text(
                                'Locate  📍',
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20 * fem,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                                  // Navigate to another page when tapped
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AboutPharmacy()),
                                  );
                                },
                      child: Container(
                        // autogroupgagpX4K (KjockFG45Aqo4dGdZVGAGP)
                        padding: EdgeInsets.fromLTRB(
                            15 * fem, 6 * fem, 15 * fem, 5 * fem),
                        margin: EdgeInsets.fromLTRB(
                            30 * fem, 0 * fem, 20 * fem, 1 * fem),
                        width: 180,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xffF8F1F1),
                          borderRadius: BorderRadius.circular(10 * fem),
                        ),
                        child: Row(
                          children: [
                            Container(
                              // accountEzK (38:712)
                              margin: EdgeInsets.fromLTRB(
                                  18 * fem, 0 * fem, 10 * fem, 1 * fem),
                              child: Text(
                                'KLM Pharmacy',
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
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5 * fem,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to another page when tapped
                      },
                      child: Container(
                        // autogroupgagpX4K (KjockFG45Aqo4dGdZVGAGP)
                        padding: EdgeInsets.fromLTRB(
                            15 * fem, 6 * fem, 5 * fem, 5 * fem),
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xffE2F6CA),
                          borderRadius: BorderRadius.circular(10 * fem),
                        ),
                        child: Row(
                          children: [
                            Container(
                              // accountEzK (38:712)
                              margin: EdgeInsets.fromLTRB(
                                  12 * fem, 0 * fem, 5 * fem, 1 * fem),
                              child: Text(
                                'Locate  📍',
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20 * fem,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                                  // Navigate to another page when tapped
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AboutPharmacy()),
                                  );
                                },
                      child: Container(
                        // autogroupgagpX4K (KjockFG45Aqo4dGdZVGAGP)
                        padding: EdgeInsets.fromLTRB(
                            15 * fem, 6 * fem, 15 * fem, 5 * fem),
                        margin: EdgeInsets.fromLTRB(
                            30 * fem, 0 * fem, 20 * fem, 1 * fem),
                        width: 180,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xffF8F1F1),
                          borderRadius: BorderRadius.circular(10 * fem),
                        ),
                        child: Row(
                          children: [
                            Container(
                              // accountEzK (38:712)
                              margin: EdgeInsets.fromLTRB(
                                  18 * fem, 0 * fem, 10 * fem, 1 * fem),
                              child: Text(
                                'NOP Pharmacy',
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
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5 * fem,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to another page when tapped
                      },
                      child: Container(
                        // autogroupgagpX4K (KjockFG45Aqo4dGdZVGAGP)
                        padding: EdgeInsets.fromLTRB(
                            15 * fem, 6 * fem, 5 * fem, 5 * fem),
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xffE2F6CA),
                          borderRadius: BorderRadius.circular(10 * fem),
                        ),
                        child: Row(
                          children: [
                            Container(
                              // accountEzK (38:712)
                              margin: EdgeInsets.fromLTRB(
                                  12 * fem, 0 * fem, 5 * fem, 1 * fem),
                              child: Text(
                                'Locate  📍',
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
                          // Navigate to another page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
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
                          // Navigate to another page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
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
                          // Navigate to another page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccountPage()),
                          );
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
