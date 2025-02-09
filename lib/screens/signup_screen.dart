import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../widgets/custom_button.dart';
import '../services/secure_storage_service.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}




class _SignupScreenState extends State<SignupScreen> {

  final SecureStorageService _storageService = SecureStorageService();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();


  void _signup() async {


 

    print(_fullNameController.text);	
    print(_phoneController.text);


    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    await _storageService.writeSecureData(
      _emailController.text, 
      _passwordController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Signup successful')),
    );
    
  }

   @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
  

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
                                      controller: _fullNameController,
                                    ),
                                    SizedBox(height: 15),
                                    InputField(
                                      label: 'Phone',
                                      hintText: 'Enter your phone number',
                                      icon: Icons.phone, // Phone icon
                                      controller: _phoneController,
                                    ),
                                    SizedBox(height: 15),
                                    InputField(
                                      label: 'Email',
                                      hintText: 'Enter your email',
                                      icon: Icons.email, // Email icon
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
                                    SizedBox(height: 15),
                                    InputField(
                                      label: 'Confirm Password',
                                      hintText: 'Confirm your password',
                                      obscureText: true,
                                      icon: Icons.lock, // Confirm Password icon
                                      controller: _confirmPasswordController,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              CustomButton(
                                text: 'Sign Up',
                                
                                onPressed: _signup
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