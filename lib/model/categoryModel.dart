class CategoryModel {
  // Name of the category
  String catName;
  // URL of the category image
  String catImgUrl;

  // Constructor for the CategoryModel class
  CategoryModel({required this.catImgUrl, required this.catName});

  // Factory method to convert API response to CategoryModel object
  static CategoryModel fromApi2App(Map<String, dynamic> category) {
    return CategoryModel(
        catImgUrl: category["imgUrl"], catName: category["CategoryName"]);
  }
}
