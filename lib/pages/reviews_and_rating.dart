import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pharmacy_appnew/pages/about_pharmacy.dart';
import 'package:pharmacy_appnew/pages/account.dart';
import 'package:pharmacy_appnew/pages/home.dart';
import 'package:pharmacy_appnew/pages/settings.dart';

class ReviewAndRating extends StatelessWidget {
  const ReviewAndRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem = 1; // Assuming you have defined fem somewhere
    double ffem = 1; // Assuming you have defined ffem somewhere

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffefffff),
          ),
          child: Column(
            children: [
              Container(
                // autogroupusvbfRy (GpWvxZKddap7n9ksvAuSVB)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 40 * fem, 0 * fem, 31 * fem),
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
                          MaterialPageRoute(
                              builder: (context) => AboutPharmacy()),
                        );
                      },
                      child: Container(
                        // mzo (32:497)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 51 * fem, 0 * fem),
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
                      // reviewsandratings4yu (32:496)
                      'Reviews and Ratings',
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
                // screenshot284withoutnameremove (36:532)
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
                width: 130 * fem,
                height: 130 * fem,
                child: Image(
                  image: AssetImage('lib/images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                // klmpharmacy1Xm (32:499)
                margin:
                    EdgeInsets.fromLTRB(6 * fem, 0 * fem, 0 * fem, 19 * fem),
                child: Text(
                  'KLM Pharmacy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 24 * ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.25 * ffem / fem,
                    color: Color(0xff0d9276),
                  ),
                ),
              ),
              Container(
                // weappreciateyourfeedbacksharey (36:537)
                margin:
                    EdgeInsets.fromLTRB(3 * fem, 0 * fem, 0 * fem, 15 * fem),
                constraints: BoxConstraints(
                  maxWidth: 312 * fem,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.25 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                    children: [
                      TextSpan(
                        text: 'We appreciate your feedback!\n',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.25 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                      TextSpan(
                        text:
                            'Share your experience with pharmacies on Medi Findy to help others. Your ratings are valuable in improving our service.',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.25 * ffem / fem,
                          color: Color(0xff294b29),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 40 * fem, // Adjust the size as needed
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // Handle rating updates here
                  print(rating);
                },
              ),
              Container(
                // autogroupzwwjEEK (GpWw7Djs9Jo7V64ovkzwwj)
                margin:
                    EdgeInsets.fromLTRB(20 * fem, 15 * fem, 0 * fem, 25 * fem),
                padding:
                    EdgeInsets.fromLTRB(8 * fem, 9 * fem, 8 * fem, 8 * fem),
                width: 340,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xfff5f5f5),
                  borderRadius: BorderRadius.circular(9 * fem),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Your Name',
                    hintStyle: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.25 * ffem / fem,
                      color: Color(0xffb4b4b8),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                // autogroupshkh6nK (GpWwCiahsbQAeLTLrfsHkh)
                margin:
                    EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 25 * fem),
                padding:
                    EdgeInsets.fromLTRB(8 * fem, 9 * fem, 8 * fem, 8 * fem),
                width: 340,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xfff5f5f5),
                  borderRadius: BorderRadius.circular(9 * fem),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Your Email',
                    hintStyle: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.25 * ffem / fem,
                      color: Color(0xffb4b4b8),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                // autogrouppefwaSb (GpWwHiSNu8K8F7AvFKPEfw)
                margin:
                    EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 25 * fem),
                padding:
                    EdgeInsets.fromLTRB(8 * fem, 9 * fem, 8 * fem, 8 * fem),
                width: 340,
                height: 91 * fem,
                decoration: BoxDecoration(
                  color: Color(0xfff5f5f5),
                  borderRadius: BorderRadius.circular(9 * fem),
                ),
                child: TextField(
                  maxLines: null, // Allows for multiple lines of text
                  decoration: InputDecoration(
                    hintText: 'What can we do to improve your experience?',
                    hintStyle: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.25 * ffem / fem,
                      color: Color(0xffb4b4b8),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("Submit");
                  // Perform your action when the settings icon is tapped
                },
                child: Container(
                  // autogroupoydxSjh (GpWwPJ7QusXrzmWH6moydX)
                  margin: EdgeInsets.fromLTRB(
                      108 * fem, 0 * fem, 102 * fem, 0 * fem),
                  width: double.infinity,
                  height: 36 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xffa5dd9b),
                    borderRadius: BorderRadius.circular(8 * fem),
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                // autogroup2ildjio (GpWwVHwRLuq1iVZmZx2iLD)
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // autogroup9pbt63Z (GpWwhY624NGMwBXEGw9PBT)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 5 * fem, 0 * fem, 0 * fem),
                      width: 385 * fem,
                      height: 85 * fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // rectangle91gK (37:651)
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
                            // homeiconsilhouettefreeiconsdes (37:652)
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
                                    image: AssetImage('lib/images/home.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // freesearchpngsvgiconremovebgpr (37:653)
                            left: 135 * fem,
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
                            // downloadremovebgpreview2k1d (37:654)
                            left: 304 * fem,
                            top: 42 * fem,
                            child: Align(
                              child: GestureDetector(
                                onTap: () {
                                  // Navigate to another page when tapped
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
                            // settingiconremovebgpreview1esh (37:655)
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
