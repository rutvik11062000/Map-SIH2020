import 'dart:convert';
import 'dart:io';
import 'package:mapsih/src/detailhospital.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'detailscomplex.g.dart';


@JsonSerializable()
class FinalDetails {
  FinalDetails({

    this.result,

  });


  final Result result;


  factory FinalDetails.fromJson(Map<String, dynamic> json) =>
      _$FinalDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$FinalDetailsToJson(this);
}

Future<FinalDetails> getHospitalDetails() async {
  //const googleLocationsURL = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=21.1707159,72.8398973&radius=1500&type=hospital&key=AIzaSyA6cteO_rciasQDNZaQK6oWe3FfO_giGwk';
String baseurl = "https://maps.googleapis.com/maps/api/place/details/json?";
String placeid = "place_id=ChIJ4eKOCvBO4DsR9MJ3GakwqiE";
String fields = "&fields=name,rating,formatted_phone_number";
String key = "&key=AIzaSyA6cteO_rciasQDNZaQK6oWe3FfO_giGwk";

String finalurl = baseurl + placeid + fields + key;
const detailURL = "https://maps.googleapis.com/maps/api/place/details/json?place_id=ChIJ4eKOCvBO4DsR9MJ3GakwqiE&fields=name,rating,formatted_phone_number&key=AIzaSyA6cteO_rciasQDNZaQK6oWe3FfO_giGwk";
// https://about.google/static/data/locations.json
  // Retrieve the locations of Google offices
  final response = await http.get(detailURL);
  if (response.statusCode == 200) {
    return FinalDetails.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(detailURL));
  }
}
