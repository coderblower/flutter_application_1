import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../widgets/custom_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/background.jpeg'),
                          fit: BoxFit.cover,
                          alignment: Alignment.topLeft,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 60),
                              Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/logo.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    Expanded(
                      child: Container(
                        color: Colors.black, // Set background color to black
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'SIGN UP',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xFFFFD700), // Custom gold color
                                  fontWeight: FontWeight.bold, // Set font weight to bold
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Column(
                                  children: [
                                    InputField(
                                      label: 'Full Name',
                                      hintText: 'Enter your full name',
                                      icon: Icons.person, // Full Name icon
                                    ),
                                    SizedBox(height: 15),
                                    InputField(
                                      label: 'Phone',
                                      hintText: 'Enter your phone number',
                                      icon: Icons.phone, // Phone icon
                                    ),
                                    SizedBox(height: 15),
                                    InputField(
                                      label: 'Email',
                                      hintText: 'Enter your email',
                                      icon: Icons.email, // Email icon
                                    ),
                                    SizedBox(height: 15),
                                    InputField(
                                      label: 'Password',
                                      hintText: 'Enter your password',
                                      obscureText: true,
                                      icon: Icons.lock, // Password icon
                                    ),
                                    SizedBox(height: 15),
                                    InputField(
                                      label: 'Confirm Password',
                                      hintText: 'Confirm your password',
                                      obscureText: true,
                                      icon: Icons.lock, // Confirm Password icon
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              CustomButton(
                                text: 'Sign Up',
                                
                                onPressed: () {
                                  // Handle sign up logic
                                },
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Already have an account?',
                                style: TextStyle(color: Colors.white),
                              ),
                              CustomButton(
                                text: 'Login',
                                
                                onPressed: () {
                                  // Navigate to login screen
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(height: 100),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}