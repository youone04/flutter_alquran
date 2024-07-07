import 'package:alquran/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:alquran/main.dart';
import 'package:get/get.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: themeLight,
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Center(
      child: Text(""),
    ),
    Center(
      child: Text("It's rainy here"),
    ),
    Center(
      child: Text("It's sunny here"),
    ),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_outlined),
            label: 'Al-Quran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.beach_access_sharp),
            label: 'Doa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5_sharp),
            label: 'Sunny',
          ),
        ],
      ),
    );
  }
}
