import 'package:Personal_Health_Tracker/BmiScreen.dart';
import 'package:Personal_Health_Tracker/GetXController.dart';
import 'package:Personal_Health_Tracker/LoginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Personal_Health_Tracker/DeitPage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'StyleText.dart';

class LogPage extends StatefulWidget {
  // LogPage({this.category});
  //
  // String? category;

  @override
  _LogPageState createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  SessionController _sessionController = Get.find<SessionController>();

  getTime(final timeStamp) {
    int yearFormat;
    int monthFormat;
    int dayFormat;

    var year = DateFormat('y');
    var month = DateFormat('MM');
    var day = DateFormat('d');

    yearFormat = int.parse(year.format(timeStamp.toDate()));
    monthFormat = int.parse(month.format(timeStamp.toDate()));
    dayFormat = int.parse(day.format(timeStamp.toDate()));

    var logTime = DateTime(yearFormat, monthFormat, dayFormat);
    print(logTime.runtimeType);
    return logTime;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('LogPage'),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: StreamBuilder<QuerySnapshot>(
                  stream: firestore.collection('Users').snapshots(),
                  builder: (context, snapShot) {
                    if (!snapShot.hasData) {
                      return Container(
                        height: 100,
                        width: double.infinity,
                        child:
                            Text('You did\'t enter the values.', style: dTitle),
                      );
                    } else {
                      try {
                        List<Widget> userData = [];
                        final data = snapShot.data!;

                        for (dynamic i in data.docs) {
                          print('----------------');

                          if (_sessionController.userInfo.value['Email'] ==
                              i.id!) {
                            for (var j in i['log']) {
                              print(j);
                              dynamic time = getTime(j['date']);
                              time = DateFormat('dd MMM y').format(time);
                              print(time.runtimeType);
                              Widget value = Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            j['Catergory'],
                                            style: title,
                                          ),
                                          Text(
                                            time.toString(),
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                color: Colors.grey,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(90, 0, 0, 0),
                                        height: 40,
                                        width: 100,
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
                                            border: Border.all(
                                                color: Colors.black26),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: MaterialButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DeitPage(
                                                          category1:
                                                              j['Catergory'],
                                                        )));
                                            print('${i['diet']}');
                                          },
                                          child: Text(
                                            'Diet',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    indent: 5,
                                    endIndent: 15,
                                  ),
                                ],
                              );
                              userData.add(value);
                            }
                          }
                        }
                        return Column(
                          children: userData,
                        );
                      } catch (e) {
                        return Text('$e');
                      }
                    }
                  }),
            ),
          )),
    );
  }
}
