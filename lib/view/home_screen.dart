import 'package:flutter/material.dart';
import 'bottom_bar.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/escalade.jpg',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: 150,
            bottom: 100,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BottomBar(),
                  ));
                },
                child: Text("Get Started")),
          )
        ],
      ),
    );
  }
}
