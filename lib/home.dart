import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:psych_help/Mapper.dart';
import 'package:psych_help/addpsych.dart';
import 'package:psych_help/globals.dart' as userFile;
import 'package:psych_help/services.dart';
import 'package:provider/provider.dart';
import 'package:psych_help/psychListUser.dart';
import 'package:psych_help/psychListMod.dart';
import 'package:psych_help/Sidebars.dart';

class ModHomePage extends StatefulWidget {
  @override
  _ModHomePageState createState() => _ModHomePageState();
}

class _ModHomePageState extends State<ModHomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
  }

  void getData() async {
    print(userFile.modData.firstName);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
          AppBar(title: Text('Psych Search'), backgroundColor: Colors.green),
      drawer: SideBarMod(),
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
                    await AppServices.psychSearchHistory();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ModPsychList()),
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

class UserPsychList extends StatefulWidget {
  UserPsychList({Key key, this.lists, this.name}) : super(key: key);
  final List<SearchData> lists;
  final String name;
  @override
  _UserPsychList createState() => _UserPsychList();
}

// enum SingingChrUsrPsyLst { oncall, onsite }

class _UserPsychList extends State<UserPsychList> {
  _UserPsychList({this.psyListUsr, this.uname});
  final String uname;
  final List<SearchData> psyListUsr;
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
                ? Text('Search Results')
                : TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                        controller: searchText,
                        autofocus: true,
                        style: DefaultTextStyle.of(context).style.copyWith(
                            fontStyle: FontStyle.italic, fontSize: 12),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Search here...",
                          hintStyle: TextStyle(color: Colors.white),
                        )),
                    onSuggestionSelected: (suggestion) {
                      setState(() {
                        searchText.text = suggestion.seacrhHis;
                      });
                      //searchText.text = suggestion;
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        leading: Icon(Icons.history),
                        title: Text(suggestion.seacrhHis),
                      );
                    },
                    suggestionsCallback: (_) async {
                      return AppServices.psychSearchHistory();
                    },
                  ),
            backgroundColor: Colors.green,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    setState(() {
                      searchQuery = searchText.text;
                      this.isSearching = !this.isSearching;
                    });
                    if (searchQuery.isNotEmpty) {
                      await AppServices.addSearch(searchQuery);
                    }
                  })
            ],
          ),
          drawer: SideBarUser(),
          body: UsrPsychList(),
        ));
  }
}
