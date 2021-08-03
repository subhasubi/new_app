import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session extends StatefulWidget {
  const Session({Key? key}) : super(key: key);

  @override
  _SessionState createState() => _SessionState();
}

class _SessionState extends State<Session> {
  setSessionTrue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Future<bool> option = pref.setBool('option', true);
    Future<bool> name = pref.setString('name', 'subha');
    Future<bool> number = pref.setInt('number', 11);
    print(option);
  }

  setSessionFalse() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Future<bool> option = pref.setBool('option', false);
    Future<bool> name = pref.setString('name', '');
    Future<bool> number = pref.setInt('number', 0);
    print(option);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setSessionTrue();
    setSessionFalse();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                setSessionTrue();
              },
              child: Text('True')),
          ElevatedButton(
              onPressed: () {
                setSessionFalse();
              },
              child: Text('False')),
        ],
      ),
    ));
  }
}
