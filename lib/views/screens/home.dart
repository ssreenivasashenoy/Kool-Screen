import 'package:flutter/material.dart';
import 'package:kool_screen/controller/apiOper.dart';
import 'package:kool_screen/model/categoryModel.dart';
import 'package:kool_screen/model/photosModel.dart';
import 'package:kool_screen/views/screens/FullScreen.dart';
import 'package:kool_screen/views/widgets/CustomAppBar.dart';
import 'package:kool_screen/views/widgets/SearchBar.dart';
import 'package:kool_screen/views/widgets/catBlock.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<PhotosModel> trendingWallList;  // List to store the trending wallpapers.
  late List<CategoryModel> CatModList;  // List to store the category models.
  bool isLoading = true;  // Variable to track whether the data is being loaded or not.

  GetCatDetails() async {
    CatModList = await ApiOperations.getCategoriesList();  // Calling the API operation to retrieve the category models.

    setState(() {
      CatModList = CatModList;  // Updating the CatModList variable with the retrieved category models.
    });
  }

  GetTrendingWallpapers() async {
    trendingWallList = await ApiOperations.getTrendingWallpapers();  // Calling the API operation to retrieve the trending wallpapers.

    setState(() {
      isLoading = false;  // Updating the isLoading variable to indicate that the data has been loaded.
    });
  }

  @override
  void initState() {
    super.initState();
    GetCatDetails();  // Calling the function to retrieve the category models when the screen is initialized.
    GetTrendingWallpapers();  // Calling the function to retrieve the trending wallpapers when the screen is initialized.
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
              child: CircularProgressIndicator(),  // Displaying a loading indicator while the data is being loaded.
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SearchBar(),  // Displaying the search bar widget.
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: CatModList.length,
                        itemBuilder: ((context, index) => CatBlock(
                          categoryImgSrc: CatModList[index].catImgUrl,
                          categoryName: CatModList[index].catName,
                        )),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 700,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                      child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 400,
                          crossAxisCount: 2,
                          crossAxisSpacing: 13,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: trendingWallList.length,
                        itemBuilder: ((context, index) => GridTile(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullScreen(
                                    imgUrl: trendingWallList[index].imgSrc,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: trendingWallList[index].imgSrc,
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
                                    trendingWallList[index].imgSrc,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
