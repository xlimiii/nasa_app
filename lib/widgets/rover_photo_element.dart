import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'full_size_image.dart';

class RoverPhotoElement extends StatelessWidget {
  
  final String url;
  RoverPhotoElement(this.url);

  @override 
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(10),
      child: 
      InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SliderShowFullmages(url:url ,)));
                },
                child: Image.network(url, fit: BoxFit.fill, height: 255,),
              ) ,
      color: Theme.of(context).primaryColorDark,
    );
  }
}