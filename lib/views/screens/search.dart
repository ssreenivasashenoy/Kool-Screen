import 'package:flutter/material.dart';
import 'package:kool_screen/controller/apiOper.dart';
import 'package:kool_screen/model/photosModel.dart';
import 'package:kool_screen/views/screens/FullScreen.dart';
import 'package:kool_screen/views/widgets/CustomAppBar.dart';
import 'package:kool_screen/views/widgets/SearchBar.dart';
import 'package:kool_screen/views/widgets/catBlock.dart';

class SearchScreen extends StatefulWidget {
  String query;  // Variable to store the search query entered by the user.

  SearchScreen({super.key, required this.query});  // Constructor for the SearchScreen widget, which takes a required parameter for the search query.

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<PhotosModel> searchResults;  // List to store the search results.
  bool isLoading = true;  // Variable to track whether the search results are being loaded or not.

  GetSearchResults() async {
    searchResults = await ApiOperations.searchWallpapers(widget.query);  // Calling the API operation to retrieve the search results using the provided search query.

    setState(() {
      isLoading = false;  // Updating the isLoading variable to indicate that the search results have been loaded.
    });
  }

  @override
  void initState() {
    super.initState();
    GetSearchResults();  // Calling the function to retrieve the search results when the screen is initialized.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: CustomAppBar(
          word1: "Kool",
          word2: "Screen",
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),  // Displaying a loading indicator while the search results are being loaded.
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SearchBar(),  // Displaying the search bar widget.
                  ),
                  SizedBox(
                    height: 10,
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
                      itemCount: searchResults.length,
                      itemBuilder: ((context, index) => GridTile(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FullScreen(
                                  imgUrl: searchResults[index].imgSrc,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: searchResults[index].imgSrc,
                            child: Container(
                              height: 800,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  height: 800,
                                  width: 50,
                                  fit: BoxFit.cover,
                                  searchResults[index].imgSrc,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
