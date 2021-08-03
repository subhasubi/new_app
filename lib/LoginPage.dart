import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Personal_Health_Tracker/BmiScreen.dart';
import 'package:Personal_Health_Tracker/CustomButton.dart';
import 'package:Personal_Health_Tracker/RegisterPage.dart';
import 'package:Personal_Health_Tracker/StyleText.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static String userID = '';
  LoginPage({this.mail});
  String? mail;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  signIn() async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: _email.text, password: _password.text);
    setSession();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => BmiScreen()));
  }

  setSession() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('Email', _email.text);
    BmiScreen.userId = _email.text;
  }

  bool? visibilityPassword = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                height: 180,
                width: 180,
                margin: EdgeInsets.fromLTRB(120, 80, 100, 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('image/login1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 35,
                width: 350,
                margin: EdgeInsets.fromLTRB(20, 3, 10, 5),
                child: Text('LOGIN',
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
                child: Text('Please Sign In to continue..',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontStyle: FontStyle.italic)),
              ),
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
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 70),
              CustomButton(
                buttonText: 'Login',
                onPressed: () {
                  signIn();
                },
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(100, 50, 50, 100),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterPage()));
                    },
                    child: RichText(
                      text:
                          TextSpan(text: 'Don\'t have an account?', children: [
                        TextSpan(
                            text: ' Sign Up',
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
