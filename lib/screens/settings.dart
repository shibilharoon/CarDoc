import 'package:cardoc/screens/terms&conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class settingsScreen extends StatelessWidget {
  const settingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 106, 21, 21),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 36, 36, 36),
        title: Text('SETTINGS'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Terms(),
                ));
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  child: Center(
                      child: Text(
                    "Terms & Conditions",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  height: 50,
                  width: 150,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                SystemNavigator.pop();
              },
              child: Container(
                child: Center(
                    child: Text(
                  "Exit",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                height: 50,
                width: 150,
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
