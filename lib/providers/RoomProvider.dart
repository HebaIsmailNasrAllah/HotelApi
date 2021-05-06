import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/model/Room.dart';
import 'package:flutter_project/network/WebService.dart';

class RoomProvider extends  ChangeNotifier {
  WebService _webService = WebService();
  List<Room> rooms;

  RoomProvider(){
    getRooms();
  }

  Future<void> getRooms() async {
    _webService.loadRooms().then((value) {
      rooms = value;
      notifyListeners();
      });
  }

}