import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoverPhotoElement extends StatelessWidget {
  
  final String url;
  RoverPhotoElement(this.url);

  @override 
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(5),
      child: Image.network(url),
      color: const Color(0xffffff4c),
    );
  }
}