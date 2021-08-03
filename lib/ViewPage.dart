import 'package:flutter/material.dart';
import 'package:Personal_Health_Tracker/StyleText.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  PageController controller =
      PageController(initialPage: 1, viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      controller: controller,
      children: [
        Container(
          child: Center(
            child: Text(
              'page 1',
              style: title,
              textAlign: TextAlign.center,
            ),
          ),
          color: Colors.pink,
        ),
        Container(
          child: Center(
            child: Text(
              'page 2',
              style: title,
              textAlign: TextAlign.center,
            ),
          ),
          color: Colors.blue,
        ),
        Container(
          child: Center(
            child: Text(
              'page 3',
              style: title,
              textAlign: TextAlign.center,
            ),
          ),
          color: Colors.green,
        )
      ],
    );
  }
}
