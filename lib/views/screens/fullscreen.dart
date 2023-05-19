import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

class FullScreen extends StatelessWidget {
  String imgUrl;  // Variable to store the URL of the wallpaper image.

  FullScreen({super.key, required this.imgUrl});  // Constructor for the FullScreen widget, which takes a required parameter for the image URL.

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();  // GlobalKey to access the Scaffold state.

  Future<void> setWallpaperFromFile(String wallpaperUrl, BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Downloading Started...")));  // Displaying a snack bar to indicate that the download has started.

    try {
      var imageId = await ImageDownloader.downloadImage(wallpaperUrl);  // Downloading the image using the provided URL and getting the image ID.
      
      if (imageId == null) {
        return;
      }

      var fileName = await ImageDownloader.findName(imageId);  // Finding the name of the saved image.
      var path = await ImageDownloader.findPath(imageId);  // Finding the path of the saved image.
      var size = await ImageDownloader.findByteSize(imageId);  // Finding the size of the saved image.
      var mimeType = await ImageDownloader.findMimeType(imageId);  // Finding the MIME type of the saved image.

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Downloaded Successfully"),  // Displaying a snack bar to indicate that the download is successful.
        action: SnackBarAction(
          label: "Open",
          onPressed: () {
            OpenFile.open(path);  // Opening the downloaded image file using the OpenFile plugin.
          },
        ),
      ));

      print("IMAGE DOWNLOADED");
    } on PlatformException catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error Occurred - $error")));  // Displaying a snack bar to indicate that an error occurred during the download process.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          await setWallpaperFromFile(imgUrl, context);  // Calling the function to download and set the wallpaper when the button is pressed.
        },
        child: Text("Save Wallpaper"),  // Label for the button.
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imgUrl),  // Displaying the wallpaper image using the provided URL.
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
