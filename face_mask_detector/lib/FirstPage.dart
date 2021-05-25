import 'dart:io';
import 'package:face_mask_detector/DetectionPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class FirstPage extends StatefulWidget{
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>{
  
  Widget build(BuildContext context){
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.black,
      title: Text('Face Mask Detector'),
      ),
      body: ListView(
        children: <Widget>[
              Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
            height: 430, 
            width: 370,
            child: Image.asset('assets/fppic.jpg'),
            ),
            Container(
              child: Text(
                'CAUTION!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.yellow, fontSize: 30, fontWeight: FontWeight.bold),
              )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Text(
                'Masks are a simple barrier to help prevent your respiratory droplets from reaching others\nStudies show that masks reduce the spray of droplets when worn over the nose and mouth, You should wear a mask, even if you do not feel sick.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ),
            Container(
              width: double.infinity,
              height: 70,
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              padding: EdgeInsets.all(10),
              child: RaisedButton(onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute( builder: (BuildContext context) => DetectionPage()));
              }, 
              color: Colors.black,
              child: Text(
                'Go For Test',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            ),
          ]
        )
    )
        ]
      )
    );
  }
}