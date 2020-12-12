import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psych_help/services.dart';
import 'package:psych_help/Mapper.dart';
import 'package:psych_help/RatingBuilder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:psych_help/Sidebars.dart';
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
    return StreamProvider<List<PsychRevData>>.value(
        value: AppServices.viewRevUsr().asStream(),
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => {Navigator.pop(context)}),
            title: Text('My Ratings and Reviews'),
            backgroundColor: Colors.green,
          ),
          body: UsrRevList(),
        ));
  }
}

class EditRating extends StatefulWidget {
  final int ratId;
  final double theRating;
  final String theReview;
  @override
  EditRating({this.ratId, this.theRating, this.theReview});
  _EditRating createState() => _EditRating();
}

TextEditingController _reviewController = TextEditingController();
String review = '';
List<String> litems = [];

class _EditRating extends State<EditRating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar:
          AppBar(title: Text('Psych Search'), backgroundColor: Colors.green),
      drawer: SideBarUser(),
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
                padding: new EdgeInsets.all(20.0),
                child: RatingBar.builder(
                    initialRating: widget.theRating,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    })),
            Divider(),
            Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Container(
                    child: TextFormField(
                  initialValue: widget.theReview,
                  scrollPadding: new EdgeInsets.all(0.0),
                  controller: _reviewController,
                  maxLines: 2,
                  decoration: InputDecoration(
                      hintText: "Add A Review",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        color: Colors.green,
                        onPressed: () {
                          litems.add(_reviewController.text);
                          _reviewController.clear();
                          setState(() {});
                          showDialog(
                            //User friendly error message when the screen has been displayed
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text(
                                "Rating and review saved!",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 28),
                              ),
                              content: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: ListBody(
                                  mainAxis: Axis.vertical,
                                  children: <Widget>[
                                    Icon(Icons.check,
                                        color: Colors.green[300], size: 50),
                                  ],
                                ),
                              ),
                            ),
                            barrierDismissible: true,
                          );
                        },
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )),
                ))),
          ],
        ),
      ),
    );
  }
}
