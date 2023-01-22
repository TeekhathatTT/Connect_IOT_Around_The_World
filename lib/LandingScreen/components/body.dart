import 'package:flutter/material.dart';
import 'package:appflutter/constant.dart';
import 'package:appflutter/LandingScreen/components/control_button.dart';
import 'package:appflutter/SensorScreen/sensor_screen_light.dart';
import 'package:appflutter/SensorScreen/sensor_screen_sound.dart';
import 'package:appflutter/SensorScreen/sensor_screen_maintenance.dart';

class LandingScreenBody extends StatefulWidget {
  @override
  _LandingScreenBodyState createState() => _LandingScreenBodyState();
}

class _LandingScreenBodyState extends State<LandingScreenBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios, size: 22, color: Colors.grey),
              ),
              Text(
                'Home',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Container(
                height: size.height * 0.045,
                width: size.width * 0.095,
                decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(3, 3),
                      )
                    ]),
                child: InkWell(
                  onTap: () {
                    _showMessageBox(context);
                  },
                  child: Icon(Icons.notifications_none, color: Colors.grey),
                ),
              )
            ],
          ),
          SizedBox(height: size.height * 0.1),
          Center(
            child: Text(
              "Urbasense",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.1),
          Center(
              child: Text(
            "Tap on all that apply. This will help us\ncustomize your home page.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          )),
          SizedBox(height: size.height * 0.1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ControlButton(
                size: size,
                title: 'FeedBack\n',
                icon: Icons.settings,
                nextPage: SensorScreenMain(size: MediaQuery.of(context).size),
              ),
              ControlButton(
                size: size,
                title: 'Light\nControl',
                icon: Icons.lightbulb,
                nextPage: SensorScreenLight(size: MediaQuery.of(context).size),
              ),
              ControlButton(
                size: size,
                title: 'Sound\nControl',
                icon: Icons.music_note,
                nextPage: SensorScreenSound(size: MediaQuery.of(context).size),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
        ],
      ),
    );
  }
}

void _showMessageBox(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Instruction"),
        content: Text(
          "1. send feedback to dev.\n2. set timer to open/close light.\n3. set timer to set volume of the sound.",
           style: TextStyle(
              color: Colors.grey,
        ),),
        actions: [
          FloatingActionButton.small(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      );
    },
  );
}
