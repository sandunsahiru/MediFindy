import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/settings.dart';

class PharmacyListPage extends StatelessWidget {
  const PharmacyListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double fem = 1.0; // Set your value of fem here
    final double ffem = 1.0; // Set your value of ffem here
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 844 * fem,
            decoration: BoxDecoration(
              color: Color(0xffefffff),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20.0),
                    width: 390 * fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 21.5 * fem, 29 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    20 * fem, 35 * fem, 9.5 * fem, 0 * fem),
                                width: 73 * fem,
                                height: 75 * fem,
                                child: Image(
                                  image: AssetImage('lib/images/logo.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    20 * fem, 35 * fem, 0 * fem, 0 * fem),
                                child: Text(
                                  'List of Pharmacies',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 24 * ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.25 * ffem / fem,
                                    color: Color(0xff161d6f),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Container list for pharmacy names made tappable
                        PharmacyNameContainer(
                          name: 'ABC Pharmacy',
                          onTap: () {
                            print("tapped");
                            // Action when 'ABC Pharmacy' is tapped
                          },
                        ),
                        PharmacyNameContainer(
                          name: 'DEF Pharmacy',
                          onTap: () {
                            // Action when 'DEF Pharmacy' is tapped
                          },
                        ),
                        PharmacyNameContainer(
                          name: 'HIJ Pharmacy',
                          onTap: () {
                            // Action when 'HIJ Pharmacy' is tapped
                          },
                        ),
                        PharmacyNameContainer(
                          name: 'KLM Pharmacy',
                          onTap: () {
                            // Action when 'KLM Pharmacy' is tapped
                          },
                        ),
                        PharmacyNameContainer(
                          name: 'NOP Pharmacy',
                          onTap: () {
                            // Action when 'NOP Pharmacy' is tapped
                          },
                        ),
                        PharmacyNameContainer(
                          name: 'QRS Pharmacy',
                          onTap: () {
                            // Action when 'QRS Pharmacy' is tapped
                          },
                        ),
                        PharmacyNameContainer(
                          name: 'TUV Pharmacy',
                          onTap: () {
                            // Action when 'TUV Pharmacy' is tapped
                          },
                        ),
                        PharmacyNameContainer(
                          name: 'WXY Pharmacy',
                          onTap: () {
                            // Action when 'WXY Pharmacy' is tapped
                          },
                        ),
                        PharmacyNameContainer(
                          name: 'ZAB Pharmacy',
                          onTap: () {
                            // Action when 'ZAB Pharmacy' is tapped
                          },
                        ),
                        // Add other PharmacyItem containers here
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Positioned(
                      // autogroupeiyuup1 (CUK7mAeNRQ5wUeeRU6EiYu)
                      left: 0 * fem,
                      top: 710 * fem,
                      child: Container(
                        width: 390 * fem,
                        height: 100 * fem,
                        child: Stack(children: [
                          Positioned(
                            // rectangle10RGZ (37:633)
                            left: 0 * fem,
                            top: 38 * fem,
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
                            // homeiconsilhouettefreeiconsdes (37:634)
                            left: 40 * fem,
                            top: 48 * fem,
                            child: Align(
                              child: GestureDetector(
                                onTap: () {
                                  print("Home icon tapped");
                                  // Perform your action when the home icon is tapped
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
                            // freesearchpngsvgiconremovebgpr (37:635)
                            left: 135 * fem,
                            top: 48 * fem,
                            child: Align(
                              child: GestureDetector(
                                onTap: () {
                                  print(" search tapped");
                                  // Perform your action when the home icon is tapped
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
                            // downloadremovebgpreview184V (37:636)
                            left: 304 * fem,
                            top: 42 * fem,
                            child: Align(
                              child: GestureDetector(
                                onTap: () {
                                  print("user icon tapped");
                                  // Perform your action when the home icon is tapped
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
                            // settingiconremovebgpreview1TMf (37:637)
                            left: 195 * fem,
                            top: 38 * fem,
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
                                    image:
                                        AssetImage('lib/images/settings.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}

class PharmacyNameContainer extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const PharmacyNameContainer({
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double fem = 1.0; // Set your value of fem here
    final double ffem = 1.0; // Set your value of ffem here

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(2 * fem, 0 * fem, 0 * fem, 22 * fem),
        width: 317 * fem,
        height: 38 * fem,
        decoration: BoxDecoration(
          color: Color(0xffdddddd),
          borderRadius: BorderRadius.circular(10 * fem),
        ),
        child: Center(
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 20 * ffem,
              fontWeight: FontWeight.w700,
              height: 1.25 * ffem / fem,
              color: Color(0xff000000),
            ),
          ),
        ),
      ),
    );
  }
}
