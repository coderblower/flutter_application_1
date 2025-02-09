import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login', // Set the initial screen (e.g., Welcome screen)
      routes: {
        '/': (context) => WelcomeScreen(),  // Welcome screen
        '/login': (context) => LoginScreen(), // Login screen
        '/signup': (context) => SignupScreen(), // Sign-up screen
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
