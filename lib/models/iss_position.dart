import 'dart:convert';

import 'package:http/http.dart' as http;

class IssPositionResponse {
  IssPosition issPosition;
  String message;
  int timestamp;

  IssPositionResponse({this.issPosition, this.message, this.timestamp});

  IssPositionResponse.fromJson(Map<String, dynamic> json) {
    issPosition = json['iss_position'] != null
        ? new IssPosition.fromJson(json['iss_position'])
        : null;
    message = json['message'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.issPosition != null) {
      data['iss_position'] = this.issPosition.toJson();
    }
    data['message'] = this.message;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class IssPosition {
  String longitude;
  String latitude;

  IssPosition({this.longitude, this.latitude});

  IssPosition.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}

Future<IssPositionResponse> getISSPosition() async {
  final url = Uri.parse('http://api.open-notify.org/iss-now.json');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final responseBody = jsonDecode(response.body) ;
   
    return IssPositionResponse.fromJson(responseBody);
  } else {
    throw Exception('Failed to load people at ISS');
  }
}