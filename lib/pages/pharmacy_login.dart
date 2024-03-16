import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/home.dart';

class PharmacyLoginPage extends StatelessWidget {
  const PharmacyLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffefffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(27, 110, 28, 59),
                width: double.infinity,
                height: 307,
                child: Stack(
                  children: [
                    Positioned(
                      left: 100,
                      top: 258,
                      child: Align(
                        child: SizedBox(
                          width: 135,
                          height: 49,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                height: 1.25,
                                color: Color(0xff1c7947),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Login\n',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    height: 1.25,
                                    color: Color(0xff006a71),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign in to Continue!',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    height: 1.25,
                                    color: Color(0xff00bd56),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Align(
                        child: SizedBox(
                          width: 335,
                          height: 282,
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
              Container(
                margin: EdgeInsets.fromLTRB(74, 0, 74, 33),
                padding: EdgeInsets.fromLTRB(17, 5, 17, 5),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xfff4f9f9),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Pharmacy ID',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      color: Color(0xffb4b4b8),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(74, 0, 74, 51),
                padding: EdgeInsets.fromLTRB(17, 5, 17, 5),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xfff4f9f9),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      color: Color(0xffb4b4b8),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                 onTap: () {
                      // Navigate to another page when tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                child: Container(
                  margin: EdgeInsets.fromLTRB(138, 30, 139, 100),
                  width: double.infinity,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Color(0xff006a71),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'LOGIN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
