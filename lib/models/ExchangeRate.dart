import 'package:mcer/Models/Rate.dart';

class ExchangeRate {
  String info;
  String description;
  String timestamp;
  Rate rates;

  ExchangeRate({this.info, this.description, this.timestamp, this.rates});
  factory ExchangeRate.fromJson(Map<String, dynamic> json) =>
      _exchangeRateJson(json);
}

ExchangeRate _exchangeRateJson(Map<String, dynamic> json) {
  var rateJson = json['rates'];
  Rate rates = rateJson != null ? Rate.fromJson(rateJson) : null;
  return ExchangeRate(
    info: json['info'] as String,
    description: json['description'] as String,
    timestamp: json['timestamp'] as String,
    rates: rates,
  );
}