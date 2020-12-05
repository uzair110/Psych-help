import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psych_help/services.dart';
import 'package:psych_help/Mapper.dart';
import 'package:psych_help/psychProfileUsr.dart';
import 'package:psych_help/globals.dart' as userFile;

class SpecificPsy extends StatefulWidget {
  SpecificPsy({Key key, this.lists}) : super(key: key);
  final List<PsyData> lists;
  @override
  _SpecificPsy createState() => _SpecificPsy();
}

// enum SingingChrUsrPsyLst { oncall, onsite }

class _SpecificPsy extends State<SpecificPsy> {
  _SpecificPsy({this.psyListUsr});
  final List<PsyData> psyListUsr;
  bool isSearching = false;
  String searchQuery = "";
  //List<PsyData> psyListUsr;

  //SingingCharacter _character = SingingCharacter.oncall;
  TextEditingController searchText = new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
  }

  void getData() async {
    print(userFile.usrData.firstName);
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<PsyData>>.value(
        value: AppServices.searchPromise(searchQuery).asStream(),
        child: Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: !isSearching
                  ? Text('All Psychs')
                  : TextField(
                      controller: searchText,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Search here...",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
              backgroundColor: Colors.green,
            ),
            drawer: Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text("userFile.usrData.firstName"),
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
                    title: Text('View my ratings'),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => MyRating()),
                      // );
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
            // resizeToAvoidBottomPadding: false,
            //body: UsrPsychList(),
            //body: this.isSearching ? UsrPsychList() : UsrPsychSearch(),
            body: Column(
              children: <Widget>[
                Container(
                  height: 300,
                  child: Card(
                    child: ListTile(
                      title: Text('Uzair Mustafa'),
                      trailing: InkWell(
                        hoverColor: Colors.red,
                        splashColor: Colors.blueAccent,
                        child: Text('delete',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
