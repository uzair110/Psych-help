import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psych_help/Loading.dart';
import 'package:psych_help/Mapper.dart';
import 'package:psych_help/myrating.dart';
import 'package:psych_help/services.dart';
import 'package:psych_help/newcomplaint.dart';
import 'package:psych_help/globals.dart' as userFile;
import 'package:rating_bar/rating_bar.dart';

class UsrPsychRevList extends StatefulWidget {
  final int pid;

  UsrPsychRevList({this.pid});
  @override
  _UsrPsychRevList createState() => _UsrPsychRevList();
}

class _UsrPsychRevList extends State<UsrPsychRevList> {
  final int pid;
  _UsrPsychRevList({this.pid});
  // UsrPsychList({this.first_name, this.last_name, this.id})
  double avgRat = 0.0;
  @override
  Widget build(BuildContext context) {
    final revs = Provider.of<List<PsychRevData>>(context);
    if (revs == null) {
      return LoadingScreen();
    } else if (revs == [] || revs.length == 0) {
      print("Nothing to see here");
      return Column(children: <Widget>[
        SizedBox(height: 20),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: ListTile(
                    title: Text(
                      avgRat.toStringAsFixed(1),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.green,
                      ),
                    ),
                    subtitle: Text(
                      'Average Rating',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        ListTile(
          title: Text(
            'Reviews',
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Text("No Items to Display"),
        ),
      ]);
    } else {
      List<double> ratLst = List<double>.from(revs.map((val) {
        return val.rating;
      }));
      var count = ratLst.length;
      avgRat = ratLst.reduce((a, b) => a + b) / count;
      print(avgRat);
      return Column(
        children: <Widget>[
          SizedBox(height: 20),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: ListTile(
                      title: Text(
                        avgRat.toStringAsFixed(1),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.green,
                        ),
                      ),
                      subtitle: Text(
                        'Average Rating',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text(
              'Reviews',
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: revs.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      Text(
                        revs[index].firstName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                        textAlign: TextAlign.left,
                      ),
                      RatingBar.readOnly(
                        size: 20,
                        initialRating: revs[index].rating,
                        isHalfAllowed: true,
                        halfFilledIcon: Icons.star_half,
                        filledIcon: Icons.star,
                        filledColor: Colors.green,
                        emptyIcon: Icons.star_border,
                      ),
                      Text(
                        revs[index].review,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                      (revs[index].uid == userFile.usrData.uid)
                          ? Container()
                          : FlatButton(
                              color: Colors.transparent,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewRevComplaint(
                                            review: revs[index].review,
                                            rid: revs[index].revID,
                                          )),
                                );
                              },
                              child: Text(
                                "Report Review",
                                style: TextStyle(
                                    fontSize: 13.0, color: Colors.red),
                              ),
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      FutureBuilder<String>(
                          future: AppServices.usrvoteId(revs[index].revID),
                          builder: (context, AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data == "No Votes") {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '${revs[index].upvote}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    //(await )
                                    IconButton(
                                        icon: Icon(
                                          Icons.thumb_up,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () async {
                                          var res =
                                              await AppServices.updateVoteId(
                                                  revs[index].revID, '4', 1, 0);
                                          print(res);
                                          setState(() {
                                            revs[index].upvote =
                                                revs[index].upvote + 1;
                                          });
                                        }),
                                    Text(
                                      '${revs[index].downvote}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    IconButton(
                                        icon: Icon(
                                          Icons.thumb_down,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () async {
                                          var res =
                                              await AppServices.updateVoteId(
                                                  revs[index].revID, '4', 0, 1);
                                          print(res);
                                          setState(() {
                                            revs[index].downvote =
                                                revs[index].downvote + 1;
                                          });
                                        }),
                                  ],
                                );
                              } else if (snapshot.data == "UpVote") {
                                print("upv");
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '${revs[index].upvote}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    //(await )
                                    IconButton(
                                        icon: Icon(
                                          Icons.thumb_up,
                                          color: Colors.green,
                                        ),
                                        onPressed: () async {
                                          var res =
                                              await AppServices.updateVoteId(
                                                  revs[index].revID,
                                                  '3',
                                                  -1,
                                                  0);
                                          print(res);
                                          setState(() {
                                            revs[index].upvote =
                                                revs[index].upvote - 1;
                                          });
                                        }),
                                    Text(
                                      '${revs[index].downvote}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    IconButton(
                                        icon: Icon(
                                          Icons.thumb_down,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () async {
                                          var res =
                                              await AppServices.updateVoteId(
                                                  revs[index].revID,
                                                  '2',
                                                  -1,
                                                  1);
                                          print(res);
                                          setState(() {
                                            revs[index].upvote =
                                                revs[index].upvote - 1;
                                            revs[index].downvote =
                                                revs[index].downvote + 1;
                                          });
                                        }),
                                  ],
                                );
                              } else if (snapshot.data == "DownVote") {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '${revs[index].upvote}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    //(await )
                                    IconButton(
                                        icon: Icon(
                                          Icons.thumb_up,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () async {
                                          var res =
                                              await AppServices.updateVoteId(
                                                  revs[index].revID,
                                                  '1',
                                                  1,
                                                  -1);
                                          print(res);
                                          setState(() {
                                            revs[index].upvote =
                                                revs[index].upvote + 1;
                                            revs[index].downvote =
                                                revs[index].downvote - 1;
                                          });
                                        }),
                                    Text(
                                      '${revs[index].downvote}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    IconButton(
                                        icon: Icon(
                                          Icons.thumb_down,
                                          color: Colors.green,
                                        ),
                                        onPressed: () async {
                                          var res =
                                              await AppServices.updateVoteId(
                                                  revs[index].revID,
                                                  '3',
                                                  0,
                                                  -1);
                                          print(res);
                                          setState(() {
                                            revs[index].downvote =
                                                revs[index].downvote - 1;
                                          });
                                        }),
                                  ],
                                );
                              } else {
                                print("null");
                                return Text("null");
                              }
                              //setState(() {});
                            } else {
                              return Text("Loading Review...");
                            }
                          }),
                    ],
                  ),
                );
              }),
        ],
      );
    }
  }
}

class ModPsychRevList extends StatefulWidget {
  final int pid;

  ModPsychRevList({this.pid});
  @override
  _ModPsychRevList createState() => _ModPsychRevList();
}

class _ModPsychRevList extends State<ModPsychRevList> {
  final int pid;
  _ModPsychRevList({this.pid});

  double avgRat = 0.0;
  @override
  Widget build(BuildContext context) {
    final revs = Provider.of<List<PsychRevData>>(context);
    if (revs == null) {
      return LoadingScreen();
    } else if (revs == [] || revs.length == 0) {
      print("Nothing to see here");
      return Column(children: <Widget>[
        SizedBox(height: 20),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: ListTile(
                    title: Text(
                      avgRat.toStringAsFixed(1),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.green,
                      ),
                    ),
                    subtitle: Text(
                      'Average Rating',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        ListTile(
          title: Text(
            'Reviews',
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Text("No Items to Display"),
        ),
      ]);
    } else {
      List<double> ratLst = List<double>.from(revs.map((val) {
        return val.rating;
      }));
      var count = ratLst.length;
      avgRat = ratLst.reduce((a, b) => a + b) / count;
      print(avgRat);
      return Column(children: <Widget>[
        SizedBox(height: 20),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: ListTile(
                    title: Text(
                      avgRat.toStringAsFixed(1),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.green,
                      ),
                    ),
                    subtitle: Text(
                      'Average Rating',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        ListTile(
          title: Text(
            'Reviews',
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: revs.length,
            itemBuilder: (context, index) {
              return InkWell(
                onLongPress: () {
                  showDialog(
                    //User friendly error message when the screen has been displayed
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(
                        "Delete This Rating",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 28),
                      ),
                      content: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: ListBody(
                          mainAxis: Axis.vertical,
                          children: <Widget>[
                            Icon(Icons.delete_forever,
                                color: Colors.red[300], size: 50),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () async {
                            showDialog(
                              //User friendly error message when the screen has been displayed
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text(
                                  "Are you sure you want to Blacklist " +
                                      "${revs[index].firstName}" +
                                      " " +
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
                                      final result =
                                          await AppServices.blacklist(
                                              revs[index].uid);
                                      print(result);
                                      if (result == "user blacklisted1") {
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
                                      //Navigator.pop(context);
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
                          child: Text("Blacklist " + revs[index].firstName),
                        ),
                        FlatButton(
                          onPressed: () async {
                            final result = await AppServices.delReview(
                                revs[index].ratID, revs[index].revID);
                            print(result);
                            if (result ==
                                "deleting rating and review success!") {
                              Navigator.pop(context);
                              showDialog(
                                //User friendly error message when the screen has been displayed
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text(
                                    "Successfully deleted review!",
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
                                        // Text(
                                        //     'Warning: Social Distance Violated!\nYou are at a distance of less than 2 metres from another person.'),
                                      ],
                                    ),
                                  ),
                                ),
                                barrierDismissible: true,
                              );
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
                                        Icon(Icons.check,
                                            color: Colors.green[300], size: 50),
                                        // Text(
                                        //     'Warning: Social Distance Violated!\nYou are at a distance of less than 2 metres from another person.'),
                                      ],
                                    ),
                                  ),
                                ),
                                barrierDismissible: true,
                              );
                            }
                          },
                          child: Text("Delete"),
                        ),
                        FlatButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text("Cancel"),
                        )
                      ],
                    ),
                    barrierDismissible: false,
                  );
                },
                child: new Card(
                  child: Column(
                    children: <Widget>[
                      Text(
                        revs[index].firstName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                        textAlign: TextAlign.left,
                      ),
                      RatingBar.readOnly(
                        size: 20,
                        initialRating: revs[index].rating,
                        isHalfAllowed: true,
                        halfFilledIcon: Icons.star_half,
                        filledIcon: Icons.star,
                        filledColor: Colors.green,
                        emptyIcon: Icons.star_border,
                      ),
                      Text(
                        revs[index].review,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                      //await ()
                    ],
                  ),
                ),
              );
            }),
      ]);
    }
  }
}

class UsrRevList extends StatefulWidget {
  @override
  _UsrRevList createState() => _UsrRevList();
}

class _UsrRevList extends State<UsrRevList> {
  // UsrPsychList({this.first_name, this.last_name, this.id})
  @override
  Widget build(BuildContext context) {
    final revs = Provider.of<List<PsychRevData>>(context);
    if (revs == null) {
      return LoadingScreen();
    } else if (revs == [] || revs.length == 0) {
      print("Nothing to see here");
      return Center(
        child: Text("No Items to Display"),
      );
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: revs.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditRating(
                            ratID: revs[index].ratID,
                            revID: revs[index].revID,
                            theReview: revs[index].review,
                            theRating: revs[index].rating,
                          )),
                );
              },
              onLongPress: () {
                showDialog(
                  //User friendly error message when the screen has been displayed
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(
                      "Delete This Rating",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 28),
                    ),
                    content: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: ListBody(
                        mainAxis: Axis.vertical,
                        children: <Widget>[
                          Icon(Icons.delete_forever,
                              color: Colors.red[300], size: 50),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () async {
                          final result = await AppServices.delUsrReview(
                              revs[index].ratID, revs[index].revID);

                          print(result);
                          if (result ==
                              "deleting my rating and review success!") {
                            Navigator.pop(context);
                            showDialog(
                              //User friendly error message when the screen has been displayed
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text(
                                  "Successfully deleted review!",
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
                                      // Text(
                                      //     'Warning: Social Distance Violated!\nYou are at a distance of less than 2 metres from another person.'),
                                    ],
                                  ),
                                ),
                              ),
                              barrierDismissible: true,
                            );
                          } else {
                            showDialog(
                              //User friendly error message when the screen has been displayed
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text(
                                  "Connection Failure!",
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
                                      // Text(
                                      //     'Warning: Social Distance Violated!\nYou are at a distance of less than 2 metres from another person.'),
                                    ],
                                  ),
                                ),
                              ),
                              barrierDismissible: true,
                            );
                          }
                        },
                        child: Text("Delete"),
                      ),
                      FlatButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text("Cancel"),
                      )
                    ],
                  ),
                  barrierDismissible: false,
                );
              },
              child: new Card(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Psychologist: Dr. ${revs[index].psyfirstName} ${revs[index].psylastName}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                    RatingBar.readOnly(
                      size: 20,
                      initialRating: revs[index].rating,
                      isHalfAllowed: true,
                      halfFilledIcon: Icons.star_half,
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                    ),
                    Text(
                      revs[index].review,
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            );
          });
    }
  }
}
