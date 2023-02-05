import 'package:flutter/material.dart';
import 'package:appflutter/constant.dart';
import 'package:appflutter/LandingScreen/components/body.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 231, 243, 249),
              Color.fromARGB(255, 253, 243, 253),
            ],
          ),
        ),
        child: LandingScreenBody(),
      ),
    );
  }
}
