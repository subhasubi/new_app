import 'package:flutter/material.dart';
import 'package:Personal_Health_Tracker/CustomButton.dart';
import 'package:Personal_Health_Tracker/LoginPage.dart';
import 'package:Personal_Health_Tracker/RegisterPage.dart';
import 'package:Personal_Health_Tracker/StyleText.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: Column(
            children: [
              Container(
                height: 130,
                width: 300,
                margin: EdgeInsets.fromLTRB(70, 250, 70, 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('image/welcome.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(100, 80, 100, 0),
                  child: Text(
                    'Your Personal',
                    style: tips,
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(80, 10, 80, 0),
                  child: Text('HEALTH TRACKER', style: title)),
              SizedBox(height: 30),
              CustomButton(
                buttonText: 'Get Started',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(100, 40, 100, 100),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterPage()));
                    },
                    child: RichText(
                      text:
                          TextSpan(text: 'Don\'t have an account?', children: [
                        TextSpan(
                            text: ' Sign Up',
                            style: TextStyle(color: Colors.blue, fontSize: 15)),
                      ]),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
