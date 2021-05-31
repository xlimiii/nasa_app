import 'package:flutter/cupertino.dart';
import 'package:nasa_app/models/api_nasa.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/nasa_photo_of_the_day.dart';


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
    await getPhotoOfTheDay().then(
      (value) => setState(() {
        title.text = value.toString();
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
              'abc',
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
 