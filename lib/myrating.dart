import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psych_help/services.dart';
import 'package:psych_help/Mapper.dart';
import 'package:psych_help/specificpsy.dart';
import 'package:psych_help/globals.dart' as userFile;

class MyRating extends StatefulWidget {
  MyRating({Key key, this.lists}) : super(key: key);
  final List<PsyData> lists;
  @override
  _MyRating createState() => _MyRating();
}

// enum SingingChrUsrPsyLst { oncall, onsite }

class _MyRating extends State<MyRating> {
  _MyRating({this.psyListUsr});
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
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => {Navigator.pop(context)}),
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
            body: Column(
              children: <Widget>[
                Card(
                  child: ListTile(
                    title: Text('Psy 1'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SpecificPsy()),
                      );
                      // Update the state of the app.
                      // ...
                    },
                    trailing: Text('<insert rating>'),
                  ),
                ),
              ],
            )));
  }
}
