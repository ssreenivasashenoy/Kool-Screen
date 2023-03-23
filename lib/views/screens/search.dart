import 'package:flutter/material.dart';
import 'package:kool_screen_wall/controller/api_operation.dart';
import 'package:kool_screen_wall/model/photos_model.dart';
import 'package:kool_screen_wall/views/widgets/custom_app_bar.dart';
import 'package:kool_screen_wall/views/widgets/search_bar.dart';

import '../widgets/category_block.dart';

class SearchScreen extends StatefulWidget {
  String query;
  SearchScreen({super.key, required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<PhotosModel> searchResults=[];

  GetSearchResults() async {
    searchResults = await ApiOperations.searchWallpapers(widget.query);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    GetSearchResults();
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
                SizedBox(height: 10,),
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
                  itemCount: searchResults.length,
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
                              searchResults[index].imgSrc),
                        ),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
