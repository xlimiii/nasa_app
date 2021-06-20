import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_app/models/api_nasa.dart';
import 'package:nasa_app/models/credentials.dart';
import 'dart:developer';

import 'Welcome.dart';

class WeatherAtMars {}

Future<Welcome> getWeatherManifest() async {
  final url = Uri.https(NasaApi.curosityWeather, NasaApi.pathToCuriosityWeather,
      {'feed': 'weather', 'category': 'msl', 'feedtype': 'json'});
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final result = jsonDecode(response.body);
    final res = Welcome.fromJson(result);
    return res;
  } else {
    throw Exception('Failed to load photo');
  }
}
