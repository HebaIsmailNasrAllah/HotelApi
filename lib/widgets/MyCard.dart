import 'package:flutter/material.dart';
import 'package:flutter_project/model/Room.dart';

import '../UI/Details.dart';

class MyCard extends StatelessWidget {
  Room room;

  MyCard(Room room) {
    this.room = room;
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 100,

        child:InkWell(
        onTap: () {Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Details(room)),
        );},
        child:Container(

          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width - 10,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 0),
                blurRadius: 0,
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                  tag: room.id,
                  child:
                  ClipRRect(
                    child: Image.network(
                      room.image,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
              Text(
                room.title,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                "\$${room.price}/per night",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              // Divider(height: 12,),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _createStarsRating(),
                  Text(
                    room.rating.toString(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  ),
                ],
              )
            ],
          ),

        )
    ));
  }

  Widget _createStarsRating() {
    return Container(
      child: Row(
        children: [
          Divider(
            height: 12,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Icon(
            Icons.star_half,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }

  _openDetail(context, Room croom) {
    final route = MaterialPageRoute(
      builder: (context) => Details(croom),
    );
    Navigator.push(context, route);
  }

}
