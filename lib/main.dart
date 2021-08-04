import 'package:Personal_Health_Tracker/GetXController.dart';
import 'package:Personal_Health_Tracker/Test.dart';
import 'package:Personal_Health_Tracker/practice/session.dart';
import 'package:Personal_Health_Tracker/practice/sessionHome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Personal_Health_Tracker/AddSubContainers.dart';
import 'package:Personal_Health_Tracker/BmiPage.dart';
import 'package:Personal_Health_Tracker/BmiScreen.dart';
import 'package:Personal_Health_Tracker/DietOverWeight.dart';
import 'package:Personal_Health_Tracker/DeitPage.dart';
import 'package:Personal_Health_Tracker/InputValues.dart';
import 'package:Personal_Health_Tracker/LogPage.dart';
import 'package:Personal_Health_Tracker/LoginPage.dart';
import 'package:Personal_Health_Tracker/NavigationPage.dart';
import 'package:Personal_Health_Tracker/RadioButton.dart';
import 'package:Personal_Health_Tracker/RegisterPage.dart';
import 'package:Personal_Health_Tracker/ResultPage.dart';
import 'package:Personal_Health_Tracker/StackPage.dart';
import 'package:Personal_Health_Tracker/ViewPage.dart';
import 'package:Personal_Health_Tracker/WelcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  Get.put(SessionController());
  SessionController _sessionController = Get.find<SessionController>();

  String? email = preferences.getString('Email');
  print(email);
  print('aaaaaaaaaaaaaaaaaaaaaaaa');
  BmiScreen.userId = 'subha@gmail.com';

  runApp(
    GetMaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: email != null ? BmiScreen() : WelcomePage(),
      ),
    ),
  );
}

class ImageWithSlider extends StatefulWidget {
  const ImageWithSlider({Key? key}) : super(key: key);

  @override
  _ImageWithSliderState createState() => _ImageWithSliderState();
}

class _ImageWithSliderState extends State<ImageWithSlider> {
  double rate = 0.0;
  int a = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://wallpaperaccess.com/full/1519340.jpg')),
            ),
            height: 100,
            width: rate,
          ),
          Slider(
            value: rate,
            onChanged: (newRate) {
              setState(() {
                rate = newRate;
              });
              print('$newRate');
            },
            min: 0,
            max: 100,
            label: '$rate',
            divisions: 5,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'enter your name',
                    labelText: '$a',
                  ),
                ),
                SizedBox(height: 15),
                MaterialButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  onPressed: () {
                    setState(() {
                      a = a + 1;
                    });
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class ContainerDecoration extends StatelessWidget {
  const ContainerDecoration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://wallpapercave.com/wp/wp2014090.jpg'))),
            height: 150,
            width: 150,
            margin: EdgeInsets.fromLTRB(130.0, 100.0, 50.0, 20.0),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(100),
            ),
            height: 150,
            width: 150,
            margin: EdgeInsets.fromLTRB(130.0, 50.0, 50.0, 20.0),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 5.0)),
            height: 150,
            width: 150,
            margin: EdgeInsets.fromLTRB(130.0, 50.0, 50.0, 20.0),
          ),
        ],
      ),
    ));
  }
}

class ColumnAndRow extends StatelessWidget {
  const ColumnAndRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.pink,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    color: Colors.blue,
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.fromLTRB(23.0, 10.0, 0.0, 10.0),
                  ),
                  Container(
                    color: Colors.blue,
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 10.0),
                  ),
                  Container(
                    color: Colors.blue,
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 10.0),
                  ),
                ],
              ),
              Container(
                color: Colors.blue,
                height: 100,
                width: 380,
                margin: EdgeInsets.fromLTRB(23.0, 10.0, 27.0, 10.0),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        color: Colors.blue,
                        height: 300,
                        width: 100,
                        margin: EdgeInsets.fromLTRB(23.0, 10.0, 0.0, 10.0),
                      ),
                      Container(
                        color: Colors.blue,
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.fromLTRB(23.0, 10.0, 0.0, 10.0),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        color: Colors.blue,
                        height: 300,
                        width: 100,
                        margin: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 10.0),
                      ),
                      Container(
                        color: Colors.blue,
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 10.0),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        color: Colors.blue,
                        height: 300,
                        width: 100,
                        margin: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 10.0),
                      ),
                      Container(
                        color: Colors.blue,
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 10.0),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
