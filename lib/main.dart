import 'package:flutter/material.dart';
import 'package:mapsih/map.dart';
import 'package:mapsih/reveivingLocation.dart';

void main() {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}


class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => RecieveLocation(),),);
          },
          child: Container(
            height: 50.0,
            width: 350.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: Center(
              child: Text(
                "Start",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => GetMapDetial()),
                // );