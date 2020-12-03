import 'package:flutter/material.dart';
import 'package:psych_help/addpsych.dart';
import 'package:psych_help/psychlist.dart';
import 'package:psych_help/globals.dart';
import 'package:psych_help/services.dart';

class ModHomePage extends StatefulWidget {
  @override
  _ModHomePageState createState() => _ModHomePageState();
}

class _ModHomePageState extends State<ModHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
          AppBar(title: Text('Psych Search'), backgroundColor: Colors.green),
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
                Navigator.popUntil(
                    context, ModalRoute.withName(Navigator.defaultRouteName));
              },
            ),
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 150.0),
          Center(
              child: Container(
            height: 150.0,
            width: 300.0,
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Colors.greenAccent,
              elevation: 7.0,
              color: Colors.green,
              child: InkWell(
                  hoverColor: Colors.red,
                  splashColor: Colors.blueAccent,
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddPsych()),
                    );
                  },
                  child: Center(
                    child: Text(
                      'Add a Psychologist',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )),
            ),
          )),
          SizedBox(height: 30.0),
          Center(
              child: Container(
            height: 150.0,
            width: 300.0,
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Colors.greenAccent,
              elevation: 7.0,
              color: Colors.green,
              child: InkWell(
                  hoverColor: Colors.red,
                  splashColor: Colors.blueAccent,
                  onTap: () async {
                    var fetchedData = await AppServices.psychList(aid);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PsychList()),
                    );
                  },
                  child: Center(
                    child: Text(
                      'View Psychologists',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
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
