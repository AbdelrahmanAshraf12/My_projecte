import 'package:flutter/material.dart';
import 'Home.dart';
import 'ProfileScreen.dart';
import 'Search.dart';
import 'cardScreen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selected = 0;
  final List<Widget> pageList = [
    HomeScreen(), // Home screen
    SearchScreen(), // Add actual screen here for Search
    CardScreen(), // Add actual screen here for Cart
    ProfileScreen(), // Add actual screen here for Profile or other screen
  ];

  void selectPage(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selected], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected, // Set the index of the selected item
        onTap: selectPage, // Change the page when an item is tapped
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue, // Set the color for the selected item
        unselectedItemColor:
            Colors.grey, // Set the color for the unselected items
      ),
    );
  }
}
