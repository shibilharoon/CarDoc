import 'package:cardoc/addcustomer.dart';
import 'package:flutter/material.dart';

class Standard extends StatelessWidget {
  const Standard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            " S T A N D A R D    S E R V I C E",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.grey,
        ),
        body: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child: Image.asset("assets/images/image 333.png"),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(35.0),
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
                                  color: Colors.black, // Shadow color
                                  offset: Offset(2,
                                      1), // Horizontal and vertical offset of the shadow
                                  blurRadius: 2, // Radius of the shadow blur
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
                  height: 500,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: Center(
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
                      )
                    ],
                  ),
                  height: 380,
                  width: 400,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 30, 30, 30),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                ),
              ],
            ),
            Positioned(
              right: 30,
              top: 255,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddCustomer(),
                  ));
                },
                child: Card(
                  elevation: 15,
                  child: Container(
                    height: 50,
                    width: 150,
                    child: const Center(
                      child: Text(
                        "LETS GO",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
