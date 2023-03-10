import 'package:flutter/material.dart';
import 'package:kool_screen_wall/views/widgets/custom_app_bar.dart';
import 'package:kool_screen_wall/views/widgets/search_bar.dart';

import '../widgets/category_block.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: CustomAppBar(title1: 'Kool',title2: ' Screen'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SearchBar()),


            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 30,itemBuilder: ((context, index) => CategoryBlock())),
            )
      ]),
    );
  }
}
