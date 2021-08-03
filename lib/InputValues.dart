import 'package:flutter/material.dart';
import 'package:Personal_Health_Tracker/StyleText.dart';

class InputValue extends StatelessWidget {
  InputValue({this.titleName, this.value, this.decrement, this.increment});
  String? titleName;
  String? value = "0";
  VoidCallback? increment;
  VoidCallback? decrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
        // border: Border.all(color: Colors.black)
      ),
      height: 170,
      width: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Center(
              child: Text(
                '$titleName',
                style: title,
              ),
            ),
            height: 50,
            width: 150,
            margin: EdgeInsets.fromLTRB(30, 10, 30, 0),
          ),
          Container(
            child: Text(
              "$value",
              textAlign: TextAlign.center,
              style: subText,
            ),
            width: 150,
            height: 40,
            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: MaterialButton(
                    onPressed: increment,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text('+', style: button),
                  ),
                  height: 50,
                  width: 50,
                ),
                Container(
                  child: MaterialButton(
                    onPressed: decrement,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text('-', style: button),
                  ),
                  height: 50,
                  width: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
