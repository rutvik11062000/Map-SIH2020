import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapsih/functions/detail_provider.dart';
import 'package:mapsih/main.dart';
import 'src/locations.dart' as locations;

class GetMapDetial extends StatefulWidget {
  GetMapDetial({Key key}) : super(key: key);

  @override
  _GetMapDetialState createState() => _GetMapDetialState();
}

List<String> place_id = new List();

class _GetMapDetialState extends State<GetMapDetial> {
  final _scafflodkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      showSnackbar();
    });
        Timer(Duration(seconds: 10), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetiailsProvider()),
      );
    });
    super.initState();
  }

  void showSnackbar() {
    SnackBar snackBar = SnackBar(
      content: Text("Fetching Details of Nearest hospital"),
      duration: Duration(seconds: 3),
    );
    _scafflodkey.currentState.showSnackBar(snackBar);
  }

  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final result in googleOffices.results) {
        if (result.place_id != null) {
          place_id.add(result.place_id);
        }
        // placeid.add(result.place_id);
        final marker = Marker(
          markerId: MarkerId(result.name),
          position: LatLng(
              result.geometry.location.lat, result.geometry.location.lng),
          infoWindow: InfoWindow(
            title: result.name,
            snippet: result.vicinity,
          ),
        );
        _markers[result.name] = marker;
      }
    });
    // print(place_id.length);
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: _scafflodkey,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Nearby Hospital'),
            backgroundColor: Colors.green[700],
            // actions: <Widget>[
            //   IconButton(
            //       icon: Icon(Icons.contact_phone),
            //       onPressed: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => DetiailsProvider()),
            //         );
            //       }),
            // ],
          ),
          body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: const LatLng(21.1702, 72.8311),
              zoom: 14,
            ),
            markers: _markers.values.toSet(),
          ),
        ),
      );
}

// Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => DetiailsProvider()),
//                   );
