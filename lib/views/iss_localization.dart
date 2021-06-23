import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/iss_position.dart';
import 'package:nasa_app/widgets/custom_appbar.dart';
import 'package:nasa_app/widgets/main_drawer.dart';

class ISSLocalization extends StatefulWidget {
  static const routeName = '/iss_loc';


  @override
  _ISSLocalizationState createState() => _ISSLocalizationState();
}

class _ISSLocalizationState extends State<ISSLocalization> {
  final title = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();

  LatLng _center= LatLng(0.0,0.0);
  Timer timer;

  GoogleMapController _mapController;


  void _onMapCreated(GoogleMapController controller) {

    _mapController = controller;
    _controller.complete(controller);
  }

  int _selectedIndex = 1;

  @override
  void initState() {
    loadISSPosition();
    super.initState();
    timer =
        Timer.periodic(Duration(seconds: 1), (Timer t) => loadISSPosition());
  }

  void loadISSPosition() async {
    await getISSPosition().then(
          (value) =>
      {
        setState(() {
          _center = LatLng(double.parse(value.issPosition.latitude),
              double.parse(value.issPosition.longitude));
          if(_mapController!=null){
          _mapController.moveCamera(CameraUpdate.newLatLng(_center));}
        })},
    );
  }

  void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.of(context).pushReplacementNamed('/iss_people');
      }
      else {
        Navigator.of(context).pushReplacementNamed('/iss_loc');
      }
    });
  }

  @override
  void dispose() {
    title.dispose();
    loadISSPosition();
    timer?.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
       title: "ISS Localization"
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'People at ISS',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pin_drop),
              label: 'Where is ISS',

            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _changePage),
      body: Container(child: Stack(children:  [
        GoogleMap(
          mapType: MapType.normal,
          rotateGesturesEnabled: false,
          scrollGesturesEnabled: false,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 6,

          ),
        ),
        Center(child:Card(
          color: Colors.grey,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
      // if you need this
          side: BorderSide(
          color: Colors.grey.withOpacity(0.2),
          width: 1.5,
        ),
          ),
              child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
),
    ),),
      ]

    ),
    ),
    );
    }
}
 