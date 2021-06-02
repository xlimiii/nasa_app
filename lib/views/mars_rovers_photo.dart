import 'package:flutter/cupertino.dart';
import 'package:nasa_app/models/api_nasa.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/nasa_photo_of_the_day.dart';
import 'package:nasa_app/models/nasa_rovers.dart';
import 'package:nasa_app/widgets/main_drawer.dart';
import 'package:nasa_app/widgets/rover_info.dart';


class MarsRoverPhoto extends StatefulWidget {
  static const routeName = '/rovers_photo';
  @override
  _MarsRoverPhotoState createState() => _MarsRoverPhotoState();
}

class _MarsRoverPhotoState extends State<MarsRoverPhoto> {
  final title = TextEditingController();
  final landingDate = TextEditingController();
  final status = TextEditingController();
  int _selectedIndex = 1;
  String choosedRover = 'spirit';

void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex == 0){
        Navigator.of(context).pushReplacementNamed('/rovers');
      }
      else {
        Navigator.of(context).pushReplacementNamed('/rovers_photo');
      }
    });
  }

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
        title: Text('Mars Rovers Photos'),
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
        ],
        currentIndex: _selectedIndex,
        onTap: _changePage),
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
 