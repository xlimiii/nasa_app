

import 'package:flutter/cupertino.dart';
import 'package:nasa_app/models/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/weather_at_mars.dart';
import 'package:nasa_app/widgets/custom_appbar.dart';
import 'package:nasa_app/widgets/main_drawer.dart';

class WeatherAtMars extends StatefulWidget {
  static const routeName = '/weather_at_mars';

  @override
  _WeatherAtMars createState() => _WeatherAtMars();
}

class _WeatherAtMars extends State<WeatherAtMars> {
  List<Sole> soles = [];
  double _value = 4;
  double max =10;


  @override
  void initState() {
    super.initState();
    loadWeatherAtMars();
  }

  void loadWeatherAtMars() async {
    await getWeatherManifest()
        .then((value) => {setState(() => {soles = value.soles,
        max=soles.length.toDouble()-4})});
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget column(String Title, String subtitle) {
    return Expanded(

      child: Card(
        //color: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
          // if you need this
          side: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        child: Container(
          width: 70,
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                Title,
                style: TextStyle(fontSize: 16,),
                textAlign: TextAlign.center,

              ),
              Text(
                subtitle,
                textAlign: TextAlign.center,

              ),
            ],
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
       title: "Mars Weather"
      ),
      drawer: MainDrawer(),
      body:SingleChildScrollView(child:
      new Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Theme.of(context).accentColor,
                inactiveTrackColor: Colors.grey[300],
                trackShape: RoundedRectSliderTrackShape(),
                trackHeight: 4.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                thumbColor: Theme.of(context).accentColor,
                overlayColor: Theme.of(context).accentColor.withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                tickMarkShape: RoundSliderTickMarkShape(),

              ),
              child: Slider(
                value: _value,
                min: 1,
                max:  max,
                divisions: (max/4).toInt(),
                onChanged: (value) {
                  setState(
                    () {
                      _value = value.round().toDouble();
                    },
                  );
                },
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(

                  color: Theme.of(context).primaryColorLight,
                  child: InkWell(
                    onTap: () {
                      print('tapped');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child:(){ if(soles.length-index-_value.toInt()<soles.length &&soles.length-index-_value.toInt()>0) {return Row(
                        children: <Widget>[
                            column('Sol', soles[soles.length-index-_value.toInt()].sol,),
                            column('Min \nTemp', soles[soles.length-index-_value.toInt()].minTemp,),
                            column('Max \nTemp', soles[soles.length-index-_value.toInt()].maxTemp),
                            column('Sunrise', soles[soles.length-index-_value.toInt()].sunrise),
                            column('Sunset', soles[soles.length-index-_value.toInt()].sunset),
                        ],
                      );}}()
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
