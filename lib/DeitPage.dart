import 'package:flutter/material.dart';
import 'package:Personal_Health_Tracker/DietData.dart';
import 'package:Personal_Health_Tracker/StyleText.dart';
import 'package:Personal_Health_Tracker/StyleText.dart';

class DeitPage extends StatefulWidget {
  DeitPage({this.category1});

  String? category1;

  @override
  _DeitPageState createState() => _DeitPageState();
}

class _DeitPageState extends State<DeitPage> {
  List<Widget> underweight = [];

  diet(List diet) {
    for (dynamic i in diet) {
      print('${i['Heading']}');
      List<Widget> tipss = [];
      List<Widget> tricks = [];
      int count = 0;

      for (dynamic j in i['Tips']) {
        count += 1;
        print(j['Food']);
        print(j['FoodTips']);
        Widget tip = Text.rich(TextSpan(text: '$count. ', children: [
          TextSpan(text: '${j['Food']}', style: tips),
          TextSpan(text: '${j['FoodTips']}')
        ]));
        tipss.add(tip);
      }

      print('${i['SubTitle']}');
      for (var k in i['Trick']) {
        print('$k');
        Widget trick = Text(
          '$k',
          textAlign: TextAlign.justify,
        );
        tricks.add(trick);
      }

      Widget dietUnder = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 600,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Color(0x8AB1A9A9),
                    spreadRadius: 2.0,
                    blurRadius: 10.0)
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    '${i['Heading']}',
                    style: dTitle,
                  ),
                  Column(
                    children: tipss,
                  ),
                  SizedBox(height: 20),
                  Text(
                    '${i['SubTitle']}',
                    style: dTitle,
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x8AB1A9A9),
                            spreadRadius: 2.0,
                            blurRadius: 3.0)
                      ],
                    ),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: tricks,
                      ),
                    )),
                  )
                ],
              ),
            ),
          ),
        ],
      );
      underweight.add(dietUnder);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('hhhhhhhhhhhhhhhhhhhhhhhhhh ${widget.category1}');
    if (widget.category1 == 'OverWeight' || widget.category1 == 'Obesity') {
      diet(OverWeight);
    }
    if (widget.category1 == 'UnderWeight') {
      diet(UnderWeight);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.category1 == 'Normal'
              ? [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 600,
                          width: 400,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x8AB1A9A9),
                                  spreadRadius: 2.0,
                                  blurRadius: 10.0)
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '              Woww!! \n'
                                  ' You are perfectly Fit!..',
                                  style: dTitle,
                                ),
                                Image.asset('image/thumpsUp2.png'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              : underweight,
        ),
      ),
    );
  }
}
