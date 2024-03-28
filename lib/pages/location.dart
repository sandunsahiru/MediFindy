// import 'package:flutter/material.dart';
// import 'package:pharmacy_appnew/pages/about_pharmacy.dart';
// import 'package:pharmacy_appnew/pages/account.dart';
// import 'package:pharmacy_appnew/pages/home.dart';
// import 'package:pharmacy_appnew/pages/location_2.dart';
//
//
// import 'package:pharmacy_appnew/pages/settings.dart';
//
// class LocationPage extends StatelessWidget {
//   const LocationPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double fem = 1; // Assuming you have defined fem somewhere
//     double ffem = 1; // Assuming you have defined ffem somewhere
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
//           child: Column(children: [
//             Container(
//               margin: EdgeInsets.fromLTRB(0 * fem, 60 * fem, 0 * fem, 31 * fem),
//               padding:
//                   EdgeInsets.fromLTRB(34 * fem, 4 * fem, 94 * fem, 4 * fem),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Color(0xff000000),
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       // Navigate to another page when tapped
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => HomePage()),
//                       );
//                     },
//                     child: Container(
//                       // 21M (36:582)
//                       margin: EdgeInsets.fromLTRB(
//                           0 * fem, 0 * fem, 110 * fem, 0 * fem),
//                       child: Text(
//                         '<',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontFamily: 'Quicksand',
//                           fontSize: 20 * ffem,
//                           fontWeight: FontWeight.w700,
//                           height: 1.25 * ffem / fem,
//                           color: Color(0xffffffff),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Text(
//                     // specialrequestsHKM (36:581)
//                     'Location',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'Quicksand',
//                       fontSize: 20 * ffem,
//                       fontWeight: FontWeight.w700,
//                       height: 1.25 * ffem / fem,
//                       color: Color(0xffffffff),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               // autogroupgnq5eHd (GpWyzUGWxk9rt6BwfLgNQ5)
//               padding:padding
//                   EdgeInsets.fromLTRB(40 * fem, 0 * fem, 32 * fem, 0 * fem),
//               width: double.infinity,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     // screenshot284withoutnameremove (36:587)
//                     margin:
//                         EdgeInsets.fromLTRB(0 * fem, 0 * fem, 6 * fem, 0 * fem),
//                     width: 160 * fem,
//                     height: 160 * fem,
//                     child: Image(
//                       image: AssetImage('lib/images/logo.png'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               margin:
//                   EdgeInsets.fromLTRB(10 * fem, 10 * fem, 10 * fem, 0 * fem),
//               padding:
//                   EdgeInsets.fromLTRB(0 * fem, 10 * fem, 32 * fem, 0 * fem),
//
//               width: 340 * fem, // Decrease width
//               height: 55 * fem, // Decrease height
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 255, 255, 255), // Background color
//                 // Rounded corners
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color.fromARGB(255, 194, 229, 245)
//                         .withOpacity(0.5), // Shadow color
//                     spreadRadius: 2, // Spread radius
//                     blurRadius: 5, // Blur radius
//                     offset: Offset(0, 3), // Offset
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     width: 50 * fem,
//                     height: 50 * fem,
//                     child: Image(
//                       image:
//                           AssetImage('lib/images/location.png'), // Image asset
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(width: 10), // Spacer between image and text
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Fetching....',
//                         style: TextStyle(
//                           fontFamily: 'Quicksand',
//                           fontSize: 16 * fem, // Adjust font size as needed
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromARGB(
//                               255, 3, 3, 3), // Adjust text color as needed
//                         ),
//                       ),
//                       Text(
//                         'Fetching Location..',
//                         style: TextStyle(
//                           fontFamily: 'Quicksand',
//                           fontSize: 12 * fem, // Adjust font size as needed
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromARGB(
//                               134, 92, 91, 92), // Adjust text color as needed
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 80),
//                   GestureDetector(
//                     onTap: () {
//                       // Navigate to another page when tapped
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Location_2_Page()),
//                       );
//                     },
//                     child: Text(
//                       'Change',
//                       style: TextStyle(
//                         fontFamily: 'Quicksand',
//                         fontSize: 16 * fem, // Adjust font size as needed
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF333A73),
//                         // Adjust text color as needed
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 40 * fem,
//             ),
//             Text(
//               'Pharmacies Close to You!!!',
//               style: TextStyle(
//                 fontFamily: 'Quicksand',
//                 fontSize: 20 * fem, // Adjust font size as needed
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFFFE7A36),
//                 // Adjust text color as needed
//               ),
//             ),
//             SizedBox(
//               height: 20 * fem,
//             ),
//             Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//               GestureDetector(
//                 onTap: () {
//                   // Navigate to another page when tapped
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AboutPharmacy()),
//                   );
//                 },
//                 child: Container(
//                   // autogroupgagpX4K (KjockFG45Aqo4dGdZVGAGP)
//                   padding:
//                       EdgeInsets.fromLTRB(15 * fem, 6 * fem, 22 * fem, 5 * fem),
//                   width: 320,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: Color(0xffd9d9d9),
//                     borderRadius: BorderRadius.circular(10 * fem),
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         // accountEzK (38:712)
//                         margin: EdgeInsets.fromLTRB(
//                             85 * fem, 0 * fem, 50 * fem, 1 * fem),
//                         child: Text(
//                           'KLM Pharmacy',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontFamily: 'Quicksand',
//                             fontSize: 16 * ffem,
//                             fontWeight: FontWeight.w700,
//                             height: 1.25 * ffem / fem,
//                             color: Color(0xff000000),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 27 * fem,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   // Navigate to another page when tapped
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AboutPharmacy()),
//                   );
//                 },
//                 child: Container(
//                   // autogroupgagpX4K (KjockFG45Aqo4dGdZVGAGP)
//                   padding:
//                       EdgeInsets.fromLTRB(15 * fem, 6 * fem, 22 * fem, 5 * fem),
//                   width: 320,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: Color(0xffd9d9d9),
//                     borderRadius: BorderRadius.circular(10 * fem),
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         // accountEzK (38:712)
//                         margin: EdgeInsets.fromLTRB(
//                             85 * fem, 0 * fem, 50 * fem, 1 * fem),
//                         child: Text(
//                           'NOP Pharmacy',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontFamily: 'Quicksand',
//                             fontSize: 16 * ffem,
//                             fontWeight: FontWeight.w700,
//                             height: 1.25 * ffem / fem,
//                             color: Color(0xff000000),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 27 * fem,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   // Navigate to another page when tapped
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AboutPharmacy()),
//                   );
//                 },
//                 child: Container(
//                   // autogroupgagpX4K (KjockFG45Aqo4dGdZVGAGP)
//                   padding:
//                       EdgeInsets.fromLTRB(15 * fem, 6 * fem, 22 * fem, 5 * fem),
//                   width: 320,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: Color(0xffd9d9d9),
//                     borderRadius: BorderRadius.circular(10 * fem),
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         // accountEzK (38:712)
//                         margin: EdgeInsets.fromLTRB(
//                             85 * fem, 0 * fem, 50 * fem, 1 * fem),
//                         child: Text(
//                           'TUV Pharmacy',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontFamily: 'Quicksand',
//                             fontSize: 16 * ffem,
//                             fontWeight: FontWeight.w700,
//                             height: 1.25 * ffem / fem,
//                             color: Color(0xff000000),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 27 * fem,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   // Navigate to another page when tapped
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AboutPharmacy()),
//                   );
//                 },
//                 child: Container(
//                   // autogroupgagpX4K (KjockFG45Aqo4dGdZVGAGP)
//                   padding:
//                       EdgeInsets.fromLTRB(15 * fem, 6 * fem, 22 * fem, 5 * fem),
//                   width: 320,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: Color(0xffd9d9d9),
//                     borderRadius: BorderRadius.circular(10 * fem),
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         // accountEzK (38:712)
//                         margin: EdgeInsets.fromLTRB(
//                             85 * fem, 0 * fem, 50 * fem, 1 * fem),
//                         child: Text(
//                           'DEF Pharmacy',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontFamily: 'Quicksand',
//                             fontSize: 16 * ffem,
//                             fontWeight: FontWeight.w700,
//                             height: 1.25 * ffem / fem,
//                             color: Color(0xff000000),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ]),
//             Container(
//               // autogroupcsidAFy (GpWypZPNC8wdGxhcobCsiD)
//               width: double.infinity,
//               height: 130 * fem,
//               child: Stack(
//                 children: [
//                   Positioned(
//                     // rectangle97S7 (38:663)
//                     left: 0 * fem,
//                     top: 80 * fem,
//                     child: Align(
//                       child: SizedBox(
//                         width: 390 * fem,
//                         height: 55 * fem,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Color(0xffbbe2ec),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     // homeiconsilhouettefreeiconsdes (38:664)
//                     left: 40 * fem,
//                     top: 88 * fem,
//                     child: Align(
//                       child: GestureDetector(
//                         onTap: () {
//                           // Navigate to another page when tapped
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => HomePage()),
//                           );
//                         },
//                         child: SizedBox(
//                           width: 31 * fem,
//                           height: 32 * fem,
//                           child: Image(
//                             image: AssetImage('lib/images/home.png'),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     // freesearchpngsvgiconremovebgpr (38:665)
//                     left: 135 * fem,
//                     top: 90 * fem,
//                     child: Align(
//                       child: GestureDetector(
//                         onTap: () {
//                           // Navigate to another page when tapped
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => HomePage()),
//                           );
//                         },
//                         child: SizedBox(
//                           width: 37 * fem,
//                           height: 32 * fem,
//                           child: Image(
//                             image: AssetImage('lib/images/search.png'),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     // downloadremovebgpreview1SMu (38:666)
//                     left: 304 * fem,
//                     top: 85 * fem,
//                     child: Align(
//                       child: GestureDetector(
//                         onTap: () {
//                           // Navigate to another page when tapped
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => AccountPage()),
//                           );
//                         },
//                         child: SizedBox(
//                           width: 42 * fem,
//                           height: 43 * fem,
//                           child: Image(
//                             image: AssetImage('lib/images/user.png'),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     // settingiconremovebgpreview1mQB (38:667)
//                     left: 195 * fem,
//                     top: 80 * fem,
//                     child: Align(
//                       child: GestureDetector(
//                         onTap: () {
//                           // Navigate to another page when tapped
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => SettingsPage()),
//                           );
//                         },
//                         child: SizedBox(
//                           width: 96 * fem,
//                           height: 51 * fem,
//                           child: Image(
//                             image: AssetImage('lib/images/settings.png'),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
