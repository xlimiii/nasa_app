import 'package:flutter/cupertino.dart';
import 'package:nasa_app/models/api_nasa.dart';
import 'package:nasa_app/models/nasa_photo_of_the_day.dart';

import 'package:flutter/material.dart';
import 'package:nasa_app/widgets/main_drawer.dart';


class Photo extends StatefulWidget {
  static const routeName = '/photos';
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  final title = TextEditingController();
  final description = TextEditingController();
  bool descriptionIsActive = false;
  final urlOfPhoto = TextEditingController();
  final photo = NasaPhotoOfTheDay();
  @override
  void initState() {
    loadPhoto();
    super.initState();
  }

  void loadPhoto() async {
    await getPhotoOfTheDay().then(
      (value) => setState(() {
        title.text = value.title;
        urlOfPhoto.text = value.url;
      }),
    );
  }
  void getDescription() async {
    if (descriptionIsActive == true){
      description.text = " ";
      descriptionIsActive = false; 
      setState(() {
        description.text = " ";
      });
      }
    else {
          descriptionIsActive = true;
     await getPhotoOfTheDay().then(
      (value) => setState(() {
        description.text = value.description;
      }),
    );
  }
  }

  @override
  void dispose() {
    title.dispose();
    urlOfPhoto.dispose();
    super.dispose();
    description.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('NASA Photo of the Day'),
      ),
      drawer: MainDrawer(),
      body: 
      SingleChildScrollView(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title.text,
              style: Theme.of(context).textTheme.headline4,
            ),
            Image.network(urlOfPhoto.text),
            ElevatedButton(
              onPressed: getDescription,
              child: Icon(Icons.message_outlined),
            ),
             Text(
              description.text,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),),
      
    );
  }
}
 