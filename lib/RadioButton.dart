import 'package:flutter/material.dart';

enum Gender { male, female, transgender }

class RadioButton extends StatefulWidget {
  const RadioButton({Key? key}) : super(key: key);

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  Gender id = Gender.male;
  bool firstValue = false;
  bool secondValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Male'),
            leading: Radio(
                value: Gender.male,
                groupValue: id,
                onChanged: (Gender? value) {
                  setState(() {
                    id = value!;
                  });
                }),
          ),
          ListTile(
            title: Text('Female'),
            leading: Radio(
                value: Gender.female,
                groupValue: id,
                onChanged: (Gender? value) {
                  setState(() {
                    id = value!;
                  });
                }),
          ),
          ListTile(
            title: Text('Transgender'),
            leading: Radio(
                value: Gender.transgender,
                groupValue: id,
                onChanged: (Gender? value) {
                  setState(() {
                    id = value!;
                  });
                }),
          ),
          CheckboxListTile(
              value: this.firstValue,
              secondary: Icon(Icons.person),
              title: Text('Hi! I am Subha'),
              subtitle: Text('BCA 3rd yr'),
              onChanged: (bool? value) {
                setState(() {
                  this.firstValue = value!;
                });
              }),
          CheckboxListTile(
              value: this.secondValue,
              secondary: Icon(Icons.person),
              title: Text('Hi! I am Shakshi'),
              subtitle: Text('BCA 2rd yr'),
              onChanged: (bool? value) {
                setState(() {
                  this.secondValue = value!;
                });
              }),
          Row(
            children: [
              Radio(
                onChanged: (Gender? value) {
                  setState(() {
                    id = value!;
                  });
                },
                groupValue: id,
                value: Gender.male,
              ),
              Text(
                'Male',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Radio(
                onChanged: (Gender? value) {
                  setState(() {
                    id = value!;
                  });
                },
                groupValue: id,
                value: Gender.female,
              ),
              Text(
                'Female',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Radio(
                onChanged: (Gender? value) {
                  setState(() {
                    id = value!;
                  });
                },
                groupValue: id,
                value: Gender.transgender,
              ),
              Text(
                'Transgender',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
