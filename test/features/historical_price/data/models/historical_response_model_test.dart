import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:my_package/features/historical_price/data/models/historical_response_model.dart';
import 'package:my_package/features/historical_price/domain/entities/historical.dart';
import 'package:my_package/features/historical_price/domain/entities/historical_response.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tHistoricalResponse = HistoricalResponseModel(
    symbol: "AAPL",
    historical: [
      Historical(
          date: DateTime(2023, 1, 31),
          open: 142.7,
          high: 144.34,
          low: 142.28,
          close: 144.29,
          adjClose: 144.29,
          volume: 60340323,
          unadjustedVolume: 60339047,
          change: 1.59,
          changePercent: 1.114,
          vwap: 143.63667,
          label: "January 31, 23",
          changeOverTime: 0.01114),
      Historical(
          date: DateTime(2023, 1, 30),
          open: 144.955,
          high: 145.53,
          low: 142.85,
          close: 143,
          adjClose: 143,
          volume: 59370642,
          unadjustedVolume: 59365514,
          change: -1.955,
          changePercent: -1.349,
          vwap: 143.79333,
          label: "January 30, 23",
          changeOverTime: -0.01349),
    ],
  );

  test('should be a subclass of HistoricalResponse entity', () {
    expect(tHistoricalResponse, isA<HistoricalResponse>());
  });

  group('fromJson', () {
    test('should return a valid model', () {
      final Map<String, dynamic> jsonMap =
          jsonDecode(fixture('historical_response.json'));
      final result = HistoricalResponseModel.fromJson(jsonMap);
      expect(result, isA<HistoricalResponseModel>());
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () {
      final result = tHistoricalResponse.toJson();
      final expectedJsonMap = {
        "symbol": "AAPL",
        "historical": [
          {
            "date": "2023-01-31",
            "open": 142.7,
            "high": 144.34,
            "low": 142.28,
            "close": 144.29,
            "adjClose": 144.29,
            "volume": 60340323,
            "unadjustedVolume": 60339047,
            "change": 1.59,
            "changePercent": 1.114,
            "vwap": 143.63667,
            "label": "January 31, 23",
            "changeOverTime": 0.01114
          },
          {
            "date": "2023-01-30",
            "open": 144.955,
            "high": 145.53,
            "low": 142.85,
            "close": 143,
            "adjClose": 143,
            "volume": 59370642,
            "unadjustedVolume": 59365514,
            "change": -1.955,
            "changePercent": -1.349,
            "vwap": 143.79333,
            "label": "January 30, 23",
            "changeOverTime": -0.01349
          }
        ]
      };
      expect(result, expectedJsonMap);
    });
  });
}
