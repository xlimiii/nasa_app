import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/nasa_rovers_photos.dart';
import 'package:nasa_app/widgets/custom_appbar.dart';
import 'package:nasa_app/widgets/main_drawer.dart';
import 'package:nasa_app/widgets/rover_photo_element.dart';

class MarsRoverPhoto extends StatefulWidget {
  static const routeName = '/rovers_photo';
  final String marsRoverName;

  MarsRoverPhoto(this.marsRoverName);

  @override
  _MarsRoverPhotoState createState() => _MarsRoverPhotoState();
}

class _MarsRoverPhotoState extends State<MarsRoverPhoto> {
  String choosedRover = 'spirit';
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  DateTime selectedDate = DateTime.now();
  String formattedDate;
  List<Photos> photos = [];

// void _changePage(int index) {
//     setState(() {
//       _selectedIndex = index;
//       if(_selectedIndex == 0){
//         Navigator.of(context).pushReplacementNamed('/rovers');
//       }
//       else {
//         Navigator.of(context).pushReplacementNamed('/rovers_photo');
//       }
//     });
//   }

  @override
  void initState() {
    formattedDate = formatter.format(DateTime.now());
    loadRoverPhotos();
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2004, 1, 5),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        formattedDate = formatter.format(selectedDate);
        loadRoverPhotos();
      });
  }

  void loadRoverPhotos() async {
    await getPhotos(widget.marsRoverName, formattedDate).then(
      (value) => {
        if (mounted)
          {
            setState(() {
              photos = value;
            })
          }
      },
    );
  }

  @override
  void dispose() {
    //loadRoverPhotos();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
       title: "Photos from ${widget.marsRoverName}"
      ),
        drawer: MainDrawer(),
       
        body: new Column(children: <Widget>[Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            
            ElevatedButton(
                onPressed: () => _selectDate(context),
                style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColorLight,),
                child:Row( children: <Widget>[
                  Icon(Icons.calendar_today_outlined, size: 38, color: Colors.white,),

                ]
                )
                )
          
          ]),
          Text("\t${selectedDate.toLocal()}".split(' ')[0], style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
          photos.isEmpty ? Text('No photos taken that day from ${widget.marsRoverName} rover', textAlign: TextAlign.center) : 
          new Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              children: [
                for (var i in photos) RoverPhotoElement(i.imgSrc),
                
              ],
            ),
          )
        ]));
    //]),
    //);
  }
}
