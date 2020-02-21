part of 'locations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) 
{  return Location(
      lat: (json['lat'] as num)?.toDouble(),
      lng: (json['lng'] as num)?.toDouble());
}

Map<String, dynamic> _$LocationToJson(Location instance) =>
    <String, dynamic>{'lat': instance.lat, 'lng': instance.lng};

  NorthEast _$NorthEastFromJson(Map<String, dynamic> json) 
{  return NorthEast(
      lat: (json['lat'] as num)?.toDouble(),
      lng: (json['lng'] as num)?.toDouble());
}

Map<String, dynamic> _$NorthEastToJson(NorthEast instance) =>
    <String, dynamic>{'lat': instance.lat, 'lng': instance.lng};

SouthWest _$SouthWestFromJson(Map<String, dynamic> json) 
{  return SouthWest(
      lat: (json['lat'] as num)?.toDouble(),
      lng: (json['lng'] as num)?.toDouble());
}

Map<String, dynamic> _$SouthWestToJson(SouthWest instance) =>
    <String, dynamic>{'lat': instance.lat, 'lng': instance.lng};

ViewPort _$ViewPortFromJson(Map<String, dynamic> json) {
  return ViewPort(
      northeast: json['northeast'] == null
          ? null
          : NorthEast.fromJson(json['northeast'] as Map<String, dynamic>),
      southwest: json['southwest'] == null
          ? null
          : SouthWest.fromJson(json['southwest'] as Map<String, dynamic>),);

}

Map<String, dynamic> _$ViewPortToJson(ViewPort instance) => <String, dynamic>{
      'northeast': instance.northeast,
      'southwest': instance.southwest,     
    };

Geometry _$GeometryFromJson(Map<String, dynamic> json) {
  return Geometry(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      viewport: json['viewport'] == null
          ? null
          : ViewPort.fromJson(json['viewport'] as Map<String, dynamic>),);
      
}

Map<String, dynamic> _$GeometryToJson(Geometry instance) => <String, dynamic>{
      'location': instance.location,
      'viewport': instance.viewport,
      
    };

    



Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results(

      geometry: json['geometry'] == null
          ? null
          : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),


           icon: json['icon'] as String,
           id: json['id'] as String,
           name: json['name'] as String,
           place_id: json['place_id'] as String,


          vicinity: json['vicinity'] as String,
          );

      
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'geometry': instance.geometry,
      'icon': instance.icon,
      'id': instance.id,
      'name': instance.name,
      'vicinity' : instance.vicinity,
      'place_id' : instance.place_id,

    };

Locations _$LocationsFromJson(Map<String, dynamic> json) {
  return Locations(
      results: (json['results'] as List)
          ?.map((e) =>
              e == null ? null : Results.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$LocationsToJson(Locations instance) =>
    <String, dynamic>{'results': instance.results};