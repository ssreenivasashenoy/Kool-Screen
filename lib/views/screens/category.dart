import 'package:flutter/material.dart';
import 'package:kool_screen/controller/apiOper.dart';
import 'package:kool_screen/model/photosModel.dart';
import 'package:kool_screen/views/screens/FullScreen.dart';
import 'package:kool_screen/views/widgets/CustomAppBar.dart';
import 'package:kool_screen/views/widgets/SearchBar.dart';
import 'package:kool_screen/views/widgets/catBlock.dart';

class CategoryScreen extends StatefulWidget {
  String catName;  // Variable to store the category name.
  String catImgUrl;  // Variable to store the category image URL.

  CategoryScreen({super.key, required this.catImgUrl, required this.catName});  // Constructor for the CategoryScreen widget, which takes two required parameters.

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late List<PhotosModel> categoryResults;  // List to store the results of category-related wallpapers.
  bool isLoading = true;  // Boolean variable to track the loading state.

  GetCatRelWall() async {
    categoryResults = await ApiOperations.searchWallpapers(widget.catName);  // Fetching the category-related wallpapers using the provided category name.

    setState(() {
      isLoading = false;  // Updating the loading state to indicate that the results are fetched.
    });
  }

  @override
  void initState() {
    GetCatRelWall();  // Calling the function to fetch category-related wallpapers when the screen is initialized.
    super.initState();
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
        ),  // Custom app bar widget with the title "Kool Screen".
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),  // Displaying a loading indicator if the results are still loading.
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.network(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          widget.catImgUrl),  // Displaying the category image using the provided URL.
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black38,  // Adding a translucent overlay color to the category image.
                      ),
                      Positioned(
                        left: 120,
                        top: 40,
                        child: Column(
                          children: [
                            Text(
                              "Category",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              widget.catName,  // Displaying the category name.
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 700,
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 400,
                        crossAxisCount: 2,
                        crossAxisSpacing: 13,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: categoryResults.length,
                      itemBuilder: (
                        (context, index) => GridTile(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullScreen(
                                      imgUrl:
                                          categoryResults[index].imgSrc),  // Passing the image URL of the selected wallpaper to the FullScreen widget.
                                ),
                              );
                            },
                            child: Hero(
                              tag: categoryResults[index].imgSrc,
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
                                    categoryResults[index].imgSrc,  // Displaying the wallpaper image using the provided URL.
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
