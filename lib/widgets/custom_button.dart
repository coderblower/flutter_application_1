import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200, // Set the button to take the full width of its parent
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFFD700), // Set button color to gold
          foregroundColor: Colors.black, // Set text color to black
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
