import 'package:flutter/cupertino.dart';
import 'package:nasa_app/models/api_nasa.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/iss_people.dart';
import 'package:nasa_app/widgets/main_drawer.dart';


class WeatherAtMars extends StatefulWidget {
  static const routeName = '/weather_at_mars';
  @override
  _WeatherAtMars createState() => _WeatherAtMars();
}

class _WeatherAtMars extends State<WeatherAtMars> {
  final title = TextEditingController();
  List<ISSPerson> peopleInSpace = [] ;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  void loadWeatherAtMars() async {
    await getPeopleAtISS().then(
          (value) => setState(() {
        title.text = value.people[0].name;
        peopleInSpace = value.people;
      }),
    );
  }

  void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex == 0){
        Navigator.of(context).pushReplacementNamed('/weather_at_mars');
      }
      else {
        Navigator.of(context).pushReplacementNamed('/weather_at_mars');
      }
    });
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
        title: Text('weather_at_mars'),
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'weather_at_mars',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pin_drop),
              label: 'weather_at_mars',

            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _changePage),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (var i in peopleInSpace)
              Text(
                i.name,
                style: Theme.of(context).textTheme.headline4,
              ),
            ElevatedButton(
              onPressed: loadWeatherAtMars,
              child: Icon(Icons.people_alt),
            ),
          ],
        ),
      ),
    );
  }
}
