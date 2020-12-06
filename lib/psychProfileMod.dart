import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:psych_help/editpsych.dart';
import 'package:psych_help/globals.dart';
import 'package:psych_help/services.dart';
import 'package:psych_help/editpsych.dart';
import 'package:psych_help/newcomplaint.dart';
import 'package:psych_help/globals.dart' as userFile;
// import 'package:psych_help/psychlist.dart';
// import 'package:psych_help/globals.dart';
// import 'package:psych_help/services.dart';

class PsyProfileMod extends StatefulWidget {
  @override
  final String firstName, lastName, pid, city;

  @override
  PsyProfileMod({this.firstName, this.lastName, this.pid, this.city});
  _PsyProfileMod createState() => _PsyProfileMod();
}

String fname;
TextEditingController _reviewController = TextEditingController();
String review = '';
String result = '';

List<String> litems = [];
Widget cancelButton = FlatButton(
  child: Text("Cancel"),
  onPressed: () {},
);
Widget continueButton = FlatButton(
  child: Text("Continue"),
  onPressed: () {},
);

class _PsyProfileMod extends State<PsyProfileMod> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: true,
      appBar:
          AppBar(title: Text('Psych Search'), backgroundColor: Colors.green),
      drawer: Drawer(
        child: Column(
          // Important: Remove any padding from the ListView.
          // padding: EdgeInsets.zero,
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
                Navigator.popUntil(
                    context, ModalRoute.withName(Navigator.defaultRouteName));
              },
            ),
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.green.shade300],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.5, 0.9],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.green.shade300,
                      minRadius: 35.0,
                      child: Icon(
                        Icons.call,
                        size: 30.0,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      minRadius: 60.0,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                            'https://scontent-sin6-2.xx.fbcdn.net/v/t1.0-9/1969304_722096291160404_4811753763754301623_n.jpg?_nc_cat=102&ccb=2&_nc_sid=174925&_nc_ohc=HstJEskV-6IAX9dJEWm&_nc_ht=scontent-sin6-2.xx&oh=ff1df406a07006c7f9828c927dd747b8&oe=5FED0FBA'),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.green.shade500,
                      minRadius: 35.0,
                      child: IconButton(
                        icon: Icon(
                          Icons.message,
                          size: 30.0,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewComplaint()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${widget.firstName}" + " " + "${widget.lastName}",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${widget.city}' + ', Pakistan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.green.shade300,
                    child: ListTile(
                      title: Text(
                        '5',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        'Average Rating',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                // Container(
                //     padding: new EdgeInsets.all(20.0),
                //     child: RatingBar.builder(
                //         initialRating: 3,
                //         minRating: 0,
                //         direction: Axis.horizontal,
                //         allowHalfRating: true,
                //         itemCount: 5,
                //         itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                //         itemBuilder: (context, _) => Icon(
                //               Icons.star,
                //               color: Colors.green,
                //             ),
                //         onRatingUpdate: (rating) {
                //           print(rating);
                //         })),
                // Divider(),
                // ListTile(
                //   title: Text(
                //     'Counseling Type',
                //     style: TextStyle(
                //       color: Colors.green,
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                //   subtitle: Text(
                //     'Child Psychologist',
                //     style: TextStyle(
                //       fontSize: 18,
                //     ),
                //   ),tr
                // ),
                // Padding(
                //     padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                //     child: Container(
                //         child: TextFormField(
                //       scrollPadding: new EdgeInsets.all(0.0),
                //       controller: _reviewController,
                //       maxLines: 2,
                //       decoration: InputDecoration(
                //           hintText: "Add A Review",
                //           suffixIcon: IconButton(
                //             icon: Icon(Icons.send),
                //             color: Colors.green,
                //             onPressed: () {
                //               litems.add(_reviewController.text);
                //               _reviewController.clear();
                //               setState(() {});
                //               showDialog(
                //                 //User friendly error message when the screen has been displayed
                //                 context: context,
                //                 builder: (_) => AlertDialog(
                //                   title: Text(
                //                     "Rating and review saved!",
                //                     textAlign: TextAlign.center,
                //                     style: TextStyle(fontSize: 28),
                //                   ),
                //                   content: SingleChildScrollView(
                //                     scrollDirection: Axis.vertical,
                //                     child: ListBody(
                //                       mainAxis: Axis.vertical,
                //                       children: <Widget>[
                //                         Icon(Icons.check,
                //                             color: Colors.green[300], size: 50),
                //                         // Text(
                //                         //     'Warning: Social Distance Violated!\nYou are at a distance of less than 2 metres from another person.'),
                //                       ],
                //                     ),
                //                   ),
                //                 ),
                //                 barrierDismissible: true,
                //               );
                //             },
                //           ),
                //           focusedBorder: UnderlineInputBorder(
                //             borderSide: BorderSide(color: Colors.green),
                //           )),
                //     ))
                //     ),
                //   ),
                // ),
                // Divider(),
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
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: litems.length,
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
                                      // GestureDetector(onTap: () async {
                                      //   result = await AppServices.psychDel(
                                      //       '${widget.pid}');
                                      //   print(result);
                                      //   if (result == "Success Deletion") {
                                      //     Navigator.pop(context);
                                      //   } else {
                                      //     //stay
                                      //   }
                                      // })
                                    ],
                                  ),
                                )
                              ],
                              context: context,
                              position: RelativeRect.fromLTRB(100, 500, 0, 0),
                            );
                          },
                          child: new Card(
                            child: ListTile(
                              leading: Icon(Icons.account_circle_rounded),
                              title: Text('Uzair Mustafa'),
                              subtitle: Text(litems[index]),

                              // trailing: Icon(Icons.account_circle_rounded),
                              isThreeLine: false,
                            ),
                          ));
                    })
              ],
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: <Widget>[
              SizedBox(width: 60),
              Container(
                height: 40.0,
                width: 275.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.red,
                  color: Colors.red,
                  elevation: 7.0,
                  child: InkWell(
                      hoverColor: Colors.red,
                      splashColor: Colors.blueAccent,
                      onTap: () async {
                        showDialog(
                          //User friendly error message when the screen has been displayed
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text(
                              "Are you sure you want to delete " +
                                  "${widget.firstName}" +
                                  " " +
                                  "${widget.lastName}" +
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
                                  result = await AppServices.psychDel(
                                      '${widget.pid}');
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
                      child: Center(
                        child: Text("Delete",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      )),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              SizedBox(width: 160),
              Container(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditPsych()), // Ye daal dena iss ke andar {this.firstName, this.lastName, this.pid, this.city, this.address, this.email, this.number}
                    );
                  },
                  child: Text('Edit Details',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
