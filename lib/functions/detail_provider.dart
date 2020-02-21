import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mapsih/map.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mapsih/src/detailhospital.dart';
import 'package:http/http.dart' as http;
import 'package:mapsih/DETAILS/detailscomplex.dart' as details;

class DetiailsProvider extends StatefulWidget {
  DetiailsProvider({Key key}) : super(key: key);

  @override
  _DetiailsProviderState createState() => _DetiailsProviderState();
}

class _DetiailsProviderState extends State<DetiailsProvider> {
  String calling;

        Future<void> _onMapCreateddetial() async {
        final googlehospital = await details.getHospitalDetails();
        //  print(googlehospital.result.name);
        //  print(googlehospital.result.formatted_phone_number);
        calling = googlehospital.result.name +
            "\n" +
            googlehospital.result.formatted_phone_number;

        Fluttertoast.showToast(
            
            msg: "Calling.." +
                calling +
                "\n There is a severe accident , Please provide medical care!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 0,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 20.0);
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: GestureDetector(
          onTap: () {_onMapCreateddetial();},
                  child: Container(
            height: 50.0,
            width: 300.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: Center(
              child: Text(
                "Inform Hospital",
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

class Hospital {
  final String formatted_phone_number;
  final String name;
  final double rating;

  Hospital(this.formatted_phone_number, this.name, this.rating);
}

// class Details {
//     final String formatted_phone_number;
//     final String name;
//     final double rating;

//     Details(this.formatted_phone_number,this.name,this.rating);
// }

// Future<Details> getHospitlaDetails(){

// }

//      Future<void> _onMapCreateddetial() async {
//   final googlehospital = await details.getHospitalDetails();
//   //  print(googlehospital.result.name);
//   //  print(googlehospital.result.formatted_phone_number);
//   calling = googlehospital.result.name +
//       "\n" +
//       googlehospital.result.formatted_phone_number;

//     Fluttertoast.showToast(
//         msg: "Calling.." + calling + "\n There is a severe accident , Please provide medical care!",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIos: 1,
//         backgroundColor: Colors.green,
//         textColor: Colors.white,
//         fontSize: 20.0);

// }
