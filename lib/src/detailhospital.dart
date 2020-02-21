class DetailOfHospital {
  final List<Result> result;
  DetailOfHospital({this.result});

  factory DetailOfHospital.fromJson(Map<String,dynamic> json){
    return DetailOfHospital(result:parseResult(json),);
  }

  static List<Result> parseResult(resultJson){
    var list = resultJson['result'] as List;
    List<Result> resultList = list.map((data) => Result.fromJson(data)).toList();
    return resultList;
  }
}

class Result{
  final String formatted_phone_number;
  final String name;

  Result({this.formatted_phone_number,this.name});

  factory Result.fromJson(Map<String,dynamic> parsedJson){
    return Result(formatted_phone_number: parsedJson['formatted_phone_number'], name: parsedJson['name']);
  }
}