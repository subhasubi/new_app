import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  TextInputField({this.textValue, this.iconPrefix});

  String? textValue;
  IconData? iconPrefix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      decoration: InputDecoration(
        prefixIcon: Icon(
          iconPrefix,
          color: Colors.white,
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.visibility_off_outlined),
          onPressed: () {},
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        hintText: '$textValue',
        fillColor: Colors.white,
      ),
    );
  }
}
