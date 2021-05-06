import 'dart:convert' as convert;
import 'dart:convert';

import 'package:flutter_project/model/Destination.dart';
import 'package:flutter_project/model/Room.dart';
import 'package:http/http.dart' as http;

class WebService{

  String roomsURL = "https://608d4294fe2e9c00171e16f1.mockapi.io/rooms";
  String destinationsURL = "https://608d4294fe2e9c00171e16f1.mockapi.io/destination";
  List errRoom;
  var errDest = new List<Destination>();

  Future<List<Room>> loadRooms () async {
    var url = Uri.https('608d4294fe2e9c00171e16f1.mockapi.io', '/rooms' );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final Iterable list = json;
      return (list.map((item) => Room.fromJSON(item)).toList());
    }else{
      errRoom.add(Room( ));
      return errRoom;
    }
  }


  Future<List<Destination>> loadDestinations () async {
    var url = Uri.https('608d4294fe2e9c00171e16f1.mockapi.io', '/destination' );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final Iterable list = json;
      return (list.map((item) => Destination.fromJSON(item)).toList());
    }else{
      errDest.add( Destination(image: "https://idraksy.net/wp-content/uploads/2020/04/placeholder.png", title: "No Place found"));
      return errDest;
    }
  }




  }