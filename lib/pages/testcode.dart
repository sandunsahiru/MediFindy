import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/account.dart';
import 'package:pharmacy_appnew/pages/home.dart';
import 'package:pharmacy_appnew/pages/reviews_and_rating.dart';
import 'package:pharmacy_appnew/pages/settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacy_appnew/pages/services/session_manager.dart';

class AboutPharmacy extends StatefulWidget {
  final String pharmacyId;

  const AboutPharmacy({Key? key, required this.pharmacyId}) : super(key: key);

  @override
  _AboutPharmacyState createState() => _AboutPharmacyState();
}

class _AboutPharmacyState extends State<AboutPharmacy> {
  Map<String, dynamic>? pharmacyDetails;
  List<Map<String, dynamic>> reviews = [];

  @override
  void initState() {
    super.initState();
    fetchPharmacyDetails();
    fetchReviews();
  }

  Future<void> fetchPharmacyDetails() async {
    // Query the pharmacy_admins collection for the document(s) with the matching pharmacyId field
    var querySnapshot = await FirebaseFirestore.instance
        .collection('pharmacy_admins')
        .where('pharmacyId',
        isEqualTo: widget.pharmacyId) // Assume pharmacyId is a field within the documents
        .get();

    // Check if we have at least one matching document
    if (querySnapshot.docs.isNotEmpty) {
      // For simplicity, we're taking the first matching document
      var pharmacyData = querySnapshot.docs.first;
      setState(() {
        pharmacyDetails = pharmacyData.data();
      });
    }
  }

  Future<void> fetchReviews() async {
    // Get the reviews from Firestore
    var reviewsSnapshot = await FirebaseFirestore.instance
        .collection('reviews')
        .where('pharmacyId', isEqualTo: widget.pharmacyId)
        .get();

    List<Map<String, dynamic>> loadedReviews = [];

    for (var reviewDoc in reviewsSnapshot.docs) {
      var userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(reviewDoc.data()['userId'])
          .get();

      if (userData.exists) {
        loadedReviews.add({
          "userName": userData.data()?['name'] ?? 'Anonymous',
          "userEmail": userData.data()?['email'] ?? 'No email provided',
          "comment": reviewDoc.data()['comment'],
          "rating": reviewDoc.data()['rating'],
          // Add any additional fields you need from the review document
        });
      }
    }

    setState(() {
      reviews = loadedReviews;
    });
  }

  @override
  Widget build(BuildContext context) {
    double fem = 1; // Adjust as per your scaling factor
    double ffem = 1; // Adjust as per your font scaling factor

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
                margin: EdgeInsets.fromLTRB(0, 30 * fem, 0, 31 * fem),
                padding: EdgeInsets.fromLTRB(34 * fem, 4 * fem, 114 * fem, 4 * fem),
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xff000000)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24 * ffem, // Adjust the size factor according to your design
                      ),
                    ),
                    Text(
                      'About Pharmacy',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffffffff),
                      ),
                    ),
                    Opacity(
                      opacity: 0,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24 * ffem,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // klmpharmacyvbZ (30:475)
                margin:
                EdgeInsets.fromLTRB(5 * fem, 0 * fem, 16 * fem, 0 * fem),
                child: Text(
                  pharmacyDetails != null
                      ? pharmacyDetails!['pharmacyName']
                      : 'Loading...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 20 * ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.25 * ffem / fem,
                    color: Color(0xff1e5128),
                  ),
                ),
              ),

              Container(
                // freevectorpharmacist18hd (30:476)
                margin:
                EdgeInsets.fromLTRB(0 * fem, 10 * fem, 7 * fem, 10 * fem),
                width: 152 * fem,
                height: 132 * fem,
                child: Image(
                  image: AssetImage('lib/images/pharmacy.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              // Dynamic section for displaying pharmacy details
              if (pharmacyDetails != null)
                Container(
                    margin: EdgeInsets.all(10 * fem),
                    padding: EdgeInsets.all(10 * fem),
                    decoration: BoxDecoration(
                      color: Color(0xffc1f2b0),
                      borderRadius: BorderRadius.circular(5 * fem),
                    ),
                    child: Column(
                      children: [
                        Text(pharmacyDetails?['pharmacyName'] ?? 'Pharmacy Name',
                            style: TextStyle(
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text('${pharmacyDetails?['addressLine1'] ?? 'Address'}, ${pharmacyDetails?['addressLine2'] ?? ''}',
                            style: TextStyle(fontSize: 14 * ffem)),
                        SizedBox(height: 5),
                        Text('City: ${pharmacyDetails?['city'] ?? 'N/A'}',
                            style: TextStyle(fontSize: 14 * ffem)),
                        SizedBox(height: 5),
                        Text('District: ${pharmacyDetails?['district'] ?? 'N/A'}',
                            style: TextStyle(fontSize: 14 * ffem)),
                        SizedBox(height: 5),
                        Text('Email: ${pharmacyDetails?['email'] ?? 'N/A'}',
                            style: TextStyle(fontSize: 14 * ffem)),
                      ],
                    )

                ),

              // Dynamic section for displaying reviews
              reviews.isNotEmpty
                  ? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(reviews[index]['userName']),
                      subtitle: Text(reviews[index]['comment']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(5, (starIndex) {
                          return Icon(
                            Icons.star,
                            color: starIndex < reviews[index]['rating']
                                ? Colors.amber
                                : Colors.grey,
                          );
                        }),
                      ),
                    ),
                  );
                },
              )
                  : Center(child: Text('No reviews yet')),

              GestureDetector(
                onTap: () {
                  // Navigate to another page when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReviewAndRating()),
                  );
                },
                child: Container(
                  // autogroup24nqHaP (GpWtf89y2TEXGmRCzW24Nq)
                  margin: EdgeInsets.fromLTRB(
                      35 * fem, 10 * fem, 34 * fem, 0 * fem),
                  width: 300,
                  height: 29 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xffffcad4),
                    borderRadius: BorderRadius.circular(9 * fem),
                  ),
                  child: Center(
                    child: Text(
                      'Rate & Review Your Experience!',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 15 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff000000),
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
