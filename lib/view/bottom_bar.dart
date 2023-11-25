import 'package:cardoc/controllers/page_provider.dart';
import 'package:cardoc/view/add_customer.dart';
import 'package:cardoc/view/list.dart';
import 'package:cardoc/view/packages.dart';
import 'package:cardoc/view/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key});

  void navigateBottomBar(BuildContext context, int index) {
    Provider.of<PageProvider>(context, listen: false).navigateBottomBar(index);
  }

  final List<Widget> _screens = [
    const Packages(),
    AddCustomer(),
    const ListPage(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
          index: Provider.of<PageProvider>(context, listen: true).selectedIndex,
          children: _screens),
      bottomNavigationBar: Container(
        child: Consumer<PageProvider>(
          builder: (context, value, child) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color.fromARGB(255, 107, 14, 14),
              unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
              currentIndex: value
                  .selectedIndex,
              backgroundColor: Colors.white,
              onTap: (index) => navigateBottomBar(context, index),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_add_rounded), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
              ],
            );
          },
        ),
      ),
    );
  }
}
