import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'full_size_image.dart';

class RoverPhotoElement extends StatelessWidget {
  
  final String url;
  final String camera;
  final String sol;
  final String date;
  final String roverName;

  RoverPhotoElement(this.url, this.camera, this.sol, this.date, this.roverName);

  @override 
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(10),
      child: 
      InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FullSizeImage(url:url , date: date, sol: sol, roverName: roverName, camera: camera,)));
                },
                child: Image.network(url, fit: BoxFit.fill, height: 255,),
              ) ,
      color: Theme.of(context).primaryColorDark,
    );
  }
}