import 'package:flutter/material.dart';
import 'package:psych_help/globals.dart' as userFile;
import 'package:psych_help/psychcomplaintlist.dart';
import 'package:psych_help/reviewcomplaintlist.dart';
import 'package:psych_help/myrating.dart';

class SideBarMod extends StatefulWidget {
  @override
  SideBarPropertiesMod createState() => new SideBarPropertiesMod();
}

class SideBarPropertiesMod extends State<SideBarMod> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
                userFile.modData.firstName + " " + userFile.modData.lastName),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            title: Text('View Psychologist Complaints'),
            onTap: () {
              print("Here");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ModPsychComplain()),
              );
            },
          ),
          ListTile(
            title: Text('View Review Complaints'),
            onTap: () {
              print("Here");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ModRevComplain()),
              );
            },
          ),
          ListTile(
            title: Text('Edit Account Details'),
            onTap: () {},
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
    );
  }
}

class SideBarUser extends StatefulWidget {
  @override
  SideBarPropertiesUser createState() => new SideBarPropertiesUser();
}

class SideBarPropertiesUser extends State<SideBarUser> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
                userFile.usrData.firstName + " " + userFile.usrData.lastName),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            title: Text('My Ratings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyRating()),
              );
            },
          ),
          ListTile(
            title: Text('Edit Account Details'),
            onTap: () {},
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
    );
  }
}
