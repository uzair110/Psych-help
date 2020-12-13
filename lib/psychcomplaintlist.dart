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
  String result = '';
  String globalId = '';

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Psychologist Name\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
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
                    height: 5,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Complaint:\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
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
                    height: 5,
                  ),
                  RaisedButton(
                    onPressed: () {
                      showDialog(
                        //User friendly error message when the screen has been displayed
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text(
                            "Are you sure you want to delete " +
                                "${complains[index].firstName}" +
                                " " +
                                "${complains[index].lastName}" +
                                "?",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel"),
                            ),
                            FlatButton(
                              onPressed: () async {
                                globalId = '${complains[index].pid}';
                                result = await AppServices.psychDel(
                                    complains[index].pid);
                                print(result);
                                if (result == "Success Deletion") {
                                  Navigator.pop(context);
                                } else {
                                  showDialog(
                                    //User friendly error message when the screen has been displayed
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: Text(
                                        "Connection Failure",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 28),
                                      ),
                                      content: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: ListBody(
                                          mainAxis: Axis.vertical,
                                          children: <Widget>[
                                            Icon(Icons.clear,
                                                color: Colors.red[300],
                                                size: 50),
                                            // Text(
                                            //     'Warning: Social Distance Violated!\nYou are at a distance of less than 2 metres from another person.'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    barrierDismissible: true,
                                  );
                                }
                                Navigator.pop(context);
                              },
                              child: Text("Continue"),
                            ),
                          ],
                          content: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: ListBody(
                              mainAxis: Axis.vertical,
                              children: <Widget>[
                                Icon(Icons.clear,
                                    color: Colors.red[300], size: 50),
                                // Text(
                                //     'Warning: Social Distance Violated!\nYou are at a distance of less than 2 metres from another person.'),
                              ],
                            ),
                          ),
                        ),
                        barrierDismissible: true,
                      );
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text('Delete Psychologist',
                          style: TextStyle(fontSize: 20)),
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
