import 'package:flutter/material.dart';
import 'package:jumia_clone/screens/choose_country_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF68B1E),
        body: SafeArea(
          child: Container(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const ChooseCountryScreen();
                      },
                    ));
                  },
                  child: Image.asset(
                    "assets/images/img_jumia_logo.png",
                    height: 100.0,
                    width: 100.0,
                  ),
                ),
              )),
        ));
  }
}
