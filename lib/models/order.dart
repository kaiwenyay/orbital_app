import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:orbital_app/services/database.dart';

class Order {
  final String from;
  final String to;
  final bool done;
  final int orderId;
  final GeoPoint deliverTo;
  final GeoPoint restaurantLocation;
  final String order;
  final String comments; 
  final String restaurantName;
  final String restaurantAddress;

  Order({this.from, this.to, this.done, this.orderId, this.deliverTo, this.restaurantLocation, this.order, this.comments, this.restaurantAddress, this.restaurantName});

}