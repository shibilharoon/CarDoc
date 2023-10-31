import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final name;
  final phone;
  final date;
  final carnumber;
  final carmodel;

  const Profile({
    required this.name,
    required this.phone,
    required this.date,
    required this.carmodel,
    required this.carnumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "P R O F I L E",
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 36, 36, 36),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  "CARDOC",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 63, 63, 63)),
                ),
              ),
              const Text(
                "Premium And Prestige Car Service",
                style: TextStyle(color: Color.fromARGB(255, 63, 63, 63)),
              ),
              SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      CardItem(
                        title: 'NAME',
                        content: name,
                        isAlternate: false,
                      ),
                      CardItem(
                        title: 'PHONE',
                        content: phone,
                        isAlternate: true,
                      ),
                      CardItem(
                        title: 'DATE',
                        content: date,
                        isAlternate: false,
                      ),
                      CardItem(
                        title: 'CAR NUMBER',
                        content: carnumber,
                        isAlternate: true,
                      ),
                      CardItem(
                        title: 'CAR MODEL',
                        content: carmodel,
                        isAlternate: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String content;
  final bool isAlternate;

  const CardItem({
    required this.title,
    required this.content,
    required this.isAlternate,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor =
        isAlternate ? Colors.white : const Color.fromARGB(255, 0, 0, 0);
    final textColor =
        isAlternate ? const Color.fromARGB(255, 0, 0, 0) : Colors.white;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: bgColor,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: 90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
