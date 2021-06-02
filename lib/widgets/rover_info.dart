import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RoverInfo extends StatelessWidget {
  RoverInfo(
      {@required this.nameOfRover,
      @required this.launchDate,
      @required this.lastPhoto,
      @required this.status,
      @required this.totalPhotos,
      @required this.landingDate});

  final String nameOfRover;
  final String launchDate;
  final String landingDate;
  final String status;
  final String totalPhotos;
  final String lastPhoto;

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: const Color(0xffffff4c),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              child: Row(children: <Widget>[
                Image.network(
                  'https://image.flaticon.com/icons/png/512/944/944255.png',
                  width: 120.0,
                ),
                Container(
                    margin: new EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            nameOfRover,
                            style: TextStyle(
                              fontFamily: 'Noto Sans CJK SC',
                              fontSize: 25,
                            ),
                          ),
                          Text("Launch date: " + launchDate),
                          Text("Landing date: " + landingDate),
                          Text("Status of mission: " + status),
                        ]))
              ]),
            ),
            Container(
              margin:  new EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
              child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text('Total Photos: ' + totalPhotos),
              Text('Last Photo: ' + lastPhoto, textAlign: TextAlign.end,)
            ])
            )],
        ));
  }
}
