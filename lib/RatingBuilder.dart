import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psych_help/Loading.dart';
import 'package:psych_help/Mapper.dart';
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
  @override
  Widget build(BuildContext context) {
    final revs = Provider.of<List<PsychRevData>>(context);
    if (revs == null) {
      return LoadingScreen();
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: revs.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: <Widget>[
                  Text(
                    revs[index].firstName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
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
                  //await ()
                ],
              ),
            );
          });
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
  // UsrPsychList({this.first_name, this.last_name, this.id})
  @override
  Widget build(BuildContext context) {
    final revs = Provider.of<List<PsychRevData>>(context);
    if (revs == null) {
      return LoadingScreen();
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: revs.length,
          itemBuilder: (context, index) {
            return InkWell(
              onLongPress: () {
                print("Card Clicked");
                showMenu(
                  items: <PopupMenuEntry>[
                    PopupMenuItem(
                      value: this.widget,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.delete),
                          Text("Delete"),
                          GestureDetector(onTap: () async {
                            print("Del Button Pressed");
                            //   result = await AppServices.psychDel(
                            //       '${widget.pid}');
                            //   print(result);
                            //   if (result == "Success Deletion") {
                            //     Navigator.pop(context);
                            //   } else {
                            //     //stay
                            //   }
                          })
                        ],
                      ),
                    )
                  ],
                  context: context,
                  position: RelativeRect.fromLTRB(100, 500, 0, 0),
                );
              },
              child: new Card(
                child: Column(
                  children: <Widget>[
                    Text(
                      revs[index].firstName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
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
                    //await ()
                  ],
                ),
              ),
            );
          });
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
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: revs.length,
          itemBuilder: (context, index) {
            return InkWell(
              onLongPress: () {
                print("Card Clicked");
                showMenu(
                  items: <PopupMenuEntry>[
                    PopupMenuItem(
                      value: this.widget,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.delete),
                          Text("Delete"),
                          GestureDetector(onTap: () async {
                            print("Del Button Pressed");
                            //   result = await AppServices.psychDel(
                            //       '${widget.pid}');
                            //   print(result);
                            //   if (result == "Success Deletion") {
                            //     Navigator.pop(context);
                            //   } else {
                            //     //stay
                            //   }
                          })
                        ],
                      ),
                    )
                  ],
                  context: context,
                  position: RelativeRect.fromLTRB(100, 500, 0, 0),
                );
              },
              child: new Card(
                child: Column(
                  children: <Widget>[
                    Text(
                      "${revs[index].psyfirstName} ${revs[index].psylastName}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
