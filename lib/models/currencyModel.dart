// To parse this JSON data, do
//
//     final currency = currencyFromJson(jsonString);

import 'dart:convert';

List<Currency> currencyFromJson(String str) => List<Currency>.from(json.decode(str).map((x) => Currency.fromJson(x)));

String currencyToJson(List<Currency> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Currency {
  String code;
  double value;

  Currency({
    required this.code,
    required this.value,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    code: json["code"],
    value: json["value"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "value": value,
  };
}
