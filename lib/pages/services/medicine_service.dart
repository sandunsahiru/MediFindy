import 'package:cloud_firestore/cloud_firestore.dart';

class Medicine {
  final String name;
  final String pharmacyId;

  Medicine({required this.name, required this.pharmacyId});

  // Convert a Medicine object into a Map.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'pharmacyID': pharmacyId,
    };
  }

  // A method to create a Medicine object from a map
  static Medicine fromMap(Map<String, dynamic> map) {
    return Medicine(
      name: map['name'],
      pharmacyId: map['pharmacyID'],
    );
  }
}

class MedicineService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Fetches the count of medicines for a specific pharmacy
  Future<int> getMedicineCountByPharmacyId(String pharmacyId) async {
    final querySnapshot = await _db
        .collection('medicines')
        .where('pharmacyID', isEqualTo: pharmacyId)
        .get();
    // Assuming each document contains an array named 'medicine' that holds the medicine details
    int totalCount = 0;
    for (var doc in querySnapshot.docs) {
      var medicinesArray = doc.get('medicine') as List;
      totalCount += medicinesArray.length;
    }
    return totalCount;
  }

  Future<void> addMedicineToPharmacy(String pharmacyId, String medicineName) async {
    final querySnapshot = await _db
        .collection('medicines')
        .where('pharmacyID', isEqualTo: pharmacyId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Document exists for this pharmacyId, so update the existing 'medicine' array
      var doc = querySnapshot.docs.first;
      await _db.collection('medicines').doc(doc.id).update({
        'medicine': FieldValue.arrayUnion([medicineName]) // Add the medicine name directly
      });
    } else {
      // No document exists for this pharmacyId, create a new one with 'medicine' array
      await _db.collection('medicines').add({
        'pharmacyID': pharmacyId,
        'medicine': [medicineName], // Initialize with the medicine name
      });
    }
  }

}
