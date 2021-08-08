import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Personal_Health_Tracker/BmiScreen.dart';
import 'package:Personal_Health_Tracker/CustomButton.dart';
import 'package:Personal_Health_Tracker/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Gender { male, female }

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _conformPassword = TextEditingController();

  Gender id = Gender.male;

  FirebaseAuth auth = FirebaseAuth.instance;
  signUp() async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: _email.text, password: _password.text);
    register();
    setSession();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  register() {
    print('ffffffffffffffffffffffffffff');
    print(id.index);
    firestore.collection('Users').doc(_email.text).set({
      'Username': _name.text,
      'Email': _email.text,
      'Password': _password.text,
      'Conform Password': _conformPassword.text,
      'Gender': id.index == 0 ? 'male' : 'female',
    });
  }

  setSession() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('Username', _name.text);
    preferences.setString('Email', _email.text);
    preferences.setString('Gender', id == 0 ? 'male' : 'female');
    clear();
  }

  clear() {
    _name.clear();
    _email.clear();
    _password.clear();
    _conformPassword.clear();
  }

  bool? visibilityPassword = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              // TextButton(
              //     onPressed: () {
              //       getSession();
              //     },
              //     child: Text('test')),
              Container(
                height: 40,
                width: 350,
                margin: EdgeInsets.fromLTRB(20, 50, 10, 5),
                child: Text('Create Account',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontStyle: FontStyle.italic)),
              ),
              Container(
                height: 30,
                width: 350,
                margin: EdgeInsets.fromLTRB(20, 2, 10, 3),
                child: Text('Please fill the input blow here...',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontStyle: FontStyle.italic)),
              ),
              SizedBox(height: 50),
              TextField(
                controller: _name,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  hintText: 'Username',
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _email,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  hintText: 'Email',
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _password,
                obscureText: visibilityPassword!,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility_off_outlined),
                    onPressed: () {
                      setState(() {
                        visibilityPassword = !visibilityPassword!;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  hintText: 'Password',
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _conformPassword,
                obscureText: visibilityPassword!,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility_off_outlined),
                    onPressed: () {
                      setState(() {
                        visibilityPassword = !visibilityPassword!;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  hintText: 'Confirm Password',
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 60, right: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Radio(
                      onChanged: (Gender? value) {
                        setState(() {
                          id = value!;
                          print(id.index);
                        });
                      },
                      groupValue: id,
                      value: Gender.male,
                    ),
                    Text(
                      'Male',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Radio(
                      onChanged: (Gender? value) {
                        setState(() {
                          id = value!;
                          print(id.index);
                        });
                      },
                      groupValue: id,
                      value: Gender.female,
                    ),
                    Text(
                      'Female',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
              CustomButton(
                buttonText: 'Sign Up',
                onPressed: () {
                  signUp();
                },
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(100, 30, 50, 100),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(MaterialPageRoute(
                          builder: (context) => LoginPage(mail: _email.text)));
                    },
                    child: RichText(
                      text:
                          TextSpan(text: 'Already have an account?', children: [
                        TextSpan(
                            text: ' Sign In',
                            style: TextStyle(color: Colors.blue, fontSize: 15)),
                      ]),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
