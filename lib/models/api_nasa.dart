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
}
