import 'package:face_mask_detector/DetectionPage.dart';
import 'package:face_mask_detector/SplashScreen.dart';
import 'package:flutter/material.dart';
// import 'package:tflite/tflite.dart';
void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.black), 
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}