import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/account.dart';
import 'package:pharmacy_appnew/pages/services/session_manager.dart';
import 'package:pharmacy_appnew/pages/settings.dart';

// Assuming you have a service to manage medicine operations
import 'package:pharmacy_appnew/pages/services/medicine_service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _medicineNameController = TextEditingController();
  final MedicineService _medicineService = MedicineService();
  int _medicineCount = 0;

  @override
  void initState() {
    super.initState();
    _getMedicineCount();
  }

  Future<void> _getMedicineCount() async {
    final String? pharmacyId = SessionManager().pharmacyId;
    if (pharmacyId != null) {
      final count = await _medicineService.getMedicineCountByPharmacyId(pharmacyId);
      setState(() {
        _medicineCount = count;
      });
    }
  }

  Future<void> _addMedicine() async {
    final String? pharmacyId = SessionManager().pharmacyId;
    if (pharmacyId != null && _medicineNameController.text.isNotEmpty) {
      await _medicineService.addMedicineToPharmacy(pharmacyId, _medicineNameController.text.trim());
      _getMedicineCount(); // Refresh the count after adding
      _medicineNameController.clear(); // Clear the input field
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Medicine Count: $_medicineCount'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _medicineNameController,
                decoration: InputDecoration(
                  labelText: 'New Medicine Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: _addMedicine,
                child: Text('Submit New Medicine'),
              ),
            ),
          ],
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
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => AccountPage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => SettingsPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _medicineNameController.dispose();
    super.dispose();
  }
}
