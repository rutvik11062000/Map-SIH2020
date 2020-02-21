part of 'detailscomplex.dart';


FinalDetails _$FinalDetailsFromJson(
    Map<String, dynamic> json) {
  return FinalDetails(

    result: json['result'] == null
        ? null
        : Result.fromJson(
            json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FinalDetailsToJson(
        FinalDetails instance) =>
    <String, dynamic>{

      'result': instance.result,

    };