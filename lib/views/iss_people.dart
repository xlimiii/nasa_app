import 'package:flutter/cupertino.dart';
import 'package:nasa_app/models/api_nasa.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/iss_people.dart';
import 'package:nasa_app/widgets/main_drawer.dart';


class ISSPeople extends StatefulWidget {
 static const routeName = '/iss_people';
  @override
  _ISSPeopleState createState() => _ISSPeopleState();
}

class _ISSPeopleState extends State<ISSPeople> {
  final title = TextEditingController();
  List<ISSPerson> peopleInSpace = [] ;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  void loadISSPeople() async {
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('People at ISS'),
        actions: <Widget>[
          Switch(value: true, onChanged: (value) => true),
        ],
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
              onPressed: loadISSPeople,
              child: Icon(Icons.people_alt),
            ),
          ],
        ),
      ),
    );
  }
}
 