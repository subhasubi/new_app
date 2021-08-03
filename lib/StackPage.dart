import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class StackPage extends StatefulWidget {
  const StackPage({Key? key}) : super(key: key);

  @override
  _StackPageState createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  double rate = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            child: Container(
              child: SfSlider.vertical(
                value: rate,
                onChanged: (newRate) {
                  setState(() {
                    rate = newRate;
                  });
                },
                min: 100,
                max: 200,
                interval: 20,
                showTicks: true,
                enableTooltip: true,
                showLabels: true,
                minorTicksPerInterval: 5,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              height: 400,
              width: rate,
              child: Image(image: AssetImage('image/person1.png')),
            ),
          )
        ],
      ),
    );
  }
}
