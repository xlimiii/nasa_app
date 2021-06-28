import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/screenSizeFunctions.dart';

class RoverPhotoElement extends StatelessWidget {
  
  final String url;
  RoverPhotoElement(this.url);

  @override 
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(10),
      child: Image.network(url),
      color: Theme.of(context).primaryColorDark,
    );
  }
}