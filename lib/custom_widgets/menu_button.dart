
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget{
  MenuButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed
});
  String text;
  IconData icon;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 2.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Color.fromARGB(255, 0, 42, 255), // Azul Monlau
        foregroundColor: Colors.white, // Texto blanco

        minimumSize: Size( screenWidth/3,screenHeight/8),
        maximumSize: Size( screenWidth/3,screenHeight/8)

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: screenHeight * 0.04),
          SizedBox(height: screenHeight * 0.01),
          Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: screenHeight * 0.018),),
        ],
      ),
    );
  }
}