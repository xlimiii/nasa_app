import 'dart:async';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nasa_app/models/api_nasa.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/iss_position.dart';
import 'package:nasa_app/widgets/main_drawer.dart';


class ISSLocalization extends StatefulWidget {
    static const routeName = '/iss_loc';
  @override
  _ISSLocalizationState createState() => _ISSLocalizationState();
}

class _ISSLocalizationState extends State<ISSLocalization> {
  final title = TextEditingController();
    Completer<GoogleMapController> _controller = Completer();

  LatLng _center;
  Timer timer;



  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
  int _selectedIndex = 1;
  @override
  void initState() {
    loadISSPosition();
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => loadISSPosition());
  }

  void loadISSPosition() async {
    await getISSPosition().then(
      (value) => { if (mounted)
          {setState(() {
        _center = LatLng(double.parse(value.issPosition.latitude), double.parse(value.issPosition.longitude));
         
      })}},
    );

  }

void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex == 0){
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
       appBar: AppBar(
        title: Text('People at ISS'),
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
      body: 
      _center == null ? Container() :
GoogleMap(
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 2,
          )),
         
        
    
    );
  }
}
 