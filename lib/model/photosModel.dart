class PhotosModel {
  // Source URL of the image
  String imgSrc;
  // Name of the photo
  String PhotoName;

  // Constructor for the PhotosModel class
  PhotosModel({required this.PhotoName, required this.imgSrc});

  // Factory method to convert API response to PhotosModel object
  static PhotosModel fromAPI2App(Map<String, dynamic> photoMap) {
    return PhotosModel(
        PhotoName: photoMap["photographer"],
        imgSrc: (photoMap["src"])["portrait"]);
  }
}

//Factory Method is referred as a creational design pattern which provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created.