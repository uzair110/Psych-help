import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreen createState() => _LoadingScreen();
}

class _LoadingScreen extends State<LoadingScreen> {
//class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
          child: SpinKitFadingCircle(
        color: Colors.green,
        size: 75.0,
      )),
    );
  }
}

class LoadingScreen1 extends StatefulWidget {
  @override
  _LoadingScreen1 createState() => _LoadingScreen1();
}

class _LoadingScreen1 extends State<LoadingScreen1> {
//class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
          child: SpinKitFadingCircle(
        color: Colors.green[75],
        size: 40.0,
      )),
    );
  }
}

class EmptyScreen extends StatefulWidget {
  @override
  _EmptyScreen createState() => _EmptyScreen();
}

class _EmptyScreen extends State<EmptyScreen> {
//class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
