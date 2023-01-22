import 'package:flutter/material.dart';
import 'package:appflutter/constant.dart';
import 'package:appflutter/LandingScreen/components/body.dart';


class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 250, 255),
      body: LandingScreenBody(),
    );
  }
}
