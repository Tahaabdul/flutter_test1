import 'package:flutter_test1/models/location.dart';

class Geometry {
  final Location location;
  Geometry({this.location});

  Geometry.fromJson(Map<dynamic, dynamic> parsedJson)
 :location = Location.fromJson(parsedJson['Location']);
}