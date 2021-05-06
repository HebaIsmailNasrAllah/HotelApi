import 'package:flutter/cupertino.dart';
import 'package:flutter_project/model/Destination.dart';
import 'package:flutter_project/network/WebService.dart';

class DestinationProvider extends  ChangeNotifier {
  WebService _webService = WebService();
  List<Destination> destinations;

  DestinationProvider(){
    getDestinations();
  }

  Future<void> getDestinations() async {
    _webService.loadDestinations().then((value) {
      destinations = value;
      notifyListeners();
    });
  }



}