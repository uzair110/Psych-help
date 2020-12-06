import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psych_help/Loading.dart';
import 'package:psych_help/Mapper.dart';
import 'package:psych_help/psychProfileUsr.dart';
import 'package:psych_help/services.dart';
import 'package:psych_help/globals.dart' as userFile;
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:psych_help/psychProfileMod.dart';

// class ModPsychList extends StatefulWidget {
//   final String firstName, lastName, pid, city;

//   ModPsychList({this.firstName, this.lastName, this.pid, this.city});
//   @override
//   _ModPsychList createState() => _ModPsychList();
// }

// class _ModPsychList extends State<ModPsychList> {
//   @override
  
//   Widget build(BuildContext context) {
//     final psychs = Provider.of<List<PsyData>>(context);
//     if (psychs == null) {
//       return LoadingScreen();
//     } else {
//       return ListView.builder(
//           shrinkWrap: true,
//           physics: const AlwaysScrollableScrollPhysics(),
//           itemCount: psychs.length,
//           itemBuilder: (context, index) {
//             return Card(
//                 child: ListTile(
//               onTap: () {
//                 debugPrint('${psychs[index].email} is pressed!');
//                 var route = new MaterialPageRoute(
//                     builder: (BuildContext context) => new PsyProfileMod(
//                           firstName: '${psychs[index].firstName}',
//                           lastName: '${psychs[index].lastName}',
//                           pid: '${psychs[index].pid}',
//                           city: '${psychs[index].city}',
//                         ));
//                 Navigator.of(context).push(route);
//               },
//               title:
//                   Text(psychs[index].firstName + " " + psychs[index].lastName),
//               leading: Icon(Icons.account_circle),
//               trailing: Text(psychs[index].city),
//             ));
//           });
//     }
//   }
// }

class ModPsychSearch extends StatefulWidget {
  @override
  _ModPsychSearch createState() => _ModPsychSearch();
}

class _ModPsychSearch extends State<ModPsychSearch> {
  @override
  Widget build(BuildContext context) {
    final psychs = Provider.of<List<PsyData>>(context);
    if (psychs == null) {
      return LoadingScreen();
    } else {
      return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: ListView.builder(
            // primary: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: psychs.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                onTap: () {
                  debugPrint('${psychs[index].email} is pressed!');
                  var route = new MaterialPageRoute(
                      builder: (BuildContext context) => new PsyProfileMod(
                            firstName: '${psychs[index].firstName}',
                            lastName: '${psychs[index].lastName}',
                            pid: '${psychs[index].pid}',
                            city: '${psychs[index].city}',
                          ));
                  Navigator.of(context).push(route);
                },
                title: Text(
                    psychs[index].firstName + " " + psychs[index].lastName),
                leading: Icon(Icons.account_circle),
                trailing: Text(psychs[index].city),
              ));
            }),
      );
    }
  }
}


class ModPsychList extends StatefulWidget {
  ModPsychList({Key key, this.lists, this.name}) : super(key: key);
  final List<SearchData> lists;
  final String name;
  @override
  _ModPsychList createState() => _ModPsychList();
}

// enum SingingChrModPsyLst { oncall, onsite }

class _ModPsychList extends State<ModPsychList> {
  _ModPsychList({this.psyListMod, this.uname});
  final String uname;
  final List<SearchData> psyListMod;
  bool isSearching = false;
  String searchQuery = "";
  //List<PsyData> psyListMod;

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
            // : TextField(
            //     controller: searchText,
            //     style: TextStyle(color: Colors.white),
            //     decoration: InputDecoration(
            //       hintText: "Search here...",
            //       hintStyle: TextStyle(color: Colors.white),
            //     ),
            //   ),
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
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text(userFile.usrID.username),
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
          //body: ModPsychList(),
          body: this.isSearching ? ModPsychList() : ModPsychSearch(),
        ));
  }
}
