import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/arguments.dart';
import 'package:nasa_app/views/mars_rovers_photo.dart';

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

void selectRover(BuildContext context){
   Navigator.of(context).pushNamed(MarsRoverPhoto.routeName, arguments: Arguments(nameOfRover) ); }

  @override
  Widget build(BuildContext context) {
    final Arguments args = ModalRoute.of(context).settings.arguments;

    return new 
    InkWell( 
      onTap: () {
        selectRover(context);
      },
      child:
    Card(
      
        margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        // decoration: BoxDecoration(
           //color: Theme.of(context).accentColor,
        //   borderRadius: BorderRadius.circular(12),
        // ),
        shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
        child: Column(
          children: <Widget>[
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              child: Row(children: <Widget>[
                Image.network(
                  'https://image.flaticon.com/icons/png/512/944/944255.png',
                  width: 100.0,
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
                              fontSize: 28,
                                fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text("Launch date: " + launchDate, style: TextStyle( fontSize: 16,),),
                          Text("Landing date: " + landingDate, style: TextStyle( fontSize: 16,),),
                          Text("Status of mission: " + status, style: TextStyle(fontSize: 16,),),
                          Text('Total Photos: ' + totalPhotos, style: TextStyle( fontSize: 16,),),
                        ]))
              ]),
            ),
            Container(
              margin:  new EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
              child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text('Last Photo: ' + lastPhoto, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),)
            ])
            )],
        ), 
        ));
  }
}
