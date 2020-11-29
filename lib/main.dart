// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:psych_help/services.dart';
import 'dart:convert';
import 'dart:async';
import 'package:psych_help/signup.dart';
import 'package:psych_help/home.dart';
import 'package:psych_help/globals.dart';

void main() {
  runApp(MyApp());
}

String uid = '';
String result = '';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

Map<String, Widget Function(BuildContext)> route0 = <String, WidgetBuilder>{
  '/': (context) => MyHomePage(),
  '/SignUp': (context) => SignUp(),
};

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController username = new TextEditingController();
  TextEditingController pwd = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Type rsp;
  String result;
  Future<List> senddata() async {
    final response =
        await http.post("http://raushanjha.in/insertdata.php", body: {
      "username": username.text,
      "password": pwd.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _formKey,
      resizeToAvoidBottomPadding: false,
      body: Column(
        //key: _formKey,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                child: Text('Hello',
                    style:
                        TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                child: Text('There',
                    style:
                        TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(200.0, 175.0, 0.0, 0.0),
                child: Text('.',
                    style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
              )
            ],
          )),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(children: <Widget>[
                TextFormField(
                  controller: username,
                  validator: (_) =>
                      result == 'Failed' ? 'Invalid Id/Password' : null,
                  cursorColor: Colors.green,
                  cursorWidth: 2.0,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          fontSize: 30.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )),
                )
              ])),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(children: <Widget>[
                TextFormField(
                  controller: pwd,
                  validator: (_) =>
                      result == 'Failed' ? 'Invalid Id/Password' : 'null',
                  cursorColor: Colors.green,
                  cursorWidth: 2.0,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontSize: 30.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )),
                )
              ])),
          SizedBox(height: 30.0),
          Center(
              child: Container(
            height: 40.0,
            width: 300.0,
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Colors.greenAccent,
              elevation: 7.0,
              color: Colors.green,
              child: GestureDetector(
                  onTap: () async {
                    print('User');
                    result =
                        await App_services.valEmployee(username.text, pwd.text);
                    if (result == "Failed") {
                      showDialog(
                        //User friendly error message when the screen has been displayed
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text(
                            "Invalid Id/Password",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 28),
                          ),
                          content: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: ListBody(
                              mainAxis: Axis.vertical,
                              children: <Widget>[
                                Icon(Icons.clear,
                                    color: Colors.red[300], size: 50),
                                // Text(
                                //     'Warning: Social Distance Violated!\nYou are at a distance of less than 2 metres from another person.'),
                              ],
                            ),
                          ),
                        ),
                        barrierDismissible: true,
                      );
                    } else {
                      print("result");
                      //_formKey.currentState.validate();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage1()),
                      );
                    }
                    print(result);
                    print(username.text);
                    print(pwd.text);
                  },
                  child: Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ),
          )),
          SizedBox(height: 20.0),
          Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 50.0),
                Text("Don't have an account?  ",
                    style: TextStyle(color: Colors.grey)),
                // r
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Text('Create a new account.',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline)))
              ]),
        ],
      ),
    );
  }
}
