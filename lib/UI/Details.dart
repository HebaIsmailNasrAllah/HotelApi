import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/model/Room.dart';

class Details extends StatelessWidget {
  Room screenCurrentRoom;
  var widthSize;
  var heightSize;

  Details(Room screenCurrentRoom) {
    this.screenCurrentRoom = screenCurrentRoom;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("Hello From Details");
    var myPlacelist = screenCurrentRoom.title.split(" ");
    var list = [];
    for(int i=0; i<myPlacelist.length; i++){
      if (i>=1){
        list.add(myPlacelist[i]);
      }
    }
    widthSize = MediaQuery.of(context).size.width;
    heightSize = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Hero(
                  tag: screenCurrentRoom.id,
                  child:
        Image.network(screenCurrentRoom.image,
                    fit: BoxFit.cover,
                  ))
        )
          ,
          Positioned(
              top: 10,
              left: 20,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Icon(Icons.arrow_back),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        shape: BoxShape.circle
                        // borderRadius: BorderRadius.circular(50),
                        ),
                  ))),
          Positioned(
              height: 200.0,
              bottom: 40.0,
              left: 15.0,
              right: 15.0,
              child: Card(
                color: Colors.white.withOpacity(0.5),
                elevation: 0.0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                    child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Commented this part
                        _setRoomDetails(myPlacelist[0], list.join(" ")) ,
                        //_setRoomDetails(screenCurrentRoom.title, ""),
                        Divider(),
                        _setPricingDetails(screenCurrentRoom.price, "day"),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _rating(screenCurrentRoom.location),
                        Divider(),
                        _createHeartShape(),
                      ],
                    )
                  ],
                )),
              ))
        ],
      ),
    ));
  }

  Widget _createStarsRating() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.star,
            color: Colors.deepPurple,
          ),
          Icon(
            Icons.star,
            color: Colors.deepPurple,
          ),
          Icon(
            Icons.star,
            color: Colors.deepPurple,
          ),
          Icon(
            Icons.star,
            color: Colors.deepPurple,
          ),
          Icon(
            Icons.star_half,
            color: Colors.deepPurple,
          ),
        ],
      ),
    );
  }

  Widget _setLocation(String locationName) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.location_on,
          color: Colors.black45,
        ),
        Text(
          locationName,
          style: TextStyle(
              color: Colors.black45, fontSize: 15, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
      ],
    ));
  }

  Widget _setRoomDetails(String combound, String spec) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          thickness: 10.0,
          color: Colors.black45,
        ),
         Text(
          combound,
          style: TextStyle(
              color: Colors.black45, fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
           //maxLines: 1,
           //overflow: TextOverflow.clip ,
        ),

        Text(
          spec,
          style: TextStyle(
              color: Colors.black45, fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        /*Divider(
          thickness: 10.0,
          color: Colors.black45,
        ),*/
      ],
    ));
  }

  Widget _setPricingDetails(String price, String duration) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Divider(
          thickness: 10.0,
          color: Colors.black45,
        ),
        Text(
          "\$ $price",
          style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 25,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          "/per $duration",
          style: TextStyle(
              color: Colors.black45,
              fontSize: 20,
              fontWeight: FontWeight.normal),
          textAlign: TextAlign.center,
        ),
        // Divider(thickness: 10.0 ,color: Colors.black45,),
      ],
    ));
  }

  Widget _createHeartShape() {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Divider(
          thickness: 10.0,
          color: Colors.black45,
        ),
        Icon(
          Icons.favorite,
          color: Colors.black45,
          size: 35,
        )
      ],
    ));
  }

  Widget _rating(String location) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            thickness: 10.0,
            color: Colors.black45,
          ),
          _createStarsRating(),
          _setLocation(location),
          Divider(
            thickness: 10.0,
            color: Colors.black45,
          ),
        ],
      ),
    );
  }
}
