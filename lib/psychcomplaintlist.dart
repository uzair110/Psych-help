import 'package:flutter/material.dart';
import 'package:psych_help/Mapper.dart';
import 'package:psych_help/globals.dart' as userFile;
import 'package:psych_help/services.dart';
import 'package:provider/provider.dart';
import 'package:psych_help/Loading.dart';

class ModPsychComplain extends StatefulWidget {
  @override
  _ModPsychComplain createState() => _ModPsychComplain();
}

// enum SingingChrUsrPsyLst { oncall, onsite }

class _ModPsychComplain extends State<ModPsychComplain> {
  bool isSearching = false;
  String searchQuery = "";

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
    return StreamProvider<List<PsychComplaintData>>.value(
        value: AppServices.psychComplaints().asStream(),
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => {Navigator.pop(context)}),
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
          // resizeToAvoidBottomPadding: false,
          body: PsychComplaint(),
        ));
  }
}

class PsychComplaint extends StatefulWidget {
  @override
  _PsychComplaint createState() => _PsychComplaint();
}

class _PsychComplaint extends State<PsychComplaint> {
  @override
  Widget build(BuildContext context) {
    final complains = Provider.of<List<PsychComplaintData>>(context);
    if (complains == null) {
      return LoadingScreen();
    } else if (complains == [] || complains.length == 0) {
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
            itemCount: complains.length,
            itemBuilder: (context, index) {
              return Card(
                  child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Psychologist Name\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '${complains[index].firstName} ${complains[index].lastName}',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '\nComplaint:\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: complains[index].complain,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.black,
                    height: 2,
                  ),
                ],
              ));
            }),
      );
    }
  }
}
