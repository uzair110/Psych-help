import 'package:flutter/material.dart';
import 'package:psych_help/main.dart';
import 'package:psych_help/utilities/sizeConfig.dart';
import 'package:psych_help/services.dart';

void firstSignUp() => runApp(SignUp());

String tempEmail = "";
String tempfname = "";
String tempPass1 = "";
String tempPass2 = "";
String templname = "";
String tempcity = "";

class SignUp extends StatefulWidget {
  @override
  SignUp({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final fnamecontroller = TextEditingController();
  final lnamecontroller = TextEditingController();
  final citycontroller = TextEditingController();
  final pass1controller = TextEditingController();
  final pass2controller = TextEditingController();
  final usernamecontroller = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    fnamecontroller.dispose();
    pass1controller.dispose();
    pass2controller.dispose();
    usernamecontroller.dispose();
    lnamecontroller.dispose();
    citycontroller.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      body: Container(
          child: Center(
              child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildSignUpText(),
          SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
          firstName(),
          SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
          lastName(),
          SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
          city(),
          SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
          usernameContainer(),
          SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
          containerPassword1(),
          SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
          containerPassword2(),
          SizedBox(height: SizeConfig.safeBlockHorizontal * 12),
          _confirmbutton(),
          SizedBox(height: SizeConfig.safeBlockHorizontal * 50),
        ],
      ))),
    );
  }

  Container _buildSignUpText() {
    return Container(
        margin: EdgeInsets.only(top: 76),
        child: Center(
          child: Text(
            "Signup to PsychSearch!",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff707070),
                fontSize: 42,
                fontWeight: FontWeight.bold),
          ),
        ));
  }

  //Text field input for SignUp
  Container firstName() {
    return Container(
        child: Center(
            child: Container(
                width: 230,
                child: TextField(
                  controller: fnamecontroller,
                  onChanged: (String text1) {
                    tempEmail = text1;
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.green, width: 3.0)),
                    hintText: "First Name",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ))));
  }

  Container lastName() {
    return Container(
        child: Center(
            child: Container(
                width: 230,
                child: TextField(
                  controller: lnamecontroller,
                  onChanged: (String text6) {
                    templname = text6;
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.green, width: 3.0)),
                    hintText: "Last Name",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ))));
  }

  Container city() {
    return Container(
        child: Center(
            child: Container(
                width: 230,
                child: TextField(
                  controller: citycontroller,
                  onChanged: (String text7) {
                    tempcity = text7;
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.green, width: 3.0)),
                    hintText: "City",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ))));
  }

  Container usernameContainer() {
    return Container(
        child: Center(
            child: Container(
                width: 230,
                child: TextField(
                  controller: usernamecontroller,
                  onChanged: (String text4) {
                    tempfname = text4;
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.green, width: 3.0)),
                    hintText: "New Username",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ))));
  }

  Container containerPassword1() {
    return Container(
        child: Center(
            child: Container(
                width: 230,
                child: TextField(
                  controller: pass1controller,
                  onChanged: (String text2) {
                    tempPass1 = text2;
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.green, width: 3.0)),
                    hintText: "Enter Password",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ))));
  }

  Container containerPassword2() {
    return Container(
        child: Center(
            child: Container(
                width: 230,
                child: TextField(
                  controller: pass2controller,
                  onChanged: (String text3) {
                    tempPass2 = text3;
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.green, width: 3.0)),
                    hintText: "Re-enter Password",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ))));
  }

  //sets SignUp in User object
  Container _confirmbutton() {
    return Container(
      child: Center(
          child: InkWell(
              child: Text("Confirm",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  )),
              onTap: () async {
                if (pass2controller.text != pass1controller.text) {
                  showDialog(
                    //User friendly error message when the screen has been displayed
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(
                        "Password Not Same",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 28),
                      ),
                      content: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: ListBody(
                          mainAxis: Axis.vertical,
                          children: <Widget>[
                            Icon(Icons.clear, color: Colors.red[300], size: 50),
                            // Text(
                            //     'Warning: Social Distance Violated!\nYou are at a distance of less than 2 metres from another person.'),
                          ],
                        ),
                      ),
                    ),
                    barrierDismissible: true,
                  );
                } else {
                  result = await AppServices.signup(
                      fnamecontroller.text,
                      lnamecontroller.text,
                      usernamecontroller.text,
                      pass2controller.text,
                      citycontroller.text);
                  print(result);
                  if (result == "Failure") {
                    showDialog(
                      //User friendly error message when the screen has been displayed
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(
                          "Sign-Up Failed",
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
                  } else {
                    print(result);
                    //_formKey.currentState.validate();
                    Navigator.popUntil(context,
                        ModalRoute.withName(Navigator.defaultRouteName));
                  }
                }
              })),
    );
  }
}
