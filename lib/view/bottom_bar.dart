import 'package:cardoc/view/add_customer.dart';
import 'package:cardoc/view/list.dart';
import 'package:cardoc/view/packages.dart';
import 'package:cardoc/view/settings.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentInex = 0;

  final List<Widget> _screens = [
    const Packages(),
    const AddCustomer(),
    const ListPage(),
    const SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentInex, children: _screens),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromARGB(255, 107, 14, 14),
          unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
          currentIndex: _currentInex,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              _currentInex = index;
            });
          },
          items: const [
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
