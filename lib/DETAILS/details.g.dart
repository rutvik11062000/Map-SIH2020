part of 'details.dart';

Result _$ResultFromJson(
    Map<String, dynamic> json) {
  return Result(
    formatted_phone_number: json['formatted_phone_number'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ResultToJson(
        Result instance) =>
    <String, dynamic>{
      'formatted_phone_number': instance.formatted_phone_number,
      'name': instance.name,
    };


















// Result _$ResultFromJson(Map<String, dynamic> json) {
//   return Result(

//            formatted_phone_number: json['formatted_phone_number'] as String,
//            name: json['name'] as String,);  
// }

// Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
//       'formatted_phone_number': instance.formatted_phone_number,
//       'name': instance.name,
//     };

// Details _$DetailsFromJson(Map<String, dynamic> json) {
//   return Details(
//     result: json['result'] == null
//         ? null
//         : Result.fromJson(
//             json['anObject'] as Map<String, dynamic>),);
// }

// Map<String, dynamic> _$DetailsToJson(Details instance) =>
//     <String, dynamic>{'result': instance.result};

        // anObject: json['anObject'] == null
        // ? null
        // : SerializableSimpleObject.fromJson(
        //     json['anObject'] as Map<String, dynamic>),


          //     result: (json['result'] as Map<String, dynamic>)
          // ?.map((e) =>
          //     e == null ? null : Result.fromJson(e as Map<String, dynamic>))
          // ?.toList());