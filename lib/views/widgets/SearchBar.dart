import 'package:flutter/material.dart';  // Importing the Flutter material package which contains UI components for building apps.
import 'package:flutter/services.dart';  // Importing the Flutter services package which provides access to platform-specific services.
import 'package:kool_screen/views/screens/search.dart';  // Importing a custom screen/widget for the search functionality.

class SearchBar extends StatelessWidget {
  SearchBar({super.key});  // Constructor for the SearchBar widget, which extends StatelessWidget.

  TextEditingController _searchController = TextEditingController();  // Creating a TextEditingController to manage the text input in the search field.

  @override
  Widget build(BuildContext context) {  // Overriding the build method to build the UI of the search bar.
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),  // Setting horizontal padding for the container.
        decoration: BoxDecoration(
            color: Color(0xfff5f8fd),  // Setting the background color of the container.
            border: Border.all(color: Colors.blue),  // Setting a blue border for the container.
            borderRadius: BorderRadius.circular(25)),  // Setting a circular border radius for the container.
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,  // Assigning the TextEditingController to the TextField.
                decoration: InputDecoration(
                  hintText: "Search Wallpapers...",  // Setting a hint text for the search input field.
                  errorBorder: InputBorder.none,  // Removing the border when there's an error.
                  focusedBorder: InputBorder.none,  // Removing the border when the field is focused.
                  focusedErrorBorder: InputBorder.none,  // Removing the border when there's an error and the field is focused.
                  disabledBorder: InputBorder.none,  // Removing the border when the field is disabled.
                  enabledBorder: InputBorder.none,  // Removing the border when the field is enabled.
                  border: InputBorder.none,  // Removing the default border.
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SearchScreen(query: _searchController.text)));  // Navigating to the SearchScreen widget when the search icon is tapped, passing the search query as a parameter.
                },
                child: Icon(Icons.search))  // Adding a search icon as a child of InkWell widget, which enables tapping behavior.
          ],
        ));
  }
}
