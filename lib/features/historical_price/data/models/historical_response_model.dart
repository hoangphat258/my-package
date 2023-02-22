import 'package:my_package/features/historical_price/domain/entities/historical.dart';
import 'package:my_package/features/historical_price/domain/entities/historical_response.dart';

class HistoricalResponseModel extends HistoricalResponse {
  const HistoricalResponseModel({super.symbol, super.historical});

  factory HistoricalResponseModel.fromJson(Map<String, dynamic> json) =>
      HistoricalResponseModel(
        symbol: json["symbol"],
        historical: List<Historical>.from(
            json["historical"].map((e) => Historical.fromJson(e))),
      );

  Map<String, dynamic> toJson() => {
    "symbol": symbol,
    "historical": List<dynamic>.from(historical.map((e) => e.toJson())),
  };
}
