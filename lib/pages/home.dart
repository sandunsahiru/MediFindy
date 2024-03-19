import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/account.dart';
import 'package:pharmacy_appnew/pages/location.dart';
import 'package:pharmacy_appnew/pages/pharmacy_list.dart';
import 'package:pharmacy_appnew/pages/search_medicines.dart';
import 'package:pharmacy_appnew/pages/settings.dart';
import 'package:pharmacy_appnew/pages/special_request.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double fem = 1.0; // Set your value of fem here
    final double ffem = 1.0; // Set your value of ffem here
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            width: double.infinity,
            height: 804 * fem,
            decoration: BoxDecoration(
              color: Color(0xffefffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  width: 390 * fem,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 0 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    10 * fem, 35 * fem, 0 * fem, 0 * fem),
                                width: 85 * fem,
                                height: 85 * fem,
                                child: Image(
                                  image: AssetImage('lib/images/logo.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    5 * fem, 20 * fem, 0 * fem, 0 * fem),
                                child: Text(
                                  'Welcome to the Medi Findy!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w800,
                                    height: 1.25 * ffem / fem,
                                    color: Color(0xFFDC5F00),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              25 * fem, 5 * fem, 25 * fem, 10 * fem),
                          padding: EdgeInsets.symmetric(horizontal: 10 * fem),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 193, 219, 235)
                                    .withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Search for Medicines...',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    // Navigate to another page
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SearchMedicines()),
                                    );
                                  },
                                  child: Icon(Icons.search)),
                            ],
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            // Navigate to another page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LocationPage()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                10 * fem, 10 * fem, 10 * fem, 0 * fem),

                            width: 340 * fem, // Decrease width
                            height: 45 * fem, // Decrease height
                            decoration: BoxDecoration(
                              color: Color(0xffDCF2F1), // Background color
                              borderRadius: BorderRadius.circular(
                                  10.0), // Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 194, 229, 245)
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius: 2, // Spread radius
                                  blurRadius: 5, // Blur radius
                                  offset: Offset(0, 3), // Offset
                                ),
                              ],
                            ),

                            child: Row(
                              children: [
                                Container(
                                  width: 50 * fem,
                                  height: 50 * fem,
                                  child: Image(
                                    image: AssetImage(
                                        'lib/images/location.png'), // Image asset
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                    width: 10), // Spacer between image and text
                                Text(
                                  'Click Here to Set Your Location!!!',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize:
                                        16 * fem, // Adjust font size as needed
                                    fontWeight: FontWeight.bold,
                                    color: Color(
                                        0xffFF407D), // Adjust text color as needed
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          margin: EdgeInsets.fromLTRB(
                              10 * fem, 0 * fem, 0 * fem, 0 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Navigate to another page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PharmacyListPage()),
                                  );
                                },
                                child: Container(
                                  width: 180 * fem, // Adjusted width
                                  height: 110 * fem, // Adjusted height
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image(
                                            image: AssetImage(
                                                'lib/images/pharmacies.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Pharmacies',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontSize: 14, // Adjusted font size
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigate to another page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SpecialRequest()),
                                  );
                                },
                                child: Container(
                                  width: 180 * fem, // Adjusted width
                                  height: 110 * fem, // Adjusted height
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image(
                                            image: AssetImage(
                                                'lib/images/medicines.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Medical Requests',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontSize: 14, // Adjusted font size
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                            height: 15), // Add space between text and image

                        // Container list for pharmacy names made tappable
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text('Healthy Living Guides',
                                      style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontSize: 16,
                                          color:
                                              Color.fromARGB(255, 68, 57, 231),
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                    height:
                                        10), // Add space between text and image
                                Center(
                                  child: Image.asset(
                                    'lib/images/benifit.png',
                                    width: 250, // Adjust image width
                                    height: 120, // Adjust image height
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                height: 5), // Adjust spacing between sections
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://www.medicalnewstoday.com/articles/322268'); // Replace 'https://your-url.com' with your actual URL
                                    },
                                    child: Text('Benefits of Eating Healthy',
                                        style: TextStyle(
                                            fontFamily: 'Quicksand',
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        5), // Add space between text and image
                                Center(
                                  child: Image.asset(
                                    'lib/images/health.png',
                                    width: 217, // Adjust image width
                                    height: 110, // Adjust image height
                                  ),
                                ),

                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      launch(
                                          'https://onehealthtrust.org/?gad_source=1&gclid=CjwKCAjw48-vBhBbEiwAzqrZVJxVwHGHzoltRU4kpOxmu8y8k01yGqBJSQIXrCgIGWnkyb5or_ENwxoC0L4QAvD_BwE'); // Replace 'https://your-url.com' with your actual URL
                                    },
                                    child: Text(
                                        'One Health Trust - Read About Our Research',
                                        style: TextStyle(
                                            fontFamily: 'Quicksand',
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                            // Adjust spacing between sections
                          ],
                        ),
                        SizedBox(height: 5),

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
                                        // Navigate to another page when tapped
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage()),
                                        );
                                      },
                                      child: SizedBox(
                                        width: 31 * fem,
                                        height: 32 * fem,
                                        child: Image(
                                          image:
                                              AssetImage('lib/images/home.png'),
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
                                        // Navigate to another page
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage()),
                                        );
                                      },
                                      child: SizedBox(
                                        width: 37 * fem,
                                        height: 32 * fem,
                                        child: Image(
                                          image: AssetImage(
                                              'lib/images/search.png'),
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
                                        // Navigate to another page
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AccountPage()),
                                        );
                                      },
                                      child: SizedBox(
                                        width: 42 * fem,
                                        height: 43 * fem,
                                        child: Image(
                                          image:
                                              AssetImage('lib/images/user.png'),
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
                                              builder: (context) =>
                                                  SettingsPage()),
                                        );
                                      },
                                      child: SizedBox(
                                        width: 96 * fem,
                                        height: 51 * fem,
                                        child: Image(
                                          image: AssetImage(
                                              'lib/images/settings.png'),
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
          )
        ]),
      ),
    );
  }
}
