import 'package:cardoc/view/basic.dart';
import 'package:cardoc/view/premium.dart';
import 'package:cardoc/view/standard.dart';

import 'package:flutter/material.dart';

class Packages extends StatelessWidget {
  const Packages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Basic(),
                  ));
                },
                child: Container(
                  color: Colors.black,
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          "assets/images/pexels-hebert-santos-3757226.jpg",
                          height: MediaQuery.of(context).size.height,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Center(
                        child: Text(
                          "BASIC SERVICE",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Standard(),
                  ));
                },
                child: Container(
                  color: Colors.black,
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: .4,
                        child: Image.asset(
                          "assets/images/pexels-hebert-santos-3757226.jpg",
                          height: MediaQuery.of(context).size.height,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Center(
                        child: Text(
                          "STANDARD SERVICE",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Premium(),
                  ));
                },
                child: Container(
                  color: Colors.black,
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          "assets/images/pexels-hebert-santos-3757226.jpg",
                          height: MediaQuery.of(context).size.height,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Center(
                        child: Text(
                          "PREMIUM SERVICE",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
