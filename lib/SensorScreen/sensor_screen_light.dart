import 'package:flutter/material.dart';

class SensorScreenLight extends StatelessWidget {
  final Size size;
  SensorScreenLight({required this.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 250, 255),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
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
                  child:
                      Icon(Icons.arrow_back_ios, size: 22, color: Colors.grey),
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
            SizedBox(height: size.height * 0.1),
          ],
        ),
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