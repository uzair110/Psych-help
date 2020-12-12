import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psych_help/Loading.dart';
import 'package:psych_help/Mapper.dart';
import 'package:psych_help/Sidebars.dart';
import 'package:psych_help/services.dart';
import 'package:psych_help/globals.dart' as userFile;
import 'package:psych_help/psychProfileMod.dart';

class ModPsychCard extends StatefulWidget {
  final String number;
  @override
  ModPsychCard({this.number});
  _ModPsychCard createState() => _ModPsychCard();
}

class _ModPsychCard extends State<ModPsychCard> {
  @override
  Widget build(BuildContext context) {
    final psychs = Provider.of<List<PsyData>>(context);
    if (psychs == null) {
      return LoadingScreen();
    } else if (psychs == [] || psychs.length == 0) {
      print("Nothing to see here");
      return Center(
        child: Text("No Items to Display"),
      );
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
                          firstName: psychs[index].firstName,
                          lastName: psychs[index].lastName,
                          pid: psychs[index].pid,
                          city: psychs[index].city,
                          number: psychs[index].phoneNumber));
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
                : TextField(
                    controller: searchText,
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
                  onPressed: () async {
                    setState(() {
                      searchQuery = searchText.text;
                      this.isSearching = !this.isSearching;
                    });
                  })
            ],
          ),
          drawer: SideBarMod(),
          body: ModPsychCard(),
        ));
  }
}
