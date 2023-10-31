import 'package:cardoc/db/functions/db_functions.dart';
import 'package:cardoc/screens/add_customer.dart';
import 'package:cardoc/screens/home_screen.dart';
import 'package:cardoc/screens/list.dart';
import 'package:cardoc/screens/packages.dart';
import 'package:cardoc/screens/settings.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentInex = 0;

  final List<Widget> _screens = [
    Packages(),
    AddCustomer(),
    ListPage(),
    settingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentInex],
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          currentIndex: _currentInex,
          backgroundColor: Color.fromARGB(255, 106, 21, 21),
          onTap: (index) {
            setState(() {
              _currentInex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_add_rounded), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
        ),
      ),
    );
  }
}
