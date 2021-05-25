import 'dart:async';
import 'package:flutter/material.dart';
import 'FirstPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => FirstPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("assets/splash.jpg"), fit: BoxFit.cover,),
          ),
        ),
        new Center(
          child: new Text("  Welcome To  \n  Face Mask Detector  \n  Mobile Application  ", textAlign: TextAlign.center, style: TextStyle(backgroundColor: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
        )
      ],
    )
    );
  }
}