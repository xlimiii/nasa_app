import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/style/icons/my_flutter_app_icons.dart' as CustomIcon;

class MainDrawer extends StatelessWidget {



  @override
  Widget build(BuildContext context){
    return Drawer(child: Column(children: <Widget>[
      Container(alignment: Alignment.centerLeft,
      height: 120,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      color: Theme.of(context).accentColor,
      child: Text('Menu', style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 30,
        color: Colors.black
      )
      ),
      ),
      SizedBox(height: 20,),
      ListTile(leading: Icon(CustomIcon.MyFlutterApp.telescope, size: 30,), title: Text('NASA Photo of the day', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold
      )
      ),
     onTap: () {
        Navigator.of(context).pushReplacementNamed('/photos');
      },
      ),
    ListTile(leading: Icon(CustomIcon.MyFlutterApp.space_rover_2, size: 30,), title: Text('Mars Rovers', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold
      )
      ),
      onTap: () {
        Navigator.of(context).pushReplacementNamed('/rovers');
      },
      ),
       ListTile(leading: Icon(CustomIcon.MyFlutterApp.international_space_station, size: 30), title: Text('People at ISS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold
      )
      ),
      onTap: () {
        Navigator.of(context).pushReplacementNamed('/iss_people');
      },
      ),
      ListTile(leading: Icon(CustomIcon.MyFlutterApp.mars, size: 30,), title: Text('Weather at Mars', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold
      )
      ),
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/weather_at_mars');
        },
      ),
    ]
    ));
  }
  
}
