import 'package:flutter/material.dart';

class SensorScreenLight extends StatelessWidget {
  final Size size;
  SensorScreenLight({required this.size});

  @override
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
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: size.height * 0.1),
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
                    child: Text('07:30 AM Lumen: 45%',
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 25))),
              ),
              SizedBox(height: size.height * 0.1),
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
                    child: Text('12:00 PM Lumen: 15%',
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 25))),
              ),
              SizedBox(height: size.height * 0.1),
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
                    child: Text('10:45 PM Lumen: 80%',
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
