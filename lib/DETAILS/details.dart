import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'details.g.dart';

@JsonSerializable()
class Result {
  Result({
    this.formatted_phone_number,
    this.name,

  });

  final String formatted_phone_number;
  final String name;


  factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}


