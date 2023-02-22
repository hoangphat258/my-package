import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_package/core/errors/exception.dart';
import 'package:my_package/core/errors/failure.dart';
import 'package:my_package/features/historical_price/data/datasources/historical_price_data_source.dart';
import 'package:my_package/features/historical_price/data/models/historical_response_model.dart';
import 'package:my_package/features/historical_price/data/repositories/historical_price_repository_impl.dart';
import 'package:my_package/features/historical_price/domain/entities/historical.dart';
import 'package:my_package/features/historical_price/domain/entities/historical_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'historical_price_repository_impl_test.mocks.dart';

@GenerateMocks([HistoricalPriceDataSource])
void main() {
  late HistoricalPriceRepositoryImpl repository;
  late MockHistoricalPriceDataSource mockDataSource;

  final tHistoricalResponseModel = HistoricalResponseModel(
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
  final HistoricalResponse tHistoricalResponse = tHistoricalResponseModel;

  setUp(() {
    mockDataSource = MockHistoricalPriceDataSource();
    repository = HistoricalPriceRepositoryImpl(mockDataSource);
  });

  test('should return data when the call is successful', () async {
    when(mockDataSource.getHistoricalPrice())
        .thenAnswer((_) async => tHistoricalResponseModel);
    final result = await repository.getHistoricalPrice();
    verify(mockDataSource.getHistoricalPrice());
    expect(result, equals(Right(tHistoricalResponse)));
  });

  test('should return server failure when the call is unsuccessful', () async {
    when(mockDataSource.getHistoricalPrice()).thenThrow(ServerException());
    final result = await repository.getHistoricalPrice();
    verify(mockDataSource.getHistoricalPrice());
    expect(result, Left(Failure()));
  });
}
