import 'package:Personal_Health_Tracker/CustomButton.dart';
import 'package:Personal_Health_Tracker/Function.dart';
import 'package:Personal_Health_Tracker/StyleText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  List<Widget> name = [];
  firestore() async {
    final data = await firebase.collection("User").get();
    for (final i in data.docs) {
      // print(i['username']);
      // print(i['password']);
      // print(i['email']);
      Widget nameUser = FunctionData(
        name: i['username'],
        pass: i['password'],
        mail: i['email'],
      );

      name.add(nameUser);
    }
    print(name);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firestore();
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(child: Column(children: name)),
    );
  }
}
