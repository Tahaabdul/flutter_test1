import 'package:flutter_test1/models/geometry.dart';

class Customer {
  final String name;
  final double balance;
 final Geometry geometry;


 Customer({this.geometry, this.name, this.balance});

 Customer.fromJson(Map<dynamic, dynamic> parsedJson)
  :name = parsedJson['name'],
  geometry= parsedJson['geometry'],
  balance = parsedJson['balance'].toDouble();

}