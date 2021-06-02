import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:nasa_app/models/api_nasa.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/nasa_photo_of_the_day.dart';
import 'package:nasa_app/models/nasa_rovers_photos.dart';
import 'package:nasa_app/widgets/main_drawer.dart';
import 'package:nasa_app/widgets/rover_info.dart';
import 'package:nasa_app/widgets/rover_photo_element.dart';


class MarsRoverPhoto extends StatefulWidget {
  static const routeName = '/rovers_photo';
  final String marsRoverName;

  MarsRoverPhoto(this.marsRoverName);

  @override
  _MarsRoverPhotoState createState() => _MarsRoverPhotoState();
}

class _MarsRoverPhotoState extends State<MarsRoverPhoto> {
  final title = TextEditingController();
  final landingDate = TextEditingController();
  final status = TextEditingController();
  int _selectedIndex = 1;
  String choosedRover = 'spirit';
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
 DateTime selectedDate = DateTime.now();
 String formattedDate ;
 List<Photos> photos = [];

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
    loadRoverPhotos();
    formattedDate = formatter.format(DateTime.now());
    super.initState();
  }

  

   Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        formattedDate = formatter.format(selectedDate);
        selectedDate = picked;
        loadRoverPhotos();
      });
  }

 void loadRoverPhotos() async {
   await getPhotos(widget.marsRoverName, formattedDate).then(
      (value) => setState(() {
        photos = value;
      }),
    ); 
 }

  @override
  void dispose() {
    loadRoverPhotos();
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
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //      BottomNavigationBarItem(
      //       icon: Icon(Icons.text_snippet_outlined),
      //       label: 'Info',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.photo_camera),
      //       label: 'Photos',
            
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: _changePage),
      body: new Column(
  children: <Widget>[
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [ 
 Text("${selectedDate.toLocal()}".split(' ')[0]),
            SizedBox(height: 20.0,),
            RaisedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select date'))]),
    new Expanded(
      child:
        GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, childAspectRatio: 3/2, crossAxisSpacing: 10, mainAxisSpacing: 10 )
        ,
        children: [
            for (var i in photos)
          RoverPhotoElement(i.imgSrc),
        ],
        ),
        
      )
  ]
      )
      );
      //]),
    //);
  }

}
 