import 'package:flutter/material.dart';
import 'package:test_app/screens/favoriate.dart';
import 'package:test_app/screens/home.dart';
import 'package:test_app/screens/quran.dart';

class BNavBar extends StatefulWidget {
  const BNavBar({super.key});

  @override
  State<BNavBar> createState() => _BNavBarState();
}

class _BNavBarState extends State<BNavBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [Home(), Quran(), Favoriate()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test App'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.mosque_outlined),
            label: 'Ramzan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
