import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_appnew/pages/sign_in_sign_up_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
      {
        debugPrint('Notifications are allowed');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(bottom: 40), 
        width: width, 
        height: height, 
        decoration: const BoxDecoration(
          color: Color(0xffefffff),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, 4),
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.05), 
            Container(
              margin: const EdgeInsets.only(
                  right: 1), 
              width: width * 0.8, 
              height: height * 0.3, 
              child: const Image(
                image: AssetImage('lib/images/logo.png'),// images
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: height * 0.01, bottom: height * 0.07), 
              constraints: BoxConstraints(
                maxWidth: width * 0.6, 
              ),
              child: const Text(
                'Welcome to Medi Findy!\n\nYour one-stop solution for finding medicines and pharmacies with ease. \nSearch, discover, and connect seamlessly. Get the medicines you need, when you need them.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 14, 
                  fontWeight: FontWeight.bold,
                  color: Color(0xff095062),
                ),
              ),
            ),
            _buildActionButton(
                context, 'Log In', height * 0.04, width), 
            _buildActionButton(
                context, 'Sign Up', height * 0.04, width), 
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
      BuildContext context, String title, double height, double width) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignInSignUpPage()),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: height * 0.02,
            horizontal: width * 0.35), 
        width: double.infinity,
        height: height, 
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff000000)),
          color: const Color(0xff7bd3ea),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff0e185f),
            ),
          ),
        ),
      ),
    );
  }
}
