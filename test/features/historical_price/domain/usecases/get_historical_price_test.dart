import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_package/features/historical_price/domain/entities/historical.dart';
import 'package:my_package/features/historical_price/domain/entities/historical_response.dart';
import 'package:my_package/features/historical_price/domain/repositories/historical_price_repository.dart';
import 'package:my_package/features/historical_price/domain/usecases/get_historical_price.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_historical_price_test.mocks.dart';

@GenerateMocks([HistoricalPriceRepository])
void main() {
  late GetHistoricalPrice usecase;
  late MockHistoricalPriceRepository mockHistoricalPriceRepository;
  final tHistoricalResponse = HistoricalResponse(
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

  setUp(() {
    mockHistoricalPriceRepository = MockHistoricalPriceRepository();
    usecase = GetHistoricalPrice(mockHistoricalPriceRepository);
  });

  test("should get historical price from the repository", () async {
    when(mockHistoricalPriceRepository.getHistoricalPrice()).thenAnswer((
        _) async => Right(tHistoricalResponse));
    final result = await usecase.execute();
    expect(result, Right(tHistoricalResponse));
    verify(mockHistoricalPriceRepository.getHistoricalPrice());
    verifyNoMoreInteractions(mockHistoricalPriceRepository);
  });
}
