import 'package:flutter/material.dart';
import 'package:Personal_Health_Tracker/main.dart';

class AddSubContainers extends StatefulWidget {
  const AddSubContainers({Key? key}) : super(key: key);

  @override
  _AddSubContainersState createState() => _AddSubContainersState();
}

class _AddSubContainersState extends State<AddSubContainers> {
  int a = 0;
  int b = 0;
  var c;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://i.pinimg.com/564x/e9/29/1c/e9291cc39e820cd4afc6e58618dfc9e0.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      border: Border.all(color: Colors.black87, width: 2.0),
                      borderRadius: BorderRadius.circular(40)),
                  height: 180,
                  width: 180,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        height: 50,
                        width: 150,
                        child: Text(
                          'A',
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
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      border: Border.all(color: Colors.black87, width: 2.0),
                      borderRadius: BorderRadius.circular(40)),
                  height: 180,
                  width: 180,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        height: 50,
                        width: 150,
                        child: Text(
                          'B',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ),
                      Container(
                        child: Text('$b',
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
                                  b = b + 1;
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  b = b - 1;
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          c = '${a + b}';
                          print('$c');
                        });
                      },
                      child: Icon(Icons.add)),
                ),
                Container(
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          c = '${a - b}';
                          print('$c');
                        });
                      },
                      child: Icon(Icons.minimize_rounded)),
                ),
                Container(
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          c = '${a * b}';
                          print('$c');
                        });
                      },
                      child: Icon(Icons.close_outlined)),
                ),
                Container(
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          c = '${a ~/ b}';
                          print('$c');
                        });
                      },
                      child: Icon(Icons.create_outlined)),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black87, width: 5.0)),
              height: 150,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$c',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
