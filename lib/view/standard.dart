import 'package:flutter/material.dart';

class Standard extends StatelessWidget {
  const Standard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "S T A N D A R D   S E R V I C E",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          backgroundColor: const Color.fromARGB(255, 36, 36, 36),
          actions: const [],
        ),
        body: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: Image.asset("assets/images/image 333.png"),
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
                            "\$100.00",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(2, 1),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Est.time : 6hr",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(1, 1),
                                  blurRadius: 1,
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
                          height: 40,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text(
                              "What Includes?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Column(
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
                            Text(
                              " > Wheel balancing",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              " > Wheel alignment",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ],
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
                    "STANDARD",
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
