import 'package:nasa_app/arguments.dart';
import 'package:nasa_app/style/themes.dart';
import 'package:nasa_app/views/iss_localization.dart';
import 'package:nasa_app/views/iss_people.dart';
import 'package:nasa_app/views/mars_rover.dart';
import 'package:nasa_app/views/mars_rovers_photo.dart';
import 'package:nasa_app/views/photo_of_the_day.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/views/weather_at_mars.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space FUN',
      theme: lightTheme,
      onGenerateRoute: (settings) {
          if (settings.name == MarsRoverPhoto.routeName) {
            final Arguments args = settings.arguments;
            return MaterialPageRoute(
              builder: (context) {
                return MarsRoverPhoto(args.nameOfRover);
              },
            );
          }
          assert(false, 'Implementation ${settings.name}');
          return null;
        },
     routes: {
       '/': (ctx) => Photo(),
       ISSPeople.routeName: (ctx) => ISSPeople(),
       ISSLocalization.routeName: (ctx) => ISSLocalization(),
       MarsRover.routeName: (ctx) => MarsRover(),
       WeatherAtMars.routeName: (ctx) => WeatherAtMars(),
       Photo.routeName: (ctx) => Photo()
     }
    );
  }
}
