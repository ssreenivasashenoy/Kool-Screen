import 'package:flutter/material.dart';

class CategoryBlock extends StatelessWidget {
  const CategoryBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Image.network("https://images.pexels.com/photos/1545743/pexels-photo-1545743.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
    );
  }
}