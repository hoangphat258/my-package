import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_package/core/errors/failure.dart';
import 'package:my_package/features/historical_price/domain/entities/historical.dart';
import 'package:my_package/features/historical_price/domain/entities/historical_response.dart';
import 'package:my_package/features/historical_price/domain/usecases/get_historical_price.dart';
import 'package:my_package/features/historical_price/presentation/bloc/historical_price_bloc.dart';
import 'package:my_package/features/historical_price/presentation/bloc/historical_price_event.dart';
import 'package:my_package/features/historical_price/presentation/bloc/historical_price_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'historical_price_bloc_test.mocks.dart';

@GenerateMocks([GetHistoricalPrice])
void main() {
  late HistoricalPriceBloc bloc;
  late MockGetHistoricalPrice mockGetHistoricalPrice;
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
    mockGetHistoricalPrice = MockGetHistoricalPrice();
    bloc = HistoricalPriceBloc(mockGetHistoricalPrice);
  });

  test('initialState should be Empty', () {
    expect(bloc.state, Empty());
  });

  test('should get data from the use case', () async {
    when(mockGetHistoricalPrice.execute())
        .thenAnswer((_) async => Right(tHistoricalResponse));
    bloc.add(GetHistoricalPriceEvent());
    await untilCalled(mockGetHistoricalPrice.execute());
    verify(mockGetHistoricalPrice.execute());
  });

  test('should emit [Loading, Loaded] when data is gotten successfully', () {
    when(mockGetHistoricalPrice.execute())
        .thenAnswer((_) async => Right(tHistoricalResponse));
    final expected = [Loading(), Loaded(tHistoricalResponse)];
    expectLater(bloc.stream, emitsInOrder(expected));
    bloc.add(GetHistoricalPriceEvent());
  });

  test('should emit [Loading, Error] when getting data fails', () {
    when(mockGetHistoricalPrice.execute())
        .thenAnswer((_) async => Left(Failure()));
    final expected = [Loading(), Error("Error while fetching data")];
    expectLater(bloc.stream, emitsInOrder(expected));
    bloc.add(GetHistoricalPriceEvent());
  });
}
