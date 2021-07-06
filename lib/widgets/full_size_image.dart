import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SliderShowFullmages extends StatefulWidget {
  final String url;
  const SliderShowFullmages({Key key, this.url}) : super(key: key);
  @override
  _SliderShowFullmagesState createState() =>
      _SliderShowFullmagesState(this.url);
}

class _SliderShowFullmagesState extends State<SliderShowFullmages> {
  String myUrl;
  _SliderShowFullmagesState(String url) {
    myUrl = url;
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
                        )
                      ]),
                ],
              ),
            )));
  }
}
