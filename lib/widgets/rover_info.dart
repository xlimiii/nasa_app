import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoverInfo extends StatelessWidget {
  
 RoverInfo({@required this.nameOfRover, @required this.launchDate, @required this.lastPhoto, @required this.status, @required this.totalPhotos, @required this.landingDate});

 final String nameOfRover;
 final String launchDate;
 final String landingDate;
 final String status;
 final String totalPhotos;
 final String lastPhoto;

  
  @override
  Widget build(BuildContext context){
    return 
    Column(children: <Widget>[
    Row(children: <Widget>[
       Image.network(
  'https://image.flaticon.com/icons/png/512/944/944255.png',
  width: 120.0,
),
Column(
  children: <Widget>[
    Text(nameOfRover),
    Text("Launch date: "+ launchDate),
    Text("Landing date: "+ landingDate),
    Text("Status of mission: "+ status),
  ]
)
       
    ]
    ),
    
    Row( 
      children: <Widget>[
      Text('Total Photos: '+ totalPhotos), 
      Text('Last Photo: '+ lastPhoto)
    ]
    )
    ],
    );
  }
  
}
