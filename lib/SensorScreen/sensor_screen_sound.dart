import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

class SensorScreenSound extends StatefulWidget {
  final Size size;
  SensorScreenSound({required this.size});

  @override
  _SensorScreenSoundState createState() => _SensorScreenSoundState();
}

class _SensorScreenSoundState extends State<SensorScreenSound> {
  late int _randomNumber;
  late int _randomNumberHours;
  late int _randomNumberMins;
  late String _randomText;
  final _random = Random();
  final _texts = ["AM", "PM"];
  @override
  void initState() {
    super.initState();
    _generateRandomValues();
   
    Timer.periodic(Duration(seconds: 10), (_) {
      setState(() {
        _generateRandomValues();
      });
    });
  }

  void _generateRandomValues() {
    _randomNumberHours = _random.nextInt(11) + 1;
    _randomNumberMins = _random.nextInt(59);
    _randomNumber = _random.nextInt(100);
    _randomText = _texts[_random.nextInt(_texts.length)];
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 231, 243, 249),
            Color.fromARGB(255, 253, 243, 253),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Column(children: [
          SizedBox(height: widget.size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios, size: 22, color: Colors.grey),
              ),
              Container(
                height: widget.size.height * 0.045,
                width: widget.size.width * 0.095,
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
          Column(
            children: [
              SizedBox(height: widget.size.height * 0.1),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(10, 10),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Center(
                    child: Text('06:15 AM Volume: 45%',
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 25))),
              ),
              SizedBox(height: widget.size.height * 0.1),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(10, 10),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Center(
                    child: Text('12:30 PM Volume: 15%',
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 25))),
              ),
              SizedBox(height: widget.size.height * 0.1),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(10, 10),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Center(
                    child: Text('09:30 PM Volume: 80%',
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 25))),
              ),
            ],
          ),
        ]),
      ),
    ));
  }
}

void _showMessageBox(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Instruction"),
        content: Text(
          "1. send feedback to dev.\n2. display the time and brightness value.\n3. display the time and sound volume.",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
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
