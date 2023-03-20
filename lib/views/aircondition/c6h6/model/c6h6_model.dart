// To parse this JSON data, do
//
//     final c6H6Model = c6H6ModelFromJson(jsonString);

import 'dart:convert';

class C6H6Model {
  var length;

  C6H6Model({
    this.key,
    this.values,
  });

  String? key;
  List<Value>? values;
  String? error;

  factory C6H6Model.fromRawJson(String str) =>
      C6H6Model.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  C6H6Model.withError(
    String errorMessage,
  ) {
    error = errorMessage;
  }

  factory C6H6Model.fromJson(Map<String, dynamic> json) => C6H6Model(
        key: json["key"],
        values: json["values"] == null
            ? []
            : List<Value>.from(json["values"]!.map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x.toJson())),
      };
}

class Value {
  Value({
    this.date,
    this.value,
  });

  final DateTime? date;
  final double? value;

  factory Value.fromRawJson(String str) => Value.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "value": value,
      };
}
