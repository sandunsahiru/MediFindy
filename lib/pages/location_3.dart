// import 'package:flutter/material.dart';
// import 'package:pharmacy_appnew/pages/account.dart';
// import 'package:pharmacy_appnew/pages/home.dart';
// import 'package:pharmacy_appnew/pages/settings.dart';
//
// class Location_3_Page extends StatelessWidget {
//   const Location_3_Page({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double fem = 1; // Assuming you have defined fem somewhere
//
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: SingleChildScrollView(
//         child: Container(
//           width: double.infinity,
//           height: 805,
//           decoration: BoxDecoration(
//             color: Color(0xffefffff),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 370,
//               ),
//               Container(
//                 margin:
//                     EdgeInsets.fromLTRB(0 * fem, 100 * fem, 0 * fem, 0 * fem),
//                 width: 390,
//                 height: 180,
//                 decoration: BoxDecoration(
//                   color: Color(0xffEFECEC),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Container(
//                       margin:
//                           EdgeInsets.fromLTRB(35 * fem, 25 * fem, 35 * fem, 0),
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 255, 255, 255),
//                         borderRadius:
//                             BorderRadius.circular(10.0), // Add border radius
//                       ),
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 40 * fem,
//                             height: 40 * fem,
//                             child: Image(
//                               image: AssetImage(
//                                 'lib/images/loc2.png',
//                               ), // Image asset
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 5 * fem,
//                           ),
//                           Expanded(
//                             child: TextField(
//                               style: TextStyle(
//                                 fontFamily: 'Quicksand',
//                               ),
//                               decoration: InputDecoration(
//                                 hintText: 'Fetching...',
//                                 border: InputBorder.none,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                         height:
//                             25 * fem), // Add some space between the containers
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Container(
//                             margin: EdgeInsets.symmetric(horizontal: 35 * fem),
//                             decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 255, 255, 255),
//                               borderRadius: BorderRadius.circular(
//                                   10.0), // Add border radius
//                             ),
//                             child: TextField(
//                               style: TextStyle(
//                                 fontFamily: 'Quicksand',
//                               ),
//                               decoration: InputDecoration(
//                                 hintText: '   House No',
//                                 border: InputBorder.none,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Container(
//                             margin: EdgeInsets.fromLTRB(
//                                 0 * fem, 0 * fem, 35 * fem, 0),
//                             decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 255, 255, 255),
//                               borderRadius: BorderRadius.circular(
//                                   10.0), // Add border radius
//                             ),
//                             child: TextField(
//                               style: TextStyle(
//                                 fontFamily: 'Quicksand',
//                               ),
//                               decoration: InputDecoration(
//                                 hintText: '   Street Name',
//                                 border: InputBorder.none,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   print("confirm");
//                 },
//                 child: Container(
//                   margin:
//                       EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 40 * fem),
//                   padding:
//                       EdgeInsets.fromLTRB(8 * fem, 0 * fem, 8 * fem, 0 * fem),
//                   width: 390,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Color(0xffDCFFB7),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'CONFIRM',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700,
//                         height: 1.25,
//                         color: Color(0xff000000),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 60 * fem, // Adjusted height
//                 width: double.infinity,
//                 color: Color(0xffbbe2ec),
//                 padding:
//                     EdgeInsets.fromLTRB(0 * fem, 0 * fem, 10 * fem, 10 * fem),
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       left: 0 * fem,
//                       top: 40 * fem, // Adjusted top position
//                       child: Align(
//                         child: SizedBox(
//                           width: 390 * fem,
//                           height: 20 * fem, // Adjusted height
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Color(0xffbbe2ec),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       left: 30 * fem,
//                       top: 15 * fem, // Adjusted top position
//                       child: Align(
//                         child: GestureDetector(
//                           onTap: () {
//                             // Navigate to another page when tapped
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => HomePage()),
//                             );
//                           },
//                           child: SizedBox(
//                             width: 35 * fem, // Adjusted width
//                             height: 35 * fem, // Adjusted height
//                             child: Image(
//                               image: AssetImage('lib/images/home.png'),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       left: 120 * fem,
//                       top: 15 * fem, // Adjusted top position
//                       child: Align(
//                         child: GestureDetector(
//                           onTap: () {
//                             // Navigate to another page when tapped
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => HomePage()),
//                             );
//                           },
//                           child: SizedBox(
//                             width: 35 * fem, // Adjusted width
//                             height: 35 * fem, // Adjusted height
//                             child: Image(
//                               image: AssetImage('lib/images/search.png'),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       left: 320 * fem,
//                       top: 12 * fem, // Adjusted top position
//                       child: Align(
//                         child: GestureDetector(
//                           onTap: () {
//                             // Navigate to another page when tapped
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => AccountPage()),
//                             );
//                           },
//                           child: SizedBox(
//                             width: 40 * fem, // Adjusted width
//                             height: 40 * fem, // Adjusted height
//                             child: Image(
//                               image: AssetImage('lib/images/user.png'),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       left: 200 * fem,
//                       top: -12 * fem, // Adjusted top position
//                       child: Align(
//                         child: GestureDetector(
//                           onTap: () {
//                             // Navigate to another page when tapped
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => SettingsPage()),
//                             );
//                           },
//                           child: SizedBox(
//                             width: 85 * fem, // Adjusted width
//                             height: 85 * fem, // Adjusted height
//                             child: Image(
//                               image: AssetImage('lib/images/settings.png'),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
