import 'package:cardoc/view/terms&conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 29, 29),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 36, 36, 36),
        title: const Text('SETTINGS'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Terms(),
              ));
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: const Center(                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
                    child: Text(
                  "Terms & Conditions",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              SystemNavigator.pop();
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: const Center(
                  child: Text(
                "Exit",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
