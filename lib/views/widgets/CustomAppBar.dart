import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  String word1;  // Variable to store the first word.
  String word2;  // Variable to store the second word.

  CustomAppBar({super.key, required this.word1, required this.word2});  // Constructor for the CustomAppBar widget, which takes two required parameters.

  @override
  Widget build(BuildContext context) {  // Overriding the build method to build the UI of the custom app bar.
    return Container(
      child: RichText(
        textAlign: TextAlign.center,  // Setting the text alignment to center.
        text: TextSpan(
          text: word1,  // Displaying the value of the first word variable.
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w600,
            fontFamily: 'Overpass',
          ),
          children: [
            TextSpan(
              text: " $word2",  // Displaying the value of the second word variable with a space.
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25,
                fontWeight: FontWeight.w600,
                fontFamily: 'Overpass',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
