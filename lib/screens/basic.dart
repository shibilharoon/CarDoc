// ignore_for_file: sort_child_properties_last

import 'package:cardoc/screens/add_customer.dart';
import 'package:cardoc/screens/list.dart';
import 'package:flutter/material.dart';

class Basic extends StatelessWidget {
  const Basic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "B A S I C   S E R V I C E",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          backgroundColor: const Color.fromARGB(255, 36, 36, 36),
          actions: [],
        ),
        body: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child: Image.asset("assets/images/image 33.png"),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 500,
                  width: 400,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: const Padding(
                    padding: EdgeInsets.all(35.0),
                    child: Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\$50.00",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black, // Shadow color
                                  offset: Offset(2,
                                      1), // Horizontal and vertical offset of the shadow
                                  blurRadius: 2, // Radius of the shadow blur
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Est.time : 3hr",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black, // Shadow color
                                  offset: Offset(1,
                                      1), // Horizontal and vertical offset of the shadow
                                  blurRadius: 1, // Radius of the shadow blur
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 380,
                  width: 400,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 30, 30, 30),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          child: const Center(
                            child: Text(
                              "What Includes?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          height: 40,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: const Column(
                            children: [
                              Text(
                                " > Engine Oil Replacement",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                " > Oil   Filter  Replacement",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                " > Air Filter    Replacement",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                " > Coolant Top Up(200ml)",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                " > Heater /Spark plugs checking",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                " > Battery water topup",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                " > Car wash",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                " > Interior vaccuming",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                height: 50,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 260,
              left: 200,
              child: Container(
                height: 50,
                width: 150,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Center(
                  child: Text(
                    "BASIC",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
