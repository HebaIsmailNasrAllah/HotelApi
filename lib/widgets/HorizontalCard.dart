import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/model/Destination.dart';

class HorizontalCard extends StatelessWidget {
  Destination destination;

  HorizontalCard( Destination destination){
    this.destination = destination;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 160.0,
        margin: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(destination.image, fit: BoxFit.fill)),
            Center(
                child: Text(
                  destination.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30),
                  textAlign: TextAlign.center,
                ))
          ],
        )

    );
  }

}