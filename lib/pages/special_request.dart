import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/home.dart';
import 'package:pharmacy_appnew/pages/services/session_manager.dart';
import 'package:pharmacy_appnew/pages/settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacy_appnew/pages/welcome_page.dart';
import 'package:pharmacy_appnew/utils/custom_snack.dart';
import 'package:pharmacy_appnew/utils/loading_animation.dart';

import 'account.dart';

class SpecialRequest extends StatefulWidget {
  const SpecialRequest({Key? key}) : super(key: key);

  @override
  _SpecialRequestState createState() => _SpecialRequestState();
}

class _SpecialRequestState extends State<SpecialRequest> {
  final SpecialRequestController _controller = SpecialRequestController();
  @override
  Widget build(BuildContext context) {
    double fem = 1;
    double ffem = 1;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            // Your column setup
            children: [
              Container(
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
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Container(
                        
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 69 * fem, 0 * fem),
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
                      // special requests
                      'Special Requests',
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
                
                padding:
                    EdgeInsets.fromLTRB(40 * fem, 0 * fem, 32 * fem, 0 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 6 * fem, 0 * fem),
                      width: 130 * fem,
                      height: 130 * fem,
                      child: Image(
                        image: AssetImage('lib/images/logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 22 * fem),
                child: Text(
                  'Can\'t Find Your Medicine? Request It Here!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.25 * ffem / fem,
                    color: Color(0xff0d9276),
                  ),
                ),
              ),
              Container(
                
                margin:
                    EdgeInsets.fromLTRB(5 * fem, 0 * fem, 5 * fem, 35 * fem),
                padding:
                    EdgeInsets.fromLTRB(8 * fem, 17 * fem, 8 * fem, 18 * fem),
                width: 350,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 17 * fem),
                      width: 350,
                      height: 170 * fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // medicinename,quantity,urgency level...
                            left: 0 * fem,
                            top: 10 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 146 * fem,
                                height: 170 * fem,
                                child: Text(
                                  'Medicine Name:\n\nQuanity Needed: \n\nUrgency Level:\n\nAdditional comments:\n',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.6 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // medicine name
                            left: 120 * fem,
                            top: 0 * fem,
                            bottom: 120,
                            child: Align(
                              child: SizedBox(
                                width: 200 * fem,
                                height: 35 * fem,
                                child: TextField(
                                  controller:
                                      _controller._medicineNameController,
                                  decoration: InputDecoration(
                                    hintText: 'Type here...',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 14 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.25 * ffem / fem,
                                      color: Color(0xffb4b4b8),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(7 * fem),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xffefecec),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            //quantity
                            left: 120 * fem,
                            top: 0 * fem,
                            bottom: 30,
                            child: Align(
                              child: SizedBox(
                                width: 200 * fem,
                                height: 35 * fem,
                                child: TextField(
                                  controller: _controller._quantityController,
                                  decoration: InputDecoration(
                                    hintText: 'Type here...',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 14 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.25 * ffem / fem,
                                      color: Color(0xffb4b4b8),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(7 * fem),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xffefecec),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // urgency
                            left: 120 * fem,
                            top: 55 * fem,
                            bottom: 0,
                            child: Align(
                              child: SizedBox(
                                width: 200 * fem,
                                height: 35 * fem,
                                child: TextField(
                                  controller: _controller._urgencyController,
                                  decoration: InputDecoration(
                                    hintText: 'Type here...',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 14 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.25 * ffem / fem,
                                      color: Color(0xffb4b4b8),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(7 * fem),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xffefecec),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //comments
                      width: double.infinity,
                      height: 100 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7 * fem),
                        color: Color(0xffefecec),
                      ),
                      child: TextField(
                        controller: _controller._commentsController,
                        maxLines: null, // Allows for multiple lines of text
                        decoration: InputDecoration(
                          hintText: 'Type  here...',
                          hintStyle: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.25 * ffem / fem,
                            color: Color(0xffb4b4b8),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(8 * fem),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async { // button
                  _controller
                      ._sendSpecialRequest()
                      .then((value) {})
                      .onError((error, stackTrace) {
                    CustomSnackbar.showWarning(context, error.toString());
                  });
                },
                child: Container(
                  margin:
                      EdgeInsets.fromLTRB(23 * fem, 0 * fem, 23 * fem, 0 * fem),
                  width: double.infinity,
                  height: 40 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xff9bcf53),// button color
                    borderRadius: BorderRadius.circular(10 * fem),
                  ),
                  child: Center(
                    child: Text('Request to All Pharmacies'), //text on button
                  ),
                ),
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
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Implement action or navigate to search page
              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => AccountPage()));
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

class SpecialRequestController {
  final TextEditingController _medicineNameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _urgencyController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();

  Future<void> _sendSpecialRequest() async {
    try {
      showLoadingAnimation();
      await FirebaseFirestore.instance.collection('special_request').add({
        'medicine_name': _medicineNameController.text.trim(),
        'quantity': _quantityController.text.trim(),
        'urgency_level': _urgencyController.text.trim(),
        'additional_comments': _commentsController.text.trim(),
        'user_id': SessionManager().userId,
        'request_time': FieldValue.serverTimestamp(),
      });
      closeLoadingAnimation();
    } catch (e) {
      closeLoadingAnimation();
      throw "Failed to send request: $e";
    }
  }
}
