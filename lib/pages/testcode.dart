import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/account.dart';
import 'package:pharmacy_appnew/pages/home.dart';
import 'package:pharmacy_appnew/pages/pharmacy_list.dart';
import 'package:pharmacy_appnew/pages/search_medicines.dart';
import 'package:pharmacy_appnew/pages/services/session_manager.dart';
import 'package:pharmacy_appnew/pages/settings.dart';
import 'package:pharmacy_appnew/pages/special_request.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchTextController = TextEditingController();
  String? selectedCity;
  final List<String> cities = [
    'Colombo', 'Kandy', 'Galle', 'Matara', 'Jaffna',
    'Anuradhapura', 'Ratnapura', 'Badulla', 'Trincomalee', 'Kurunegala',
  ];

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final String? userId = SessionManager().userId;
    final String? pharmacyId = SessionManager().pharmacyId;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => SettingsPage()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo and Welcome Text
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('lib/images/logo.png', width: 85, height: 85),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Welcome to Medi Findy!',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFDC5F00),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar and City Selector
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchTextController,
                      decoration: InputDecoration(
                        hintText: 'Search for Medicines...',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  DropdownButton<String>(
                    value: selectedCity,
                    hint: Text("City"),
                    onChanged: (newValue) {
                      setState(() {
                        selectedCity = newValue;
                      });
                    },
                    items: cities.map<DropdownMenuItem<String>>((city) {
                      return DropdownMenuItem(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            // Search Button
            ElevatedButton(
              onPressed: () {
                if (selectedCity == null || searchTextController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select a city and enter a search query.'))
                  );
                  return;
                }
                // Get the userId from SessionManager
                String? userId = SessionManager().userId;

                // Check if a user is logged in; otherwise, do not proceed
                if (userId == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('No user logged in.'))
                  );
                  return;
                }

                // Navigate to the SearchMedicines page with only the userId
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchMedicines(
                      city: selectedCity!,
                      query: searchTextController.text.trim(),
                      userId: userId, // Now only passing the userId
                    ),
                  ),
                );
              },
              child: Text('Search'),
            ),

            // Main Content Grid or List
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: (1 / .9), // Adjust based on your content
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5, // Total number of items
              itemBuilder: (context, index) {
                // Handle your items based on index
                switch (index) {
                  case 0:
                    return _buildGridItem(
                      icon: Icons.store,
                      label: 'Pharmacies',
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PharmacyListPage())),
                    );
                  case 1:
                    return _buildGridItem(
                      icon: Icons.request_page,
                      label: 'Special Requests',
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SpecialRequest())),
                    );
                  case 2:
                    return _buildGridItem(
                      icon: Icons.search,
                      label: 'Search Medicines',
                      onTap: ()
                {
                // Here we include the checks before navigating
                if (selectedCity == null || searchTextController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please select a city and enter a search query.'))
                );
                return;
                }

                // Get the userId from SessionManager
                String? userId = SessionManager().userId;

                // Check if a user is logged in; otherwise, do not proceed
                if (userId == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('No user logged in.'))
                );
                return;
                }


                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchMedicines(
                      city: selectedCity!,
                      query: searchTextController.text.trim(),
                      userId: userId, // Now only passing the userId
                    ),
                  ),
                );
                },
                    );
                  case 3:
                    return _buildGridItemWithImage(
                      imagePath: 'lib/images/benifit.png', // Specify your image path here
                      label: 'Healthy Living',
                      onTap: () => launch('https://www.medicalnewstoday.com/articles/322268'),
                    );
                  case 4:
                    return _buildGridItemWithImage(
                      imagePath: 'lib/images/health.png', // Specify your image path here
                      label: 'One Health Trust',
                      onTap: () => launch('https://onehealthtrust.org/?gad_source=1&gclid=CjwKCAjw48-vBhBbEiwAzqrZVJxVwHGHzoltRU4kpOxmu8y8k01yGqBJSQIXrCgIGWnkyb5or_ENwxoC0L4QAvD_BwE'),
                    );
                  default:
                    return Container(); // Just in case
                }
              },
            ),


            // Additional Content
            // Add any additional content or widgets here

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
  Widget _buildGridItemWithImage({required String imagePath, required String label, required VoidCallback onTap}) {
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
  Widget _buildGridItem({required IconData icon, required String label, required VoidCallback onTap}) {
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
