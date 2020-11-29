import 'package:flutter/material.dart';
import 'package:psych_help/main.dart';
import 'package:psych_help/utilities/sizeConfig.dart';


void firstSignUp() => runApp(SignUp());

String temp_email = "";
String temp_username = "";
String temp_pass1 = "";
String temp_pass2 = "";

class SignUp extends StatefulWidget {
  @override
  SignUp({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SignUpState createState() => _SignUpState();
}


class _SignUpState extends State<SignUp> {
  @override
  final emailcontroller = TextEditingController();
  final pass1controller = TextEditingController();
  final pass2controller = TextEditingController();
  final usernamecontroller = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailcontroller.dispose();
    pass1controller.dispose();
    pass2controller.dispose();
    usernamecontroller.dispose();
    
    super.dispose();
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSignUpText(),
              // SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
              // _EmailAddress(),
              SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
              _Username(),
              SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
              _Password1(),
              SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
              _Password2(),
              SizedBox(height: SizeConfig.safeBlockHorizontal * 12),
              _confirmbutton(),
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
  // Container _EmailAddress() {
  //   return Container(
  //       child: Center(
  //           child: Container(
  //               width: 230,
  //               child: TextField(
  //                 controller: emailcontroller,
  //                 onChanged: (String text1) {
  //                   temp_email = text1;
  //                 },
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   color: Color(0xFF66CCCC),
  //                   fontSize: 20,
  //                 ),
  //                 textAlign: TextAlign.center,
  //                 decoration: InputDecoration(
  //                   border: InputBorder.none,
  //                   enabledBorder: UnderlineInputBorder(
  //                       borderSide: const BorderSide(
  //                           color: Color(0xFF66CCCC), width: 3.0)),
  //                   hintText: "Email address",
  //                   hintStyle: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     color: Color(0xFF66CCCC),
  //                     fontSize: 20,
  //                   ),
  //                 ),
  //               ))));
  // }
  Container _Username() {
    return Container(
        child: Center(
            child: Container(
                width: 230,
                child: TextField(
                  controller: usernamecontroller,
                  onChanged: (String text4) {
                    temp_username = text4;
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF66CCCC),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFF66CCCC), width: 3.0)),
                    hintText: "New Username",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF66CCCC),
                      fontSize: 20,
                    ),
                  ),
                ))));
  }
  Container _Password1() {
    return Container(
        child: Center(
            child: Container(
                width: 230,
                child: TextField(
                  controller: pass1controller,
                  onChanged: (String text2) {
                    temp_pass1 = text2;
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF66CCCC),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFF66CCCC), width: 3.0)),
                    hintText: "Enter Password",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF66CCCC),
                      fontSize: 20,
                    ),
                  ),
                ))));
  }
  Container _Password2() {
    return Container(
        child: Center(
            child: Container(
                width: 230,
                child: TextField(
                  controller: pass2controller,
                  onChanged: (String text3) {
                    temp_pass2 = text3;
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF66CCCC),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFF66CCCC), width: 3.0)),
                    hintText: "Re-enter Password",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF66CCCC),
                      fontSize: 20,
                    ),
                  ),
                ))));
  }

  //sets SignUp in User object
  Container _confirmbutton() {
    return Container(
      child: Center(
          child: FlatButton(
              child: Text("Confirm",
                  style: TextStyle(
                      color: Color(0xffCC0066),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              onPressed: () async {
                
                Navigator.pushNamed(context, '/home');
              })),
    );
  }
}
