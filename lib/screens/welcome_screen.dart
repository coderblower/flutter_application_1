import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../models/user.dart';
import '../widgets/custom_button.dart';
import '../services/secure_storage_service.dart';

class WelcomeScreen extends StatelessWidget {
  
  final User user;
  final SecureStorageService _storageService = SecureStorageService();

  WelcomeScreen({super.key, required this.user});


  void _logout(BuildContext context) async {
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        title: Text('Welcome'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpeg'),
                  fit: BoxFit.cover, // Change fit to none
                  alignment: Alignment.topLeft, // Align to top-left corner
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 100),
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'),
                            fit: BoxFit.cover,
                          ),
                          // color: Colors.blue, // Background color in case image doesn't load
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.black, // Set background color to black
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 100),
                        Text(
                              'Welcome ${user.fullName} to ',
                          style: TextStyle(fontSize: 24, color: Color(0xFFFFD700)), // Custom gold color
                        ),
                        SizedBox(height: 5),

                         Text(
                              'HelloSuper stars Family!',
                          style: TextStyle(fontSize: 24, color: Color(0xFFFFD700)), // Custom gold color
                        ),
                        SizedBox(height: 20),
                        


                        CustomButton(
                          text: 'Log Out',
                          onPressed: ()=> _logout(context),
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
