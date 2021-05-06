import 'dart:collection';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/HorizontalCard.dart';
import 'package:flutter_project/widgets/MyCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/providers/DestinationProvider.dart';
import 'package:flutter_project/providers/RoomProvider.dart';
import 'package:provider/provider.dart';

final items = [
  "images/room1.jpg",
  "images/room2.jpg",
  "images/room3.jpg",
  "images/room4.jpg",
  "images/room5.jpg",
  "images/room6.jpg",
  "images/room7.jpg",
  "images/room8.jpg",
  "images/room9.jpg",
  "images/room10.jpg"
];

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Home",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ],
              ),
              actions: [
                //  Image.asset("images/kitten.jpg" , alignment: Alignment.centerLeft)
                Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/kitten.jpg"))))
              ],
            ),
            body: MultiProvider(
              providers: [
                ChangeNotifierProvider<RoomProvider>(
                    create: (context) => RoomProvider()),
                ChangeNotifierProvider<DestinationProvider>(
                    create: (context) => DestinationProvider()),
              ],
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Divider(height: 15, thickness: 20, color: Colors.white),
                      _createHeadlineV2("Destination Places"),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                          height: 200.0,
                          child: Consumer<DestinationProvider>(
                            builder: (buildContext, allDestinations, _) {
                              return (allDestinations.destinations != null)
                                  ? ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          allDestinations.destinations.length,
                                      itemBuilder: (context, index) {
                                        final selectedDestination =
                                            allDestinations.destinations[index];
                                        return HorizontalCard(
                                            selectedDestination);
                                      })
                                  : Center(child: CircularProgressIndicator());
                            },
                          )),
                      Divider(height: 15, thickness: 20, color: Colors.white),
                      _createHeadline("Recomended Rooms"),
                      Consumer<RoomProvider>(
                          builder: (buildContext, allRooms, _) {
                        return (allRooms.rooms != null)
                            ? ListView.builder(
                                itemCount: allRooms.rooms.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final selectedRoom = allRooms.rooms[index];
                                  return MyCard(selectedRoom);
                                })
                            : Center(child: CircularProgressIndicator());
                      }),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
                child: Row(
              children: [
                IconButton(icon: Icon(Icons.home), onPressed: () {}),
                Spacer(),
                IconButton(icon: Icon(Icons.message), onPressed: () {}),
                Spacer(),
                IconButton(icon: Icon(Icons.flight), onPressed: () {}),
                Spacer(),
                IconButton(icon: Icon(Icons.star), onPressed: () {}),
                Spacer(),
                IconButton(icon: Icon(Icons.person), onPressed: () {}),
              ],
            ))));
  }

  Widget _createHeadline(String headline) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(headline,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black))
        ],
      ),
    );
  }

  Widget _createHeadlineV2(String headline) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(headline,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          Spacer(),
          Text("See More",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,), textAlign: TextAlign.start,)
        ],
      ),
    );
  }
}
