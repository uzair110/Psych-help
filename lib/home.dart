import 'package:flutter/material.dart';
import 'package:psych_help/main.dart';
import 'package:psych_help/utilities/sizeConfig.dart';

class MyHomePage1 extends StatefulWidget {
  @override
  _MyHomePageState1 createState() => _MyHomePageState1();
}

class _MyHomePageState1 extends State<MyHomePage1> {
  TextEditingController username = new TextEditingController();
  TextEditingController pwd = new TextEditingController();
  Type rsp;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('Psych Search'),
      backgroundColor: Colors.green),
      drawer: Drawer(
        child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: <Widget>[
      DrawerHeader(
        child: Text('Username'),
        decoration: BoxDecoration(
          color: Colors.green,
        ),
      ),
      ListTile(
        title: Text('View User Complaints'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
      ListTile(
        title: Text('Legal'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
      ListTile(
        title: Text('Help'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
      ListTile(
        title: Text('Logout'),
        onTap: () async {
          Navigator.popUntil(context,
            ModalRoute.withName(Navigator.defaultRouteName));
        },
),
    ],
  ),
      ),

      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                    Navigator.popUntil(context,
                        ModalRoute.withName(Navigator.defaultRouteName));
                  },
                  child: Center(
                    child: Text(
                      'Add a Psychologist',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ),
          )),
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
                    Navigator.popUntil(context,
                        ModalRoute.withName(Navigator.defaultRouteName));
                  },
                  child: Center(
                    child: Text(
                      'View Psychologists',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ),
          )),
        ],
      ),
    );
  }
}
