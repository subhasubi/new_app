import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'StyleText.dart';

class FunctionData extends StatelessWidget {
  FunctionData({this.name, this.mail, this.pass});
  String? name;
  String? pass;
  String? mail;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.red,
      margin: EdgeInsets.all(3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Username :',
                style: dTitle,
              ),
              Text('${name}'),
            ],
          ),
          Row(
            children: [
              Text(
                'Email :',
                style: dTitle,
              ),
              Text('${mail}'),
            ],
          ),
          Row(
            children: [
              Text(
                'Password :',
                style: dTitle,
              ),
              Text('${pass}'),
            ],
          )
        ],
      ),
    ));
  }
}
