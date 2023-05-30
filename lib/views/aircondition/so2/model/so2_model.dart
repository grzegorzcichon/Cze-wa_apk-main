import 'dart:convert';

class SO2Model {
  var length;

  SO2Model({
    this.key,
    this.values,
  });

  String? key;
  List<Value>? values;
  String? error;

  factory SO2Model.fromRawJson(String str) =>
      SO2Model.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  SO2Model.withError(
    String errorMessage,
  ) {
    error = errorMessage;
  }

  factory SO2Model.fromJson(Map<String, dynamic> json) => SO2Model(
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
