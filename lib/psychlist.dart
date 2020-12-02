import 'package:flutter/material.dart';
import 'package:psych_help/globals.dart';

class PsychList extends StatefulWidget {
  @override
  _PsychList createState() => _PsychList();
}

enum SingingCharacter { oncall, onsite }

class _PsychList extends State<PsychList> {
  TextEditingController fname = new TextEditingController();
  TextEditingController lname = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController city = new TextEditingController();
  TextEditingController email = new TextEditingController();
  bool isSearching = false;

  SingingCharacter _character = SingingCharacter.oncall;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: !isSearching
              ? Text('All Psychs')
              : TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Search here...",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    this.isSearching = !this.isSearching;
                  });
                })
          ],
        ),
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
        body: Container(
            margin: EdgeInsets.only(left: 50, right: 50),
            child: ListView(children: <Widget>[
              Card(
                elevation: 3.0,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: InkWell(
                    hoverColor: Colors.red,
                    splashColor: Colors.blueAccent,
                    onTap: () {
                      Navigator.of(context).pushNamed('/psyprofile');
                    },
                    child: Container(
                        height: 150,
                        width: 150,
                        child: Column(
                          children: <Widget>[
                            SizedBox(width: 16.0, height: 15),
                            Text(
                              'Uzair Mustafa',
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Location: Karachi',
                              style:
                                  TextStyle(fontSize: 15.0, color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Description: Hello ladies and gentlemen...',
                              style:
                                  TextStyle(fontSize: 15.0, color: Colors.grey),
                              // textAlign: TextAlign.left,
                            ),
                          ],
                        ))),
              ),
            ])));
  }
}
