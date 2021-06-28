import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nasa_app/models/api_nasa.dart';
import 'package:nasa_app/models/credentials.dart';

 class PhotoManifest {
  String name;
  String landingDate;
  String launchDate;
  String status;
  int maxSol;
  String maxDate;
  int totalPhotos;
  List<Photos> photos;

  PhotoManifest(
      {this.name,
      this.landingDate,
      this.launchDate,
      this.status,
      this.maxSol,
      this.maxDate,
      this.totalPhotos,
      this.photos});

  PhotoManifest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    landingDate = json['landing_date'];
    launchDate = json['launch_date'];
    status = json['status'];
    maxSol = json['max_sol'];
    maxDate = json['max_date'];
    totalPhotos = json['total_photos'];
    if (json['photos'] != null) {
      photos = new List<Photos>();
      json['photos'].forEach((v) {
        photos.add(new Photos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['landing_date'] = this.landingDate;
    data['launch_date'] = this.launchDate;
    data['status'] = this.status;
    data['max_sol'] = this.maxSol;
    data['max_date'] = this.maxDate;
    data['total_photos'] = this.totalPhotos;
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photos {
  int sol;
  String earthDate;
  int totalPhotos;
  List<String> cameras;

  Photos({this.sol, this.earthDate, this.totalPhotos, this.cameras});

  Photos.fromJson(Map<String, dynamic> json) {
    sol = json['sol'];
    earthDate = json['earth_date'];
    totalPhotos = json['total_photos'];
    cameras = json['cameras'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sol'] = this.sol;
    data['earth_date'] = this.earthDate;
    data['total_photos'] = this.totalPhotos;
    data['cameras'] = this.cameras;
    return data;
  }
}
  Future<PhotoManifest> getPhotoManifest(String nameOfRover) async {
    
        final url = Uri.https(NasaApi.apiUrl, NasaApi.pathRoverManifest+nameOfRover , {'api_key': Credentials.nasa_api_key});
    final response = await http.get(url);
    if (response.statusCode == 200) {
     
       final result = jsonDecode(response.body);
        final res = PhotoManifest.fromJson(result['photo_manifest']);
      return res;
    } else {
      throw Exception('Failed to load photo');
    }}

