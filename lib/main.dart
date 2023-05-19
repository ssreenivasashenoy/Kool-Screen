import 'package:flutter/material.dart';  // Importing the Flutter material package which contains UI components for building apps.
import 'package:kool_screen/views/screens/home.dart';  // Importing a custom screen/widget for the home.

void main() {
  runApp(const MyApp());  // Running the app by calling the main widget MyApp as a top-level widget.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});  // Constructor for the MyApp widget, which extends StatelessWidget.

  @override
  Widget build(BuildContext context) {  // Overriding the build method to build the UI of the app.
    return MaterialApp(  // Creating a MaterialApp, which is a widget that provides common app functionality.
      title: 'Kool Screen',  // Setting the title of the app.
      debugShowCheckedModeBanner: false,  // Disabling the debug banner in the app.
      theme: ThemeData(  // Setting the theme for the app.
        primarySwatch: Colors.blue,  // Choosing a blue color as the primary color theme.
      ),
      home: HomeScreen(),  // Setting the home screen/widget of the app as the HomeScreen widget.
    );
  }
}
