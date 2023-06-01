import 'dart:convert';

class PM10Model {
  var length;

  PM10Model({
    this.key,
    this.values,
  });

  String? key;
  List<Value>? values;
  String? error;

  factory PM10Model.fromRawJson(String str) =>
      PM10Model.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  PM10Model.withError(
    String errorMessage,
  ) {
    error = errorMessage;
  }

  factory PM10Model.fromJson(Map<String, dynamic> json) => PM10Model(
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
