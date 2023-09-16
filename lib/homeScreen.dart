import 'package:cardoc/Packages.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "assets/images/escalade.jpg",
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
        ),
        Positioned(
          right: 90,
          top: 200,
          child: Column(
            children: [
              const Text(
                "CARDOC",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 63, 63, 63)),
              ),
              const Text(
                "Premium And Prestige Car Service",
                style: TextStyle(color: Color.fromARGB(255, 63, 63, 63)),
              ),
              const SizedBox(
                height: 450,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Packages(),
                  ));
                },
                child: Container(
                  height: 50,
                  width: 150,
                  child: const Center(
                    child: Text(
                      "LETS GO",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 184, 175, 175)),
                    ),
                  ),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(192, 0, 0, 0),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
