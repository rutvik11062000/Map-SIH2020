// TODO Implement this library.
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'locations.g.dart';

@JsonSerializable()
class Location {
  Location({
    this.lat,
    this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);

  final double lat;
  final double lng;
}

@JsonSerializable()
class NorthEast {
  NorthEast({
    this.lat,
    this.lng,
  });

  factory NorthEast.fromJson(Map<String, dynamic> json) => _$NorthEastFromJson(json);
  Map<String, dynamic> toJson() => _$NorthEastToJson(this);

  final double lat;
  final double lng;
}

@JsonSerializable()
class SouthWest {
  SouthWest({
    this.lat,
    this.lng,
  });

  factory SouthWest.fromJson(Map<String, dynamic> json) => _$SouthWestFromJson(json);
  Map<String, dynamic> toJson() => _$SouthWestToJson(this);

  final double lat;
  final double lng;
}

@JsonSerializable()
class ViewPort {
  ViewPort({
    this.northeast,
    this.southwest,
  });

  factory ViewPort.fromJson(Map<String, dynamic> json) => _$ViewPortFromJson(json);
  Map<String, dynamic> toJson() => _$ViewPortToJson(this);

  final NorthEast northeast;
  final SouthWest southwest;
}

@JsonSerializable()
class Geometry {
  Geometry({
    this.viewport,  
    this.location,
   
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => _$GeometryFromJson(json);
  Map<String, dynamic> toJson() => _$GeometryToJson(this);

  final ViewPort viewport;
  final Location location;
  
}








@JsonSerializable()
class Results {
  Results({
    this.geometry, 
    this.icon,
    this.id,
    this.name, 
    
   
    this.vicinity,
    this.place_id,

  });

  factory Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);

  final Geometry geometry;
  final String icon;
  final String id;
  final String name;

  final String vicinity;
  final String place_id;
}










@JsonSerializable()
class Locations {
  Locations({
    this.results,
  });

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);
  Map<String, dynamic> toJson() => _$LocationsToJson(this);

  final List<Results> results;
}

Future<Locations> getGoogleOffices() async {
//  const googleLocationsURL = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=21.1707159,72.8398973&radius=1500&type=hospital&key=AIzaSyA6cteO_rciasQDNZaQK6oWe3FfO_giGwk';
 const  String baseurl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?";
 const String location = "location=21.1707159,72.8398973&";
 const String radius = "radius=1500&";
 const String type ="type=hospital&";
 const String key = "key=AIzaSyA6cteO_rciasQDNZaQK6oWe3FfO_giGwk";

 const  googleLocationsURL = "" + baseurl + location + radius + type + key ;
// https://about.google/static/data/locations.json
  // Retrieve the locations of Google offices
  final response = await http.get(googleLocationsURL);
  if (response.statusCode == 200) {
    return Locations.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(googleLocationsURL));
  }
}