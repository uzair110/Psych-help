import 'package:flutter/material.dart';
import 'package:psych_help/services.dart';

class AddPsych extends StatefulWidget {
  @override
  _AddPsych createState() => _AddPsych();
}

enum SingingCharacter { oncall, onsite }

class _AddPsych extends State<AddPsych> {
  TextEditingController fname = new TextEditingController();
  TextEditingController lname = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController city = new TextEditingController();
  TextEditingController email = new TextEditingController();

  SingingCharacter _character = SingingCharacter.oncall;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('Add Psych'), backgroundColor: Colors.green),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Username'),
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
          ListTile(
            title: const Text('On Call'),
            leading: Radio(
              value: SingingCharacter.oncall,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('On Site'),
            leading: Radio(
              value: SingingCharacter.onsite,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
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
              child: GestureDetector(
                  onTap: () async {
                    var psychAddResponse = await AppServices.psychAdd(
                        fname.toString(),
                        lname.toString(),
                        phone.toString(),
                        email.toString(),
                        address.toString(),
                        _character.toString(),
                        city.toString());

                    Navigator.popUntil(context,
                        ModalRoute.withName(Navigator.defaultRouteName));
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
