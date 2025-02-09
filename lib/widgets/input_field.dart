import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final IconData icon;

  const InputField({
    super.key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.icon = Icons.email, // Default icon
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: Color(0xFFB8860B)), // Set label color to dark gold
          ),
          SizedBox(height: 8.0), // Add some space between the label and the TextField
          TextField(
            obscureText: obscureText,
            style: TextStyle(color: Colors.white), // Set input text color to white
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white), // Set hint text color to white
              prefixIcon: Icon(icon, color: Color(0xFFB8860B)), // Set icon color to gold
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFB8860B)), // Set border color to gold
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFB8860B)), // Set enabled border color to gold
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFB8860B)), // Set focused border color to gold
              ),
            ),
            keyboardType: obscureText ? TextInputType.text: TextInputType.emailAddress, // Set keyboard type to email
          ),
        ],
      ),
    );

    debugPrint('Obscure text: $obscureText');
  }
}
