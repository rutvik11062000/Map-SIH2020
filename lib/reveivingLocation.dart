import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mapsih/map.dart';

class RecieveLocation extends StatefulWidget {
  RecieveLocation({Key key}) : super(key: key);

  @override
  _RecieveLocationState createState() => _RecieveLocationState();
}

class _RecieveLocationState extends State<RecieveLocation> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      showSnackbar();
    });
    Timer(Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GetMapDetial()),
      );
    });
    super.initState();
  }

  void showSnackbar() {
    SnackBar snackBar = SnackBar(
      content: Text("Latitude : 21.1707159\nLongitude : 72.8398973"),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 50.0,
          width: 300.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Center(
            child: Text(
              "Fetching the Location..",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
