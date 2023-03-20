import 'package:flutter/material.dart';
import 'package:kool_screen_wall/controller/api_operation.dart';
import 'package:kool_screen_wall/views/widgets/custom_app_bar.dart';
import 'package:kool_screen_wall/views/widgets/search_bar.dart';

import '../widgets/category_block.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ApiOperations.getTrendingWallpapers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: CustomAppBar(title1: 'Kool', title2: ' Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SearchBar()),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 30,
                    itemBuilder: ((context, index) => CategoryBlock())),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 400,
                    crossAxisCount: 2,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 16,
                  itemBuilder: ((context, index) => Container(
                        height: 800,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                              height: 800,
                              width: 50,
                              fit: BoxFit.cover,
                              "https://images.pexels.com/photos/13415959/pexels-photo-13415959.jpeg"),
                        ),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
