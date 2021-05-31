import 'package:flutter/cupertino.dart';
import 'package:nasa_app/models/api_nasa.dart';
import 'package:nasa_app/models/nasa_photo_of_the_day.dart';

import 'package:flutter/material.dart';


class Photo extends StatefulWidget {
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  final title = TextEditingController();
  final urlOfPhoto = TextEditingController();
  final photo = NasaPhotoOfTheDay();
  @override
  void initState() {
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


  @override
  void dispose() {
    title.dispose();
    urlOfPhoto.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title.text,
              style: Theme.of(context).textTheme.headline4,
            ),
            Image.network(urlOfPhoto.text),
            ElevatedButton(
              onPressed: loadPhoto,
              child: Icon(Icons.message_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
 