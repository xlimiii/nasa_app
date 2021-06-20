import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:nasa_app/models/Welcome.dart';
import 'package:nasa_app/models/api_nasa.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/iss_people.dart';
import 'package:nasa_app/models/weather_at_mars.dart';
import 'package:nasa_app/widgets/main_drawer.dart';


class WeatherAtMars extends StatefulWidget {
  static const routeName = '/weather_at_mars';

  @override
  _WeatherAtMars createState() => _WeatherAtMars();
}

class _WeatherAtMars extends State<WeatherAtMars> {

  List<Sole> soles = [];

  @override
  void initState() {
    super.initState();
    loadWeatherAtMars();
  }

  void loadWeatherAtMars() async {
    await getWeatherManifest().then(
            (value) =>
        {
          soles = value.soles});
  }


  @override
  void dispose() {
    super.dispose();
  }

  Widget column (String Title, String subtitle) {
  return Expanded(
    child: Column(
      // align the text to the left instead of centered
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(Title, style: TextStyle(fontSize: 16),),
        Text(subtitle),
      ],
    ),
  );}

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Weather'),
    ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemCount: soles.length,
        itemBuilder: (context, index) {
          return Card(

            child: InkWell(
              onTap: () {
                print('tapped');
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    column('Sol',soles[index].sol),
                    column('Max \nTemp',soles[index].maxTemp),
                    column('Min \nTemp',soles[index].minTemp),
                    column('Sunset',soles[index].sunset),
                    column('Sunrise',soles[index].sunrise),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

