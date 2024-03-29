import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/pharmacy/account.dart';
import 'package:pharmacy_appnew/pages/services/session_manager.dart';
import 'package:pharmacy_appnew/pages/pharmacy/settings.dart';
import 'package:pharmacy_appnew/pages/services/medicine_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pharmacy_appnew/pages/pharmacy_list.dart';
import 'package:pharmacy_appnew/pages/special_request.dart';

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
      final count =
      await _medicineService.getMedicineCountByPharmacyId(pharmacyId);
      setState(() {
        _medicineCount = count;
      });
    }
  }

  Future<void> _addMedicine() async {
    final String? pharmacyId = SessionManager().pharmacyId;
    if (pharmacyId != null && _medicineNameController.text.isNotEmpty) {
      await _medicineService.addMedicineToPharmacy(
          pharmacyId, _medicineNameController.text.trim());
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
            SizedBox(
              height:
              400, // Set a height for the GridView to avoid layout issues
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: (1 / .9),
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:
                  4, // Adjust based on the items you have; it was 5 initially
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return _buildGridItemWithImage(
                          imagePath: 'lib/images/benifit.png',
                          label: 'Healthy Living',
                          onTap: () => launch(
                              'https://www.medicalnewstoday.com/articles/322268'),
                        );
                      case 1:
                        return _buildGridItemWithImage(
                          imagePath: 'lib/images/health.png',
                          label: 'One Health Trust',
                          onTap: () => launch(
                              'https://onehealthtrust.org/?gad_source=1&gclid=CjwKCAjw48-vBhBbEiwAzqrZVJxVwHGHzoltRU4kpOxmu8y8k01yGqBJSQIXrCgIGWnkyb5or_ENwxoC0L4QAvD_BwE'),
                        );
                      default:
                        return Container();
                    }
                  }
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
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => PharmacyAccountPage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {

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

  @override
  void dispose() {
    _medicineNameController.dispose();
    super.dispose();
  }

  Widget _buildGridItemWithImage(
      {required String imagePath,
        required String label,
        required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(
      {required IconData icon,
        required String label,
        required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 50),
            Text(label),
          ],
        ),
      ),
    );
  }
}
