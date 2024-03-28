import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:pharmacy_appnew/pages/services/session_manager.dart';

class CloudFunctions {
  FirebaseFunctions functions = FirebaseFunctions.instance;

  Future<void> sendAvailableMsg({
    required String user_id,
    required String medicineName,
    required String quantity,
    required String reqId,
  }) async {
    try {
      print('Getin message to token');

      //Get user token from the firestore user_id(DocID)
      final DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user_id)
          .get();

      final String token = docSnapshot.get('token');

      print('Token: $token');

      final HttpsCallable callable =
          functions.httpsCallable('sendAvailableMsg');
      final response = await callable.call(<String, dynamic>{
        'medicine_name': medicineName,
        'quantity': quantity,
        'token': token,
        'request_id': reqId,
        'pharmacyID': SessionManager().pharmacyId,
      });

      print('Function response: ${response.data}');
    } on FirebaseFunctionsException catch (e) {
      print('Function exception: ${e.code}\n${e.details}');
    } catch (e) {
      print('General exception: $e');
    }
  }
}
