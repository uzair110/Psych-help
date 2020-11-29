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

  SingingCharacter _character = SingingCharacter.oncall;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('All Psychs'),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Table",textScaleFactor: 2,style: TextStyle(fontWeight:FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
               
            // textDirection: TextDirection.rtl,
            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            // border:TableBorder.all(width: 2.0,color: Colors.red),
            children: [
              TableRow(
                children: [
                  Text("Education",textScaleFactor: 1.5,),
                  Text("Institution name",textScaleFactor: 1.5),
                  Text("University",textScaleFactor: 1.5),
                ]
              ),
               TableRow(
                children: [
                  Text("B.Tech",textScaleFactor: 1.5),
                  Text("ABESEC",textScaleFactor: 1.5),
                  Text("AKTU",textScaleFactor: 1.5),
                ]
              ),
              TableRow(
                children: [
                  Text("12th",textScaleFactor: 1.5),
                  Text("Delhi Public School",textScaleFactor: 1.5),
                  Text("CBSE",textScaleFactor: 1.5),
                ]
              ),
              TableRow(
                children: [
                  Text("High School",textScaleFactor: 1.5),
                  Text("SFS",textScaleFactor: 1.5),
                  Text("ICSE",textScaleFactor: 1.5),
                ]
              ),
            ],
        ),

          )


          
        ],
      ),
    );
  }
}
