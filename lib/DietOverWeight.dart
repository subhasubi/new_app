import 'package:flutter/material.dart';
import 'package:Personal_Health_Tracker/StyleText.dart';

class DietOverWeight extends StatefulWidget {
  const DietOverWeight({Key? key}) : super(key: key);

  @override
  _DietOverWeightState createState() => _DietOverWeightState();
}

class _DietOverWeightState extends State<DietOverWeight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
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
                  children: [
                    Text(
                      'Here are some plain sailing tips you can adopt for losing weight:',
                      style: dTitle,
                    ),
                    Column(
                      children: [
                        Text.rich(TextSpan(text: '1.', children: [
                          TextSpan(text: ' Vegetables', style: tips),
                          TextSpan(
                              text:
                                  ' - Vegetables are also high-fibre and low-calorie foods making them the perfect option for obese individuals.')
                        ])),
                        Text.rich(TextSpan(text: '2.', children: [
                          TextSpan(text: ' Fresh fruits', style: tips),
                          TextSpan(
                              text:
                                  ' - Fruits are a wonderful source of vitamins and dietary fibre.'
                                  ' If you’re trying to cut back on sugary desserts and unhealthy snacks,'
                                  ' a fruit is the perfect substitute.')
                        ])),
                        Text.rich(TextSpan(text: '3.', children: [
                          TextSpan(
                              text: ' Seeds and Dried Fruits', style: tips),
                          TextSpan(
                              text:
                                  ' - Dried fruits such as figs, dates,almonds, cashew nuts and'
                                  'pumpkin seeds and hemp seeds are also used for weight loss and brain function.')
                        ])),
                        Text.rich(TextSpan(text: '4.', children: [
                          TextSpan(text: ' Beverages', style: tips),
                          TextSpan(
                              text:
                                  '- Drink water or other beverages that are naturally calorie-free')
                        ])),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'How to Avoid Overeating?',
                      style: dTitle,
                    ),
                    SizedBox(height: 10),
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
                        child: Text(
                            '1. Eat breakfast \n2. Choose small portions and eat slowly. \n'
                            '3. Eat at home, Avoid fast food, restaurant meals and other foods prepared away from home. \n'
                            '4. Have an early dinner.',
                            textAlign: TextAlign.justify),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
