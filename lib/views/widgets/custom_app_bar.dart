import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  String title1;
  String title2;
  CustomAppBar({super.key,
  
  required this.title1,
  required this.title2});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: title1,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: title2,
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
      ),
    );
  }
}
