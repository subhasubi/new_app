import 'package:Personal_Health_Tracker/practice/session.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionHome extends StatefulWidget {
  const SessionHome({Key? key}) : super(key: key);

  @override
  _SessionHomeState createState() => _SessionHomeState();
}

class _SessionHomeState extends State<SessionHome> {
  bool session = false;
  String? name1 = '';
  int? number1 = 0;

  getSessionTrue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    dynamic option = pref.getBool('option');
    dynamic name = pref.getString('name');
    dynamic number = pref.getInt('number');
    session = option;
    name1 = name;
    number1 = number;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSessionTrue();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Column(
        children: [
          Text('$session'),
          Text('$name1'),
          Text('$number1'),
          TextButton(
              onPressed: () {
                setState(() {
                  getSessionTrue();
                });
              },
              child: Text('get session')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Session()));
              },
              child: Text('Click')),
        ],
      ),
    ));
  }
}
