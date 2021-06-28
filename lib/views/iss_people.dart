import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/iss_people.dart';
import 'package:nasa_app/widgets/custom_appbar.dart';
import 'package:nasa_app/widgets/main_drawer.dart';
import 'package:nasa_app/style/icons/my_flutter_app_icons.dart' as CustomIcon;


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
    loadISSPeople();
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
      resizeToAvoidBottomInset: false,
       appBar: CustomAppBar(
       title: "People at ISS"
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
      body: SingleChildScrollView(child:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (var i in peopleInSpace)
              Card(

                margin: new EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                // decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                //   borderRadius: BorderRadius.circular(12),
                // ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: Row(children: <Widget>[
                        Icon(CustomIcon.MyFlutterApp.atronaut, size: 60,),
                        Container(
                            margin: new EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    i.name,
                                    style: TextStyle(
                                        fontFamily: 'Noto Sans CJK SC',
                                        fontSize: 28,
                                        fontWeight: FontWeight.w600, color: Colors.white
                                    ),
                                  ),
                                ]))
                      ]),
                    ),
                    ],
                ),
              )
          ],
        ),
      ),
    ));
  }
}
