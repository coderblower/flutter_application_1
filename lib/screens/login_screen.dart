import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../widgets/custom_button.dart';
import 'signup_screen.dart';
import '../services/secure_storage_service.dart';
import 'welcome_screen.dart';	



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {

  final SecureStorageService _secureStorageService = SecureStorageService();    
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



  void _login() async {
    String? storedPassword = await _secureStorageService.readSecureData(_emailController.text);
    if (storedPassword == _passwordController.text) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid email or password')),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              SizedBox(height: 100),
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
                              SizedBox(height: 30),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 30),
                              Text(
                                'LOG IN',
                                style: TextStyle(fontSize: 24, color: Color(0xFFFFD700), fontWeight: FontWeight.bold),  
                                 // Custom gold color
                              ),
                              
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Column(
                                  children: [
                                    InputField(
                                      label: 'Email',
                                      hintText: 'Enter your emails',
                                      obscureText: false,
                                      icon: Icons.lock, // Password icon
                                      controller: _emailController,
                                    ),
                                    SizedBox(height: 15),
                                    InputField(
                                      label: 'Password',
                                      hintText: 'Enter your password',
                                      obscureText: true,
                                      icon: Icons.lock, // Password icon
                                      controller: _passwordController,
                                    ),
                                  
                                  

                                  ],
                                ),
                              ),
                              SizedBox(height: 30),
                             
                             //Column
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                    text: 'Login',
                                    onPressed: _login,
                                      // Handle login logic
                                      
                                    
                                  ),

                                  SizedBox(height: 20),
                                  Text(
                                    'Don\'t have an account?',
                                    style: TextStyle(color: Colors.white),
                                  ),

                                  CustomButton(
                                    text: 'Sign Up',
                                    onPressed: () {
                                      // Navigate to sign-up screen
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignupScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),

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
