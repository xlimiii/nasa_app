import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_app/models/api_nasa.dart';
import 'package:nasa_app/models/credentials.dart';

 class NasaPhotoOfTheDay {
    final String title;
    final String description;
    final String url;
    final String type;
    final String copyright; 

    NasaPhotoOfTheDay({
      this.title, this.description, this.url, this.type, this.copyright
    });
  }

    
  Future<NasaPhotoOfTheDay> getPhotoOfTheDay() async {
    final url = Uri.https(NasaApi.apiUrl, NasaApi.pathPhotoOfTheDay, {'api_key': nasa_api_key});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final media_type = responseBody["media_type"];
      final urlOfPhoto = responseBody["url"];
      final titleOfPhoto = responseBody["title"];
      final copyrightOfPhoto = responseBody["copyright"];
      final description = responseBody["explanation"];
      final NasaPhotoOfTheDay photo = new NasaPhotoOfTheDay(title: titleOfPhoto, description: description, url: urlOfPhoto, copyright: copyrightOfPhoto);
      return photo;
    } else {
      throw Exception('Failed to load photo');
    }}

