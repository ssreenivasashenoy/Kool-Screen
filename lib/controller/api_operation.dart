import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiOperations {
  static getTrendingWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"), headers: {
      "Authorization":
          "To2ZpCcftuLlLkq4rTYguB7AgBLKBexfltJMe05ew8dBXzlk9SwvxPms"
    }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      photos.forEach((element) {
        Map<String, dynamic> src = element["src"];
        print(src["portrait"]);
      });
    });
  }
}
