import 'package:flutter/material.dart';
import 'package:kool_screen/views/screens/category.dart';

class CatBlock extends StatelessWidget {
  String categoryName;  // Variable to store the category name.
  String categoryImgSrc;  // Variable to store the category image source URL.

  CatBlock({
    super.key,
    required this.categoryImgSrc,
    required this.categoryName,
  });  // Constructor for the CatBlock widget, which takes two required parameters.

  @override
  Widget build(BuildContext context) {  // Overriding the build method to build the UI of the category block.
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(
              catImgUrl: categoryImgSrc,  // Passing the category image URL to the CategoryScreen widget.
              catName: categoryName,  // Passing the category name to the CategoryScreen widget.
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 7),  // Setting horizontal margin for the container.
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),  // Applying a circular border radius to the image.
              child: Image.network(
                height: 50,
                width: 100,
                fit: BoxFit.cover,
                categoryImgSrc,  // Displaying the category image using the provided source URL.
              ),
            ),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(12),  // Applying a circular border radius to the container.
              ),
            ),
            Positioned(
              left: 30,
              top: 15,
              child: Text(
                categoryName,  // Displaying the category name.
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
