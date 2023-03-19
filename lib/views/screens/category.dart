import 'package:flutter/material.dart';
import 'package:kool_screen_wall/views/widgets/custom_app_bar.dart';
import 'package:kool_screen_wall/views/widgets/search_bar.dart';

import '../widgets/category_block.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  "https://images.pexels.com/photos/9754/mountains-clouds-forest-fog.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),

                  Container(
                    height: 150,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black38,
                  ),

                  Positioned(
                    left: 120,
                    top: 40,
                    child: Column(
                      children: [
                        Text("Category",style:TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w300)),
                        Text("Mountains",style:TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600),)
                      ],
                    ),
                  )
              ],
            ),
      
      SizedBox(height: 20,),
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
                  itemBuilder: ((context,index)=> Container(
                  height: 800,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,borderRadius: BorderRadius.circular(20)),

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
