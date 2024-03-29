import 'package:flutter/material.dart';

class PharmacyHome extends StatelessWidget {
  const PharmacyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
          width: double.infinity,
          height: 805,
          decoration: BoxDecoration(
            color: Color(0xffefffff), // background color
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(40, 120, 20, 0),
                child: Row(
                  children: [
                    CircleAvatar(
                      // User Icon
                      backgroundImage: AssetImage(
                          'lib/images/user.png'), // Image
                      radius: 25,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Hello ABC Pharmacy', // User Name
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.fromLTRB(30, 20, 30, 20), //text feild margin
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter medicine name', //placeholder
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                 margin: EdgeInsets.fromLTRB(40, 0, 10, 0),
                child: ElevatedButton(
                  
                    onPressed: () {
                      // Add button functionality 
            
                    },
                    child: Text('Add')),
              ),
                  SizedBox(height: 350),
              Container(
                
                width: double.infinity,
                child: Row( // row to arrange children horizontally
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      width: 385,
                      height: 85,
                      child: Stack(
                        children: [
                          Positioned(
                            
                            left: 0,
                            top: 38,
                            child: Align(
                              child: SizedBox(
                                width: 390,
                                height: 55,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffbbe2ec),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            
                            left: 40,
                            top: 48,
                            child: Align(
                              child: GestureDetector(
                                onTap: () {
                                  print("home icon tapped");
                                  // Perform your action when the settings icon is tapped
                                },
                                child: SizedBox(
                                  width: 31,
                                  height: 32,
                                  child: Image(
                                    image: AssetImage('lib/images/home.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            
                            left: 135,
                            top: 48,
                            child: Align(
                              child: GestureDetector(
                                onTap: () {
                                  print("search icon tapped");
                                  // Perform your action when the settings icon is tapped
                                },
                                child: SizedBox(
                                  width: 37,
                                  height: 32,
                                  child: Image(
                                    image: AssetImage('lib/images/search.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            
                            left: 304,
                            top: 42,
                            child: Align(
                              child: GestureDetector(
                                onTap: () {
                                  print("user icon tapped");
                                  // Perform your action when the settings icon is tapped
                                },
                                child: SizedBox(
                                  width: 42,
                                  height: 43,
                                  child: Image(
                                    image: AssetImage('lib/images/user.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            
                            left: 195,
                            top: 38,
                            child: Align(
                              child: GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  width: 96,
                                  height: 51,
                                  child: Image(
                                    image:
                                        AssetImage('lib/images/settings.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
