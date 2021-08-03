import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Result Page'),
        ),
        body: Column(
          children: [
            Container(
              height: 180,
              width: 180,
              margin: EdgeInsets.fromLTRB(130, 250, 130, 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'http://www.clker.com/cliparts/1/2/0/1/1516205066536364543angry-little-boy-clipart.hi.png'))),
            ),
            Container(
                child: Text(
              'Still Im not complete my Project!!',
              style: TextStyle(fontSize: 20),
            ))
          ],
        ));
  }
}
