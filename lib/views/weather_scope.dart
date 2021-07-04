import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/credentials.dart';
import 'package:nasa_app/widgets/custom_appbar.dart';
import 'package:nasa_app/widgets/main_drawer.dart';
import 'package:nasa_app/models/screenSizeFunctions.dart';

class WeatherScope extends StatefulWidget {
  static const routeName = '/weather_scope';

  @override
  _WeatherScope createState() => _WeatherScope();
}

class _WeatherScope extends State<WeatherScope> {
  @override
  void initState() {
    super.initState();
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
          width: 50,
          height: ScreenSizeFunctions.screenHeightExcludingToolbar(context,
              dividedBy: 6.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                Title,
                style: TextStyle(
                  fontSize: 16,
                ),
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
      appBar: CustomAppBar(
        title: "Sole nr." + Credentials.currentSole.sol,
      ),
      drawer: MainDrawer(),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: () {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    column(
                      'Sol',
                      Credentials.currentSole.sol,
                    ),
                    column(
                      'Min \nTemp',
                      Credentials.currentSole.minTemp,
                    ),
                    column('Max \nTemp', Credentials.currentSole.maxTemp),
                    column('Sunrise', Credentials.currentSole.sunrise),
                    column('Sunset', Credentials.currentSole.sunset),
                  ],
                ),
                Row(
                  children: <Widget>[
                    column(
                      'ls',
                      Credentials.currentSole.ls,
                    ),
                    column('pressure',
                        Credentials.currentSole.pressureString.toString()),
                    column('absHumidity',
                        Credentials.currentSole.absHumidity.toString()),
                  ],
                ),
                Row(
                  children: <Widget>[
                    column(
                      'wind\nSpeed',
                      Credentials.currentSole.windSpeed.toString(),
                    ),
                    column(
                      'wind\nDirection',
                      Credentials.currentSole.windDirection.toString(),
                    ),
                    column('atmo\nOpacity',
                        Credentials.currentSole.atmoOpacity.toString()),
                    column('min\nGtsTemp', Credentials.currentSole.minGtsTemp),
                    column('max\nGtsTemp', Credentials.currentSole.maxGtsTemp),
                  ],
                ),
                Row(
                  children: <Widget>[
                    column(
                      'terrestrial \nDate',
                      Credentials.currentSole.terrestrialDate.toString(),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    column(
                        'local\nUvIrradiance\nIndex,',
                        Credentials.currentSole.localUvIrradianceIndex
                            .toString()),
                  ],
                ),
              ],
            );
          }()),
    );
  }
}
