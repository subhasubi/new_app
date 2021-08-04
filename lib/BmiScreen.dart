import 'dart:math';

import 'package:Personal_Health_Tracker/GetXController.dart';
import 'package:Personal_Health_Tracker/LoginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Personal_Health_Tracker/InputValues.dart';
import 'package:Personal_Health_Tracker/LogPage.dart';
import 'package:Personal_Health_Tracker/NavigationPage.dart';
import 'package:Personal_Health_Tracker/ResultPage.dart';
import 'package:Personal_Health_Tracker/StyleText.dart';
import 'package:Personal_Health_Tracker/WelcomePage.dart';
import 'package:Personal_Health_Tracker/constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);
  static String userId = '';
  static String imageGender = '';

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int a = 40;
  int b = 20;
  double rate = 0;
  String? bmi;

  String? name;
  String? mailId;

  // TextEditingController _weight = TextEditingController(text: '0');
  // TextEditingController _age = TextEditingController(text: '0');
////
  SessionController _sessionController = Get.find<SessionController>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  getSession() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    dynamic username = preferences.getString('Username');
    dynamic email = preferences.getString('Email');
    _sessionController.setUserSession(email);
    name = username;
    mailId = email;
    getData();
  }

  getData() async {
    var userData = await firestore
        .collection('Users')
        .doc(_sessionController.userSession.value)
        .get();

    _sessionController.setUserInfo(userData.data());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(BmiScreen.userId + 'GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG');
    getSession();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('BMI Screen'),
      ),
      drawer: Drawer(
        child: StreamBuilder<QuerySnapshot>(
            stream: firestore.collection('Users').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text('Loading...');
              } else {
                String name = '';
                String mailId = '';
                final data = snapshot.data!.docs;
                for (dynamic i in data) {
                  if (BmiScreen.userId == i.id!) {
                    print("gggggggggggggggggggggggggggg ");
                    print(i.data());
                    name = i['Username'];
                    mailId = i['Email'];
                  }
                }
                return ListView(
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: Text('$name'),
                      accountEmail: Text('$mailId'),
                      currentAccountPicture: GestureDetector(
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: Colors.white12),
                    ),
                    InkWell(
                      onTap: () {
                        getSession();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => LogPage()));
                      },
                      child: ListTile(
                        title: Text('Log Page'),
                        leading: Icon(Icons.history),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    InkWell(
                      onTap: () async {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();

                        preferences.setString('Email', '');

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WelcomePage()));
                      },
                      child: ListTile(
                        title: Text('Logout'),
                        leading: Icon(Icons.login_outlined),
                      ),
                    ),
                  ],
                );
              }
            }),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(color: backgColor),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32, left: 8, right: 8),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 550,
                      width: 220,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white)),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            bottom: 28,
                            child: Container(
                              alignment: Alignment.center,
                              height: rate * 2.4,
                              child: Image(
                                image: AssetImage('image/person1.png'),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              height: 530,
                              width: 100,
                              child: SfSlider.vertical(
                                value: rate,
                                onChanged: (newRate) {
                                  setState(() {
                                    rate = newRate;
                                  });
                                },
                                min: 0,
                                max: 200,
                                interval: 10,
                                showTicks: true,
                                enableTooltip: true,
                                showLabels: true,
                                minorTicksPerInterval: 5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 550,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InputValue(
                            titleName: "Weight",
                            value: '$a',
                            increment: () {
                              setState(() {
                                a = a + 1;
                              });
                            },
                            decrement: () {
                              setState(() {
                                a = a - 1;
                              });
                            },
                          ),
                          InputValue(
                            titleName: "Age",
                            value: '$b',
                            increment: () {
                              setState(() {
                                b = b + 1;
                              });
                            },
                            decrement: () {
                              setState(() {
                                b = b - 1;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(50, 40, 50, 20),
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
                onPressed: () {
                  print(_sessionController.userSession.value);
                  print(_sessionController.userInfo.value);

                  dynamic c = rate / 100;
                  bmi = (a / (c * c)).toStringAsFixed(2);
                  print(bmi);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiValue: num.parse(bmi.toString()),
                            age: b,
                            height: rate.toStringAsFixed(2),
                            weight: a,
                          )));
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
