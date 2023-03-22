// To parse this JSON data, do
//
//     final NO2Model = NO2ModelFromJson(jsonString);

import 'dart:convert';

class NO2Model {
  var length;

  NO2Model({
    this.key,
    this.values,
  });

  String? key;
  List<Value>? values;
  String? error;

  factory NO2Model.fromRawJson(String str) =>
      NO2Model.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  NO2Model.withError(
    String errorMessage,
  ) {
    error = errorMessage;
  }

  factory NO2Model.fromJson(Map<String, dynamic> json) => NO2Model(
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
