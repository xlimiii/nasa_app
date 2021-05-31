import 'package:flutter/cupertino.dart';
import 'package:nasa_app/models/api_nasa.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/iss_people.dart';


class InternationalSpaceStation extends StatefulWidget {
  @override
  _InternationalSpaceStationState createState() => _InternationalSpaceStationState();
}

class _InternationalSpaceStationState extends State<InternationalSpaceStation> {
  final title = TextEditingController();
  List<ISSPerson> peopleInSpace = [] ;
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


  @override
  void dispose() {
    title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
 