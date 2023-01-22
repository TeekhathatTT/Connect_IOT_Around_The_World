import 'package:flutter/material.dart';
import 'package:appflutter/constant.dart';

class ControlButton extends StatefulWidget {
  const ControlButton(
      {Key? key,
      required this.size,
      required this.icon,
      required this.title,
      required this.nextPage})
      : super(key: key);

  final Size size;
  final IconData icon;
  final String title;
  final Widget nextPage;

  @override
  _ControlButtonState createState() => _ControlButtonState();
}

class _ControlButtonState extends State<ControlButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.nextPage),
            );
          },
          child: Container(
            height: widget.size.height * 0.105,
            width: widget.size.width * 0.21,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              widget.icon,
              size: 45,
              color: Colors.grey.withOpacity(0.6),
            ),
          ),
        ),
        SizedBox(height: widget.size.height * 0.005),
        Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
