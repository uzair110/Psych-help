import 'package:flutter/material.dart';
import 'package:psych_help/Sidebars.dart';
import 'package:psych_help/services.dart';

class EditPsych extends StatefulWidget {
  final String firstName, lastName, city1, address1, email1, ctype;
  final int pid, number;
  @override
  EditPsych(
      {this.firstName,
      this.lastName,
      this.pid,
      this.city1,
      this.address1,
      this.email1,
      this.ctype,
      this.number});
  _EditPsych createState() => new _EditPsych(
      firstName: firstName,
      lastName: lastName,
      city1: city1,
      address1: address1,
      email1: email1,
      ctype: ctype,
      pid: pid,
      number: number);
}

// enum SingingCharacter { oncall, onsite }

class _EditPsych extends State<EditPsych> {
  String firstName, lastName, city1, address1, email1, ctype;
  int pid, number;

  _EditPsych(
      {this.firstName,
      this.lastName,
      this.pid,
      this.city1,
      this.address1,
      this.email1,
      this.ctype,
      this.number});

  TextEditingController fname = new TextEditingController();
  TextEditingController lname = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController city = new TextEditingController();
  TextEditingController email = new TextEditingController();
  String dropdownCType = 'Clinic Appointment';
  // SingingCharacter _character = SingingCharacter.oncall;
  // int index = 0;

  @override
  void initState() {
    super.initState();
    fname.text = firstName;
    lname.text = lastName;
    city.text = city1;
    address.text = address1;
    email.text = email1;
    phone.text = number.toString();
    dropdownCType = ctype;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text('Edit Psych'), backgroundColor: Colors.green),
      drawer: SideBarMod(),
      resizeToAvoidBottomPadding: false,
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
              child: Column(children: <Widget>[
                TextFormField(
                  //initialValue: widget.firstName,
                  controller: fname,
                  // validator: (_) =>
                  // result == 'Failed' ? 'Invalid Id/Password' : null,
                  cursorColor: Colors.green,
                  cursorWidth: 2.0,
                  decoration: InputDecoration(
                      labelText: firstName,
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
          // ListTile(
          //   title: const Text('On Call'),
          //   leading: Radio(
          //     value: SingingCharacter.oncall,
          //     groupValue: _character,
          //     onChanged: (SingingCharacter value) {
          //       setState(() {
          //         _character = value;
          //         index = 0;
          //       });
          //     },
          //   ),
          // ),
          // ListTile(
          //   title: const Text('On Site'),
          //   leading: Radio(
          //     value: SingingCharacter.onsite,
          //     groupValue: _character,
          //     onChanged: (SingingCharacter value) {
          //       setState(() {
          //         _character = value;
          //         index = 1;
          //       });
          //     },
          //   ),
          // ),
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
                    var psychAddResponse = await AppServices.psychEdit(
                        fname.text,
                        lname.text,
                        int.parse(phone.text),
                        email.text,
                        address.text,
                        dropdownCType,
                        city.text,
                        widget.pid);
                    print(psychAddResponse);
                    if (psychAddResponse ==
                        "Successfully Updated Psychologist") {
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
                                    color: Colors.red[300], size: 50),
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
