import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/pharmacy/Terms_of_use.dart';
import 'package:pharmacy_appnew/pages/pharmacy/privacy_policy.dart';
import 'package:pharmacy_appnew/pages/pharmacy/home.dart';
import 'package:pharmacy_appnew/pages/pharmacy/account.dart';
import 'package:pharmacy_appnew/pages/pharmacy/settings.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem = 1; // Assuming you have defined fem somewhere
    double ffem = 1;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
            'About',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xff000000),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset(
                  'lib/images/logo.png',
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
              // Your other Widgets go here...
              SizedBox(
                height: 70 * fem,
              ),
              Container(
                padding:
                EdgeInsets.fromLTRB(25 * fem, 22 * fem, 30 * fem, 17 * fem),
                width: 350,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to another page when tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrivacyPolicy()),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              15 * fem, 6 * fem, 22 * fem, 5 * fem),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffd9d9d9),
                            borderRadius: BorderRadius.circular(10 * fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // accountEzK (38:712)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 130 * fem, 1 * fem),
                                child: Text(
                                  'Privacy Policy',
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
                              Text(
                                // xfR (181:187)
                                '>',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.25 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 27 * fem,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to another page when tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TermsOfUse()),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              16 * fem, 6 * fem, 22 * fem, 5 * fem),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffd9d9d9),
                            borderRadius: BorderRadius.circular(10 * fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 130 * fem, 3 * fem),
                                child: Text(
                                  'Terms of Use ',
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
                              Text(
                                // 8iK (181:191)
                                '>',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.25 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),

      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomePage()));
              },
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
