import 'package:cardoc/basic.dart';
import 'package:cardoc/premium.dart';
import 'package:cardoc/standard.dart';
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
                    builder: (context) => Basic(),
                  ));
                },
                child: Container(
                  color: Colors.black,
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          "assets/images/medium-shot-man-checking-car.jpg",
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
                    builder: (context) => Standard(),
                  ));
                },
                child: Container(
                  color: Colors.black,
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: .4,
                        child: Image.asset(
                          "assets/images/top-view-man-repairing-car.jpg",
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
                    builder: (context) => Premium(),
                  ));
                },
                child: Container(
                  color: Colors.black,
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          "assets/images/carmech.avif",
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
