import 'dart:convert';

import 'package:nasa_app/models/api_nasa.dart';
import 'package:http/http.dart' as http;

import 'credentials.dart';

class Photos {
  int id;
  int sol;
  Camera camera;
  String imgSrc;
  String earthDate;
  Rover rover;

  Photos(
      {this.id,
      this.sol,
      this.camera,
      this.imgSrc,
      this.earthDate,
      this.rover});

  Photos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sol = json['sol'];
    camera =
        json['camera'] != null ? new Camera.fromJson(json['camera']) : null;
    imgSrc = json['img_src'];
    earthDate = json['earth_date'];
    rover = json['rover'] != null ? new Rover.fromJson(json['rover']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sol'] = this.sol;
    if (this.camera != null) {
      data['camera'] = this.camera.toJson();
    }
    data['img_src'] = this.imgSrc;
    data['earth_date'] = this.earthDate;
    if (this.rover != null) {
      data['rover'] = this.rover.toJson();
    }
    return data;
  }
}

class Camera {
  int id;
  String name;
  int roverId;
  String fullName;

  Camera({this.id, this.name, this.roverId, this.fullName});

  Camera.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    roverId = json['rover_id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rover_id'] = this.roverId;
    data['full_name'] = this.fullName;
    return data;
  }
}

class Rover {
  int id;
  String name;
  String landingDate;
  String launchDate;
  String status;

  Rover({this.id, this.name, this.landingDate, this.launchDate, this.status});

  Rover.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    landingDate = json['landing_date'];
    launchDate = json['launch_date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['landing_date'] = this.landingDate;
    data['launch_date'] = this.launchDate;
    data['status'] = this.status;
    return data;
  }
}

 Future<List<Photos>> getPhotos(String nameOfRover, String date) async {
    
        final url = Uri.https(NasaApi.apiUrl, NasaApi.pathRoverPhotos+nameOfRover+'/photos' , {'api_key': nasa_api_key, 'earth_date': date});
    final response = await http.get(url);
    if (response.statusCode == 200) {
     
       final result = jsonDecode(response.body);
       final listOfPhotos = result['photos'];
       List<Photos> listOfObj = [];
       for (var i in listOfPhotos){
         listOfObj.add(Photos.fromJson(i));
       }
        
      return listOfObj;
    } else {
      throw Exception('Failed to load photos');
    }}