import 'package:flutter/cupertino.dart';
import 'package:nasa_app/models/api_nasa.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/nasa_photo_of_the_day.dart';
import 'package:nasa_app/models/nasa_rovers.dart';
import 'package:nasa_app/widgets/main_drawer.dart';


class MarsRover extends StatefulWidget {
  static const routeName = '/rovers';
  @override
  _MarsRoverState createState() => _MarsRoverState();
}

class _MarsRoverState extends State<MarsRover> {
  final title = TextEditingController();
  final landingDate = TextEditingController();
  final status = TextEditingController();

  String choosedRover = 'spirit';
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
 void loadRoverInfo() async {
   await getPhotoManifest(choosedRover).then(
      (value) => setState(() {
        title.text = value.name.toString();
        landingDate.text = value.landingDate.toString();
        status.text = value.status.toString();
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
     appBar: AppBar(
        title: Text('Mars Rovers'),
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet_outlined),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera),
            label: 'Photos',
          ),
        ],),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton(  
               value: choosedRover,
               onChanged: (newValue) {
              setState(() {
                choosedRover = newValue;
              });
              loadRoverInfo();
            }, 
            items: <String>['spirit', 'opportunity', 'perseverance', 'curiosity'].map((String value){
              return new DropdownMenuItem<String>(value: value, child: new Text(value));
            }).toList(),),
            Text(
              title.text,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              landingDate.text,
              style: Theme.of(context).textTheme.headline4,
            ),
             Text(
              status.text,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }

}
 