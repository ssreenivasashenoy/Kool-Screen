import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kool_screen/model/categoryModel.dart';
import 'package:kool_screen/model/photosModel.dart';

import 'dart:math';

class ApiOperations {
  // List to store trending wallpapers
  static List<PhotosModel> trendingWallpapers = [];
  // List to store search wallpapers
  static List<PhotosModel> searchWallpapersList = [];
  // List to store category models
  static List<CategoryModel> categoryModelList = [];

  // Pexels API key
  static String _apiKey = "To2ZpCcftuLlLkq4rTYguB7AgBLKBexfltJMe05ew8dBXzlk9SwvxPms";

  // Method to get trending wallpapers
  static Future<List<PhotosModel>> getTrendingWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"), headers: {"Authorization": "$_apiKey"}).then((value) {
      print("RESPONSE REPORT");
      print(value.body);
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      photos.forEach((element) {
        trendingWallpapers.add(PhotosModel.fromAPI2App(element));
      });
    });

    return trendingWallpapers;
  }

  // Method to search wallpapers based on a query
  static Future<List<PhotosModel>> searchWallpapers(String query) async {
    await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"), headers: {"Authorization": "$_apiKey"}).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      searchWallpapersList.clear();
      photos.forEach((element) {
        searchWallpapersList.add(PhotosModel.fromAPI2App(element));
      });
    });

    return searchWallpapersList;
  }

  // Method to get a list of categories
  static List<CategoryModel> getCategoriesList() {
    List categoryName = [
      "Cars",
      "Nature",
      "Bikes",
      "Street",
      "City",
      "Flowers",
      "Food",
      "Sky",
      "Dark",
      "Business",
      "Travel",
      "Cartoon",
      "Space",
      "Sunset",
      "Tower",
      "Mountains",
      "Computer",
      "Trains",
      "India",
      "America",
    ];
    categoryModelList.clear();
    categoryName.forEach((catName) async {
      final _random = new Random();

      // Get a random photo for each category
      PhotosModel photoModel = (await searchWallpapers(catName))[0 + _random.nextInt(11 - 0)];
      print("IMG SRC IS HERE");
      print(photoModel.imgSrc);
      categoryModelList.add(CategoryModel(catImgUrl: photoModel.imgSrc, catName: catName));
    });

    return categoryModelList;
  }
}
