import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:psych_help/Sidebars.dart';

class EditRating extends StatefulWidget {
  final int ratId, theRating;
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
                    initialRating: 2,
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
                                    // Text(
                                    //     'Warning: Social Distance Violated!\nYou are at a distance of less than 2 metres from another person.'),
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
