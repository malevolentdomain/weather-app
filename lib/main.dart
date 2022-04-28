import 'package:flutter/material.dart';
import 'package:weatherappv2/screens/blue_screen.dart';
import 'package:weatherappv2/screens/green_screen.dart';
import 'package:weatherappv2/screens/red_screen.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  PageController _pageController = PageController(initialPage: 0);

  final _bottomNavigationBarItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.location_city,
          color: Colors.white,
        ),
        title: Text(
          'Tbilisi',
          style: TextStyle(color: Colors.white),
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.location_city, color: Colors.white),
        title: Text(
          'Marneuli',
          style: TextStyle(color: Colors.white),
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.location_city, color: Colors.white),
        title: Text(
          'Batumi',
          style: TextStyle(color: Colors.white),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        //scrollDirection: Axis.vertical,
        children: [
          BlueScreen(),
          GreenScreen(),
          RedScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _bottomNavigationBarItems,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
        //type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
