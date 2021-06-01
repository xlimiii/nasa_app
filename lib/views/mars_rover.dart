import 'package:flutter/cupertino.dart';
import 'package:nasa_app/models/api_nasa.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/nasa_photo_of_the_day.dart';
import 'package:nasa_app/models/nasa_rovers.dart';


class MarsRover extends StatefulWidget {
  @override
  _MarsRoverState createState() => _MarsRoverState();
}

class _MarsRoverState extends State<MarsRover> {
  final title = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void loadRoverPhotos() async {
    await getPhotoManifest("curiosity").then(
      (value) => setState(() {
        title.text = value.name.toString();
      }),
    );
  }


  @override
  void dispose() {
    title.dispose();
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
            ElevatedButton(
              onPressed: loadRoverPhotos,
              child: Icon(Icons.date_range_outlined),
            ),
          ],
        ),
      ),
    );
  }

}
 