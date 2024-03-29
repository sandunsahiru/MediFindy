import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pharmacy_appnew/pages/services/session_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewAndRating extends StatefulWidget {
  final String pharmacyId;

  const ReviewAndRating({Key? key, required this.pharmacyId}) : super(key: key);

  @override
  _ReviewAndRatingState createState() => _ReviewAndRatingState();
}

class _ReviewAndRatingState extends State<ReviewAndRating> {
  double _rating = 3;
  String? _comment;
  String? _pharmacyName;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchPharmacyName();
  }

  Future<void> fetchPharmacyName() async {
    try {
      // Search for a document in 'pharmacy_admins' where the field 'pharmacyId' matches the given pharmacy ID
      var pharmacyQuerySnapshot = await FirebaseFirestore.instance
          .collection('pharmacy_admins')
          .where('pharmacyID', isEqualTo: widget.pharmacyId)
          .get();

      if (pharmacyQuerySnapshot.docs.isNotEmpty) {
        // Assuming there is only one pharmacy with this ID
        var pharmacyDoc = pharmacyQuerySnapshot.docs.first;
        setState(() {
          _pharmacyName = pharmacyDoc.data()?['pharmacyName'] as String?;
        });
      } else {
        setState(() {
          _pharmacyName = 'Pharmacy';
        });
        print('Pharmacy with given ID not found');
      }
    } catch (e) {
      print('Error fetching pharmacy details: $e');
    }
  }


  void submitReview() async {
    final String? userId = SessionManager().userId;
    if (userId != null && _comment != null && _comment!.isNotEmpty) {
      await FirebaseFirestore.instance.collection('reviews').add({
        'pharmacyID': widget.pharmacyId,
        'userId': userId,
        'rating': _rating,
        'comment': _comment,
      });
      _controller.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Review submitted successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a comment before submitting.')),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review and Rating'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (_pharmacyName != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  _pharmacyName!,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            Image.asset(
              'lib/images/pharmacy.jpeg', // Image
              width: 130.0,
              height: 130.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RatingBar.builder(
                initialRating: _rating,
                minRating: 1,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Write a review...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                onChanged: (text) {
                  _comment = text;
                },
              ),
            ),
            ElevatedButton(
              onPressed: submitReview,
              child: Text('Submit Review'),
            ),
          ],
        ),
      ),
    );
  }
}
