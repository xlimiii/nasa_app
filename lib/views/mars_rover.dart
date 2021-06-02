import 'package:flutter/cupertino.dart';
import 'package:nasa_app/models/api_nasa.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/nasa_photo_of_the_day.dart';
import 'package:nasa_app/models/nasa_rovers.dart';
import 'package:nasa_app/widgets/main_drawer.dart';
import 'package:nasa_app/widgets/rover_info.dart';


class MarsRover extends StatefulWidget {
  static const routeName = '/rovers';
  @override
  _MarsRoverState createState() => _MarsRoverState();
}

class _MarsRoverState extends State<MarsRover> {
  final title = TextEditingController();
  final landingDate = TextEditingController();
  final status = TextEditingController();
  int _selectedIndex = 0;
  String choosedRover = 'spirit';
  final roverNames = ['spirit', 'opportunity', 'perseverance', 'curiosity'];
   List<PhotoManifest> roverObjects = []; 

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
    for (var i in roverNames){
    choosedRover = i;
    loadRoverInfo();
    }
    super.initState();
  }

 
 void loadRoverInfo() async {
   await getPhotoManifest(choosedRover).then(
      (value) => setState(() {
        roverObjects.add(value);
      }),
    ); 
 }

  @override
  void dispose() {
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
        ],
        currentIndex: _selectedIndex,
        onTap: _changePage),
      body:  SingleChildScrollView(child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for ( var i in roverObjects )
           
            RoverInfo(nameOfRover: i.name, landingDate: i.landingDate, lastPhoto: i.maxDate, launchDate: i.launchDate, status: i.status, totalPhotos: i.totalPhotos.toString() ),

           
          ],
        ),
      ),)
    );
  }

}
 