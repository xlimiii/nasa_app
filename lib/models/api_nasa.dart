import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_app/models/credentials.dart';

class NasaApi {
  static const apiUrl = 'api.nasa.gov';
  static const pathMarsWeather = '/insight_weather/';
  static const pathPhotoOfTheDay = '/planetary/apod';
   static const pathRoverManifest = '/mars-photos/api/v1/manifests/';
   static const pathRoverPhotos = '/mars-photos/api/v1/rovers/';
   static const curosityWeather='mars.nasa.gov';
   static const pathToCuriosityWeather='/rss/api/';

//mars.nasa.gov/rss/api/?feed=weather&category=msl&feedtype=json
}
