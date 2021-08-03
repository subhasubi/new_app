import 'package:flutter/material.dart';
import 'package:Personal_Health_Tracker/constant.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({Key? key}) : super(key: key);

  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  TextEditingController _weight = TextEditingController();
  int a = 0;
  int b = 0;
  int ans = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Male',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Female',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    height: 500,
                    width: 190,
                    color: mainColor,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: Colors.black),
                      ),
                      height: 180,
                      width: 180,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            height: 50,
                            width: 150,
                            child: Text(
                              'Weight',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                          ),
                          Container(
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              onChanged: (value) {},
                              controller: _weight,
                            ),
                            margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      ans = (int.parse(_weight.text) + 1);
                                      _weight.text = ans.toString();
                                      print('$ans');
                                    });
                                  },
                                  child: Icon(Icons.add),
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      a = a - 1;
                                    });
                                  },
                                  child: Icon(Icons.minimize_rounded),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.black),
                    ),
                    height: 180,
                    width: 180,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: 50,
                          width: 150,
                          child: Text(
                            'Age',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ),
                        Container(
                          child: Text('$a',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          margin: EdgeInsets.fromLTRB(30, 20, 30, 10),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    a = a + 1;
                                  });
                                },
                                child: Icon(Icons.add),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    a = a - 1;
                                  });
                                },
                                child: Icon(Icons.minimize_rounded),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
