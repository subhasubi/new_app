import 'package:Personal_Health_Tracker/GetXController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Personal_Health_Tracker/BmiScreen.dart';
import 'package:Personal_Health_Tracker/LogPage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultPage extends StatefulWidget {
  ResultPage({this.age, this.weight, this.height, this.bmiValue});
  int? weight;
  int? age;
  dynamic? height;
  num? bmiValue;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String? _mail;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Color> _colors = [
    Colors.purple.shade900,
    Colors.blue.shade800,
  ];
  String? categoryValue = '';
  category(value) {
    if (value < 18.5) {
      categoryValue = 'UnderWeight';
    } else if (value >= 18.5 && value < 25.0) {
      categoryValue = 'Normal';
    } else if (value >= 25.0 && value < 30.0) {
      categoryValue = 'Overweight';
    } else {
      categoryValue = 'Obesity';
    }
  }

  SessionController _sessionController = Get.find<SessionController>();
  String? resultImage = '';
  resultPageImage(value) {
    if (value == 'UnderWeight') {
      resultImage = _sessionController.userInfo.value['Gender'] == 'male'
          ? 'image/underweight1.png'
          : 'image/girlUnderweight.png';
    } else if (value == 'Normal') {
      resultImage = _sessionController.userInfo.value['Gender'] == 'male'
          ? 'image/normal3.png'
          : 'image/girlNormal.png';
    } else if (value == 'Overweight') {
      resultImage = _sessionController.userInfo.value['Gender'] == 'male'
          ? 'image/overweight1.png'
          : 'image/girlOverweight.png';
    } else {
      resultImage = _sessionController.userInfo.value['Gender'] == 'male'
          ? 'image/obesity.png'
          : 'image/girlObesity.png';
    }
  }

  //List<double> _stops = [0.0, 0.5, 1.4];
  @override
  void initState() {
    // TODO: implement initState

    category(widget.bmiValue);
    resultPageImage(categoryValue);
    // _colors[0] = Colors.grey;
  }

  result() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    dynamic email = preferences.getString('Email');
    _mail = email;
    Map result = {
      'BmiValue': '${widget.bmiValue}',
      'Image': '${resultImage}',
      'Catergory': '${categoryValue}',
      'height': '${widget.height}',
      'weight': '${widget.weight}',
      'age': '${widget.age}',
      'date': DateTime.now()
    };
    firestore.collection('Users').doc(_mail).update({
      'log': FieldValue.arrayUnion([result])
    });
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Container(
                  child: Text(
                    'Your RESULT',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: _colors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10.0,
                      ),
                    ]),
                width: 200,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'BMI',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '${widget.bmiValue}',
                      style: TextStyle(
                        color: Colors.yellowAccent.shade700,
                        fontSize: 50,
                      ),
                    ),
                    Text(
                      '${categoryValue}',
                      style: TextStyle(color: Colors.cyanAccent.shade400),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
                  'BODY COMPOSITION',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle,
                      color: Colors.black45,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Image(image: AssetImage('${resultImage}'))],
                    ),
                  ),
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle,
                      color: Colors.black45,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${widget.height}',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.yellowAccent.shade700,
                          ),
                        ),
                        Text(
                          'HEIGHT',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle,
                      color: Colors.black45,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${widget.weight}',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.yellowAccent.shade700,
                          ),
                        ),
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle,
                      color: Colors.black45,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${widget.age}',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.yellowAccent.shade700,
                          ),
                        ),
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: _colors),
                    borderRadius: BorderRadius.circular(50)),
                child: MaterialButton(
                  onPressed: () {
                    result();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => BmiScreen()));
                  },
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  //color: Colors.white12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
