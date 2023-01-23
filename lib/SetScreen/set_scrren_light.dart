import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SetScreenLight extends StatefulWidget {
  _SetScreenLightState createState() => _SetScreenLightState();
}

class _SetScreenLightState extends State<SetScreenLight> {
  TimeOfDay _time = TimeOfDay.now();
  bool _isOpen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Light Timer'),
      ),
      backgroundColor: Color.fromARGB(255, 239, 250, 255),
      body: Column(
        children: [
          // Switch to toggle light open or closed
          SwitchListTile(
            value: _isOpen,
            onChanged: (value) {
              setState(() {
                _isOpen = value;
              });
            },
            title: Text(_isOpen ? 'Open' : 'Closed'),
          ),
          // Time picker
          ListTile(
            title: Text('Time'),
            trailing: FloatingActionButton.small(
              child: Text(
                DateFormat.jm().format((DateTime.now())),
              ),
              onPressed: () async {
                final TimeOfDay? selectedTime =
                    await showTimePicker(context: context, initialTime: _time);
                if (selectedTime != null) {
                  setState(() {
                    _time = selectedTime;
                  });
                }
              },
            ),
          ),
          // Save button
          FloatingActionButton.small(
            child: Text('Save'),
            onPressed: () {
              Navigator.pop(context, {
                'isOpen': _isOpen,
                'time': _time,
              });
            },
          )
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

