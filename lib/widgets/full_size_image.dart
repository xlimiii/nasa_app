import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FullSizeImage extends StatefulWidget {
  final String url;
  final String camera;
  final String sol;
  final String date;
  final String roverName;
  const FullSizeImage({Key key, this.url,this.camera, this.sol, this.date, this.roverName}) : super(key: key);
  @override
  _FullSizeImageState createState() =>
      _FullSizeImageState(this.url, this.camera, this.sol, this.date, this.roverName);
}

class _FullSizeImageState extends State<FullSizeImage> {
  String myUrl;
  String myCamera;
  String mySol;
  String myDate;
  String myRoverName;
  _FullSizeImageState(String url, String camera, String sol, String date, String roverName) {
    myUrl = url;
    myCamera = camera;
    mySol =sol;
    myDate = date;
    myRoverName = roverName;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.transparent,
        child: new Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0)),
                            child: Image.network(
                              myUrl,
                              fit: BoxFit.scaleDown,
                              height: 400.0,
                            ),
                          ),
                        ),
                        Text('Rover: ${myRoverName}', style: TextStyle(color: Colors.white),),
                        Text('Date: ${myDate}', style: TextStyle(color: Colors.white),),
                        Text('Sol: ${mySol}', style: TextStyle(color: Colors.white),),
                        Text('Camera: ${myCamera}', style: TextStyle(color: Colors.white),),

                      ]),
                ],
              ),
            )));
  }
}
