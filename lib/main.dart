import 'package:nasa_app/views/international_space_station.dart';
import 'package:nasa_app/views/mars_rover.dart';
import 'package:nasa_app/views/mars_rovers_photo.dart';
import 'package:nasa_app/views/photo_of_the_day.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/widgets/main_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space FUN',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      
     //home: MyHomePage(title: 'Space FUN'),
     routes: {
       '/': (ctx) => MyHomePage(title: 'Space FUN'),
       InternationalSpaceStation.routeName: (ctx) => InternationalSpaceStation(),
       MarsRover.routeName: (ctx) => MarsRover(),
       MarsRoverPhoto.routeName: (ctx) => MarsRoverPhoto(),
       Photo.routeName: (ctx) => Photo()
     }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _pages = [Photo(), MarsRover(), InternationalSpaceStation()];
  int _selectedIndex = 0;

  void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(
      //  title: Text(widget.title),
     // ),
      drawer: MainDrawer(),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.photo_camera),
      //       label: 'Photo of the day',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.center_focus_weak_rounded),
      //       label: 'Mars Rovers',
      //     ),
      //      BottomNavigationBarItem(
      //       icon: Icon(Icons.room),
      //       label: 'ISS',
      //     ),
      //   
      // 
      // ],
      //  currentIndex: _selectedIndex,
      //  onTap: _changePage,
      //),
      body: _pages[_selectedIndex],
    );
  }
}
