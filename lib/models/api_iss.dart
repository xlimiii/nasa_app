import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ISSApi {
  static const apiUrl = 'api.open-notify.org';
  static const currentPosition = '/iss-now.json';
  static const currentPeople = '/astros.json';
}