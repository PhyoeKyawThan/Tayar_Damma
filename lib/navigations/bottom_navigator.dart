import 'package:damma/views/damma_books.dart';
import 'package:damma/views/home_page.dart';
import 'package:flutter/material.dart';

class NavigationController extends StatefulWidget {
  @override
  _NavigationControllerState createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
  bool is_new_user = false;
  int _currentIndex = 0;

  // List of screens for each tab
  final List<Widget> _screens = [
    SingleChildScrollView(
      child: HomePage(),
    ),
    DammBook(),
    Center(child: Text("Audio Screen", style: TextStyle(fontSize: 24))),
    Center(child: Text("Book Marks", style: TextStyle(fontSize: 24))),
    Center(child: Text("Settings", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _currentIndex == 0
            ? Text(
                is_new_user
                    ? "Welcome Damma Friend\n\"May have a great day\""
                    : "Welcome Back Damma Friend\n\"let's keep your mind in peace\"",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.brown[600],
                ),
                softWrap: true,
                overflow: TextOverflow.visible,
              )
            : appBarTitle(_currentIndex),
        centerTitle: true,
      ),
      body: _screens[_currentIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.brown, // Color for the selected icon and label
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Books",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audio_file),
            label: "Audios",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

// app bar title
Text appBarTitle(int current_tab) {
  switch (current_tab) {
    case 1:
      return Text("Damma Books");
    case 2:
      return Text("Damma Audios");
    case 3:
      return Text("Bookmarks");
    case 4:
      return Text("Settings");
    default:
      return Text("Wrong Button");
  }
}
