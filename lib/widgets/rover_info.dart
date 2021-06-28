import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/arguments.dart';
import 'package:nasa_app/models/screenSizeFunctions.dart';
import 'package:nasa_app/views/mars_rovers_photo.dart';

class RoverInfo extends StatelessWidget {
  RoverInfo(
      {@required this.nameOfRover,
      @required this.launchDate,
      @required this.lastPhoto,
      @required this.status,
      @required this.totalPhotos,
      @required this.landingDate,
        @required this.count});

  final String nameOfRover;
  final String launchDate;
  final String landingDate;
  final String status;
  final String totalPhotos;
  final String lastPhoto;
  final double count;

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
           color: Theme.of(context).primaryColorLight,
        //   borderRadius: BorderRadius.circular(12),
        // ),
        shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
        child: Column(
          children: <Widget>[
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              height: ScreenSizeFunctions.screenHeightExcludingToolbar(context,
                  dividedBy: 4),

              child: Row(children: <Widget>[
                Image.network(
                  'https://image.flaticon.com/icons/png/512/944/944255.png',
                  height: ScreenSizeFunctions.screenHeightExcludingToolbar(context,
                      dividedBy: 4),
                  width: ScreenSizeFunctions.screenWidth(context,
                      dividedBy: 4),
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
                              fontSize:ScreenSizeFunctions.screenHeightExcludingToolbar(context,
                                dividedBy: 24),
                                fontWeight: FontWeight.w600, color: Colors.white
                            ),
                          ),
                          Text("Launch date: " + launchDate, style: TextStyle( fontSize: ScreenSizeFunctions.screenHeightExcludingToolbar(context,
                              dividedBy: 48), color: Colors.white),),
                          Text("Landing date: " + landingDate, style: TextStyle( fontSize: ScreenSizeFunctions.screenHeightExcludingToolbar(context,
                              dividedBy: 48), color: Colors.white),),
                          Text("Status of mission: " + status, style: TextStyle(fontSize: ScreenSizeFunctions.screenHeightExcludingToolbar(context,
                              dividedBy: 48), color: Colors.white),),
                          Text('Total Photos: ' + totalPhotos, style: TextStyle( fontSize: ScreenSizeFunctions.screenHeightExcludingToolbar(context,
                              dividedBy: 48), color: Colors.white),),
                        ]))
              ]),
            ),
            Container(
              margin:  new EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
              child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text('Last Photo: ' + lastPhoto, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),)
            ])
            )],
        ), 
        ));
  }
}
