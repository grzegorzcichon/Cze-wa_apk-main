// To parse this JSON data, do
//
//     final c6H6Model = c6H6ModelFromJson(jsonString);

import 'dart:convert';

class O3Model {
  var length;

  O3Model({
    this.key,
    this.values,
  });

  String? key;
  List<Value>? values;
  String? error;

  factory O3Model.fromRawJson(String str) => O3Model.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  O3Model.withError(
    String errorMessage,
  ) {
    error = errorMessage;
  }

  factory O3Model.fromJson(Map<String, dynamic> json) => O3Model(
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
