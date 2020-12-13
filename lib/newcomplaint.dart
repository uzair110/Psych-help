import 'package:flutter/material.dart';
import 'package:psych_help/Sidebars.dart';
import 'package:psych_help/services.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:psych_help/addpsych.dart';
// import 'package:psych_help/psychlist.dart';
// import 'package:psych_help/globals.dart';
// import 'package:psych_help/services.dart';

class NewComplaint extends StatefulWidget {
  final String firstName, lastName, city;
  final int pid;
  @override
  NewComplaint({this.firstName, this.lastName, this.pid, this.city});
  _NewComplaint createState() => _NewComplaint();
}

class _NewComplaint extends State<NewComplaint> {
  String tempcomplaint;
  final complaintcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
          AppBar(title: Text('New Complaint'), backgroundColor: Colors.green),
      drawer: SideBarUser(),
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: <Widget>[
          Container(
            height: 150,
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
                  children: <Widget>[],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${widget.firstName}" + " ${widget.lastName}",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${widget.city}" + ', Pakistan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Divider(),
                ListTile(
                  title: Text(
                    'Please enter your complaint: ',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
            ),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: complaintcontroller,
            onChanged: (String text1) {
              tempcomplaint = complaintcontroller.text;
            },
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: RaisedButton(
              color: Colors.green,
              onPressed: () async {
                final result = await AppServices.addpsychComplaint(
                    complaintcontroller.text, widget.pid);
                print(result);
                if (result == "complaint added!") {
                  showDialog(
                    //User friendly error message when the screen has been displayed
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(
                        "You complaint has been lodged!",
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
                  ).then((value) => Navigator.pop(context));
                }
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: const Text('Submit Complaint',
                    style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewRevComplaint extends StatefulWidget {
  final String review;
  final int rid;
  @override
  NewRevComplaint({this.review, this.rid});
  _NewRevComplaint createState() => _NewRevComplaint();
}

class _NewRevComplaint extends State<NewRevComplaint> {
  String tempcomplaint;
  String dropdownValue = 'Misleading';
  final complaintcontroller = TextEditingController();
  //final ctypecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: Text('Review Complaint'), backgroundColor: Colors.green),
      drawer: SideBarUser(),
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Divider(),
                ListTile(
                  title: Text(
                    'Please enter your complaint: ',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
            ),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: complaintcontroller,
            onChanged: (String text1) {
              tempcomplaint = complaintcontroller.text;
              complaintcontroller.text = text1;
            },
          ),
          const SizedBox(height: 10),
          Container(
            child: Column(
              children: <Widget>[
                Divider(),
                ListTile(
                  title: Text(
                    'Choose Complain Type: ',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.6,
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.green[800]),
              underline: Container(
                height: 2,
                color: Colors.green,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>[
                'Misleading',
                'Abusive Language',
                'Vulgar Language',
                'Spam',
                'Hate Speech'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),

          // TextFormField(
          //   decoration: InputDecoration(
          //     contentPadding: EdgeInsets.all(10.0),
          //   ),
          //   keyboardType: TextInputType.multiline,
          //   maxLines: null,
          //   controller: ctypecontroller,
          //   onChanged: (txt2) {
          //     tempctype = ctypecontroller.text;
          //     ctypecontroller.text = txt2;
          //   },
          // ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: RaisedButton(
              color: Colors.green,
              onPressed: () async {
                var result = await AppServices.addreviewComplaint(
                    complaintcontroller.text, dropdownValue, widget.rid);
                if (result == "complaint added!") {
                  showDialog(
                    //User friendly error message when the screen has been displayed
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(
                        "You complaint has been lodged!",
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
                  ).then((_) => Navigator.pop(context));
                }
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: const Text('Submit Complaint',
                    style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
