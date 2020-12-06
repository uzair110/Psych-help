import 'package:flutter/material.dart';
import 'package:psych_help/Mapper.dart';
import 'package:psych_help/globals.dart' as userFile;
import 'package:psych_help/services.dart';
import 'package:provider/provider.dart';
import 'package:psych_help/Loading.dart';

class ModComplainList extends StatefulWidget {
  @override
  _ModComplainList createState() => _ModComplainList();
}

// enum SingingChrUsrPsyLst { oncall, onsite }

class _ModComplainList extends State<ModComplainList> {
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
    return StreamProvider<List<ComplaintData>>.value(
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
          body: ComplaintLst(),
        ));
  }
}

class ComplaintLst extends StatefulWidget {
  @override
  _ComplaintLst createState() => _ComplaintLst();
}

class _ComplaintLst extends State<ComplaintLst> {
  @override
  Widget build(BuildContext context) {
    final complains = Provider.of<List<ComplaintData>>(context);
    if (complains == null) {
      return LoadingScreen();
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
                      text: 'Review:\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: complains[index].review,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '\nComplaint:\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: complains[index].complain,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '\nComplaint Type:\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: complains[index].type,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
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