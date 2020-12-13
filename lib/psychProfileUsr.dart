import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:psych_help/newcomplaint.dart';
import 'package:psych_help/Sidebars.dart';
import 'package:provider/provider.dart';
import 'package:psych_help/RatingBuilder.dart';
import 'package:psych_help/Mapper.dart';
import 'package:psych_help/services.dart';
import 'package:psych_help/globals.dart' as userFile;

class PsyProfileUsr extends StatefulWidget {
  final String firstName, lastName, city, address, email, ctype;
  final int pid, number;

  @override
  PsyProfileUsr(
      {this.firstName,
      this.lastName,
      this.pid,
      this.city,
      this.number,
      this.address,
      this.email,
      this.ctype});
  _PsyProfileUsr createState() => _PsyProfileUsr();
}

TextEditingController _reviewController = TextEditingController();
String review = '';
String myrating;
//String avg_rating = '';
List<String> litems = [];

class _PsyProfileUsr extends State<PsyProfileUsr> {
  Future getData() async {
    // final response = await AppServices.getRating(widget.pid);
    // avg_rating = response;
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return StreamProvider<List<PsychRevData>>.value(
      value: AppServices.viewPsychRevUsr(widget.pid).asStream(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            title: Text('Psychologist Details'), backgroundColor: Colors.green),
        drawer: SideBarUser(),
        resizeToAvoidBottomPadding: false,
        body: ListView(
          children: <Widget>[
            Container(
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
                  // CircleAvatar(
                  //   backgroundColor: Colors.green.shade300,
                  //   minRadius: 35.0,
                  //   child: Icon(
                  //     Icons.call,
                  //     size: 30.0,
                  //   ),
                  // ),
                  // CircleAvatar(
                  //   backgroundColor: Colors.white70,
                  //   minRadius: 60.0,
                  //   child: CircleAvatar(
                  //     radius: 50.0,
                  //     backgroundImage: NetworkImage(
                  //         'https://scontent-sin6-2.xx.fbcdn.net/v/t1.0-9/1969304_722096291160404_4811753763754301623_n.jpg?_nc_cat=102&ccb=2&_nc_sid=174925&_nc_ohc=HstJEskV-6IAX9dJEWm&_nc_ht=scontent-sin6-2.xx&oh=ff1df406a07006c7f9828c927dd747b8&oe=5FED0FBA'),
                  //   ),
                  // ),
                  Column(children: <Widget>[
                    Text(
                      "${widget.firstName}" + " " + "${widget.lastName}",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'City: ' + '${widget.city}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Phone Number: ' + '${widget.number}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Email: ' + '${widget.email}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Counselling Type: ' + '${widget.ctype}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Address: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '${widget.address}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ]),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Report Psychologist: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          )),
                      CircleAvatar(
                        backgroundColor: Colors.green[900],
                        minRadius: 25.0,
                        child: IconButton(
                          icon: Icon(
                            Icons.report,
                            size: 30.0,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewComplaint(
                                        firstName: "${widget.firstName}",
                                        lastName: "${widget.lastName}",
                                        pid: widget.pid,
                                        city: "${widget.city}",
                                      )),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            // Container(
            //   child: Row(
            //     children: <Widget>[
            //       Expanded(
            //         child: Container(
            //           color: Colors.green.shade300,
            //           child: ListTile(
            //             title: Text(
            //               avg_rating,
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 30,
            //                 color: Colors.white,
            //               ),
            //             ),
            //             subtitle: Text(
            //               'Average Rating',
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                 fontSize: 20,
            //                 color: Colors.white70,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                      padding: new EdgeInsets.all(20.0),
                      child: RatingBar.builder(
                          initialRating: 0,
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
                            myrating = rating.toString();
                            print(rating);
                          })),
                  Divider(),
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
                  Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Container(
                          child: TextFormField(
                        scrollPadding: new EdgeInsets.all(0.0),
                        controller: _reviewController,
                        maxLines: 2,
                        decoration: InputDecoration(
                            hintText: "Add A Review",
                            suffixIcon: IconButton(
                              icon: Icon(Icons.send),
                              color: Colors.green,
                              onPressed: () async {
                                review = _reviewController.text;
                                litems.add(_reviewController.text);
                                _reviewController.clear();
                                setState(() {});

                                final result =
                                    await AppServices.addRatingReview(
                                        myrating,
                                        review,
                                        userFile.usrData.uid,
                                        widget.pid);
                                print(result);
                                if (result ==
                                    "Successfully inserted rating and review!") {
                                  FocusScope.of(context).unfocus();
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
                                                color: Colors.green[300],
                                                size: 50),
                                            // Text(
                                            //     'Warning: Social Distance Violated!\nYou are at a distance of less than 2 metres from another person.'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    barrierDismissible: true,
                                  );
                                } else {
                                  FocusScope.of(context).unfocus();
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
                                                color: Colors.green[300],
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
                              },
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            )),
                      ))),
                  //   ),
                  // ),
                  // Divider(),
                  // ListTile(
                  //   title: Text(
                  //     'Reviews',
                  //     style: TextStyle(
                  //       color: Colors.green,
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  UsrPsychRevList(
                    pid: widget.pid,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
