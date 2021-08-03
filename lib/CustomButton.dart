import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onPressed, this.buttonText, this.margin});

  VoidCallback? onPressed;
  String? buttonText;
  double? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      height: 50,
      width: 250,
      decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(color: Colors.pinkAccent),
          // ],
          shape: BoxShape.rectangle,
          gradient: LinearGradient(
            colors: [
              Color(0xFF4A148C),
              Color(0xFF1565C0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(50)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          '$buttonText',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
