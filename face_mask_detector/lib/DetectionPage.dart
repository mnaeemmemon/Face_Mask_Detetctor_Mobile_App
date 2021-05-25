import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import 'FaceDetectionFromLiveCamera.dart';

class DetectionPage extends StatefulWidget{
  _DetectionPageState createState() => _DetectionPageState();
}

class _DetectionPageState extends State<DetectionPage>{
  bool _loading = true;
  File _image;
  final imagepicker = ImagePicker();
  List _prediction=[];

  @override
  void initState(){
    super.initState();
    loadmodel();
  }
  

  loadmodel()async{
    await Tflite.loadModel(model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  detect_image(File image)async{
    var prediction = await Tflite.runModelOnImage(path: image.path, numResults: 2, threshold: 0.6, imageMean: 127.5, imageStd: 127.5);
    setState(() {
      _loading=false;
      _prediction=prediction;
    });
  }

  @override
  void dispose(){
    super.dispose();
  }

  _loadimage_gallery()async{
    var image= await imagepicker.getImage(source: ImageSource.gallery);
    if(image==null)
    {
      return null;
    }
    else
    {
      _image= File(image.path);
    }
    detect_image(_image);
  }
  _loadimage_camera()async{
    var image= await imagepicker.getImage(source: ImageSource.camera);
    if(image==null)
    {
      return null;
    }
    else
    {
      _image= File(image.path);
    }
    detect_image(_image);
  }



  Widget build(BuildContext context){
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
      title: Text('Face Mask Detector'),
      ),
      body: 
          ListView(
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
                    height: 250, 
                    width: 250, 
                    child: Image.asset('assets/mask.png'),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      padding: EdgeInsets.all(5),
                      child: RaisedButton(onPressed: (){
                        _loadimage_camera();
                      }, 
                      color: Colors.black,
                      child: Text(
                        'Take A Picture',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      padding: EdgeInsets.all(5),
                      child: RaisedButton(onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FaceDetectionFromLiveCamera(),
                          ),
                        );
                      }, 
                      color: Colors.black,
                      child: Text(
                        'Real Time Detection',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      padding: EdgeInsets.all(5),
                      child: RaisedButton(onPressed: (){
                        _loadimage_gallery();
                      }, 
                      color: Colors.black,
                      child: Text(
                        'Choose From Gallery',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    ),
                    _loading==false? Container(
                      child: Column(
                        children :[ 
                          Container(
                            height: 250, 
                            width: 250, 
                            child: Image.file(_image),
                            margin: EdgeInsets.all(5),
                            ),
                            Text(_prediction[0]['label'].toString().substring(2).replaceAll("_", " "), style: TextStyle(fontSize: 20)),
                            ]
                            )
                            ):Container()
                  ],
                  ),
            ),]
          )
      );
  }
}