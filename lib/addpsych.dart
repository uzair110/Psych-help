import 'package:flutter/material.dart';
import 'package:psych_help/Sidebars.dart';
import 'package:psych_help/services.dart';

class AddPsych extends StatefulWidget {
  @override
  _AddPsych createState() => _AddPsych();
}

class _AddPsych extends State<AddPsych> {
  TextEditingController fname = new TextEditingController();
  TextEditingController lname = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController city = new TextEditingController();
  TextEditingController email = new TextEditingController();
  String dropdownCType = 'Clinic Appointment';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('Add Psych'), backgroundColor: Colors.green),
      drawer: SideBarMod(),
      resizeToAvoidBottomPadding: true,
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
              child: Column(children: <Widget>[
                TextFormField(
                  controller: fname,
                  // validator: (_) =>
                  // result == 'Failed' ? 'Invalid Id/Password' : null,
                  cursorColor: Colors.green,
                  cursorWidth: 2.0,
                  decoration: InputDecoration(
                      labelText: 'First Name',
                      labelStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )),
                )
              ])),
          Container(
              padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
              child: Column(children: <Widget>[
                TextFormField(
                  controller: lname,
                  // validator: (_) =>
                  // result == 'Failed' ? 'Invalid Id/Password' : null,
                  cursorColor: Colors.green,
                  cursorWidth: 2.0,
                  decoration: InputDecoration(
                      labelText: 'Last Name',
                      labelStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )),
                )
              ])),
          Container(
              padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
              child: Column(children: <Widget>[
                TextFormField(
                  controller: phone,
                  // validator: (_) =>
                  //     result == 'Failed' ? 'Invalid Id/Password' : null,
                  cursorColor: Colors.green,
                  cursorWidth: 2.0,
                  decoration: InputDecoration(
                      labelText: 'Number',
                      labelStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )),
                )
              ])),
          Container(
              padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
              child: Column(children: <Widget>[
                TextFormField(
                  controller: email,
                  // validator: (_) =>
                  //     result == 'Failed' ? 'Invalid Id/Password' : null,
                  cursorColor: Colors.green,
                  cursorWidth: 2.0,
                  decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )),
                )
              ])),
          Container(
              padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
              child: Column(children: <Widget>[
                TextFormField(
                  controller: address,
                  // validator: (_) =>
                  //     result == 'Failed' ? 'Invalid Id/Password' : null,
                  cursorColor: Colors.green,
                  cursorWidth: 2.0,
                  decoration: InputDecoration(
                      labelText: 'Address',
                      labelStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )),
                )
              ])),
          Container(
              padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
              child: Column(children: <Widget>[
                TextFormField(
                  controller: city,
                  // validator: (_) =>
                  //     result == 'Failed' ? 'Invalid Id/Password' : null,
                  cursorColor: Colors.green,
                  cursorWidth: 2.0,
                  decoration: InputDecoration(
                      labelText: 'City',
                      labelStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )),
                )
              ])),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.6,
            child: DropdownButton<String>(
              value: dropdownCType,
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
                  dropdownCType = newValue;
                });
              },
              items: <String>['Clinic Appointment', 'On Call Counselling']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 30.0),
          Center(
              child: Container(
            height: 40.0,
            width: 300.0,
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Colors.greenAccent,
              elevation: 7.0,
              color: Colors.green,
              child: InkWell(
                  onTap: () async {
                    var psychAddResponse = await AppServices.psychAdd(
                        fname.text,
                        lname.text,
                        int.parse(phone.text),
                        email.text,
                        address.text,
                        dropdownCType,
                        city.text);
                    print(psychAddResponse);
                    if (psychAddResponse == "Successfully Added Psychologist") {
                      showDialog(
                        //User friendly error message when the screen has been displayed
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text(
                            "Successfully added Psychologist!",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 28),
                          ),
                          content: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: ListBody(
                              mainAxis: Axis.vertical,
                              children: <Widget>[
                                Icon(Icons.check,
                                    color: Colors.red[300], size: 50),
                              ],
                            ),
                          ),
                        ),
                        barrierDismissible: true,
                      ).then(
                        (_) => Navigator.pop(context),
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
                                Icon(Icons.clear,
                                    color: Colors.red[300], size: 50),
                              ],
                            ),
                          ),
                        ),
                        barrierDismissible: true,
                      );
                    }
                  },
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ),
          )),
          SizedBox(height: 30.0),
          SizedBox(height: 30.0),
          SizedBox(height: 30.0),
          SizedBox(height: 30.0),
          SizedBox(height: 30.0),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
