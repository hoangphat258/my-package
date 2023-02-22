// Mocks generated by Mockito 5.3.2 from annotations
// in historical_price_clean_architecture/test/features/historical_price/domain/usecases/get_historical_price_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:my_package/core/errors/failure.dart'
    as _i5;
import 'package:my_package/features/historical_price/domain/entities/historical_response.dart'
    as _i6;
import 'package:my_package/features/historical_price/domain/repositories/historical_price_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HistoricalPriceRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHistoricalPriceRepository extends _i1.Mock
    implements _i3.HistoricalPriceRepository {
  MockHistoricalPriceRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<
      _i2
          .Either<_i5.Failure, _i6.HistoricalResponse>> getHistoricalPrice() =>
      (super.noSuchMethod(
        Invocation.method(
          #getHistoricalPrice,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.HistoricalResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.HistoricalResponse>(
          this,
          Invocation.method(
            #getHistoricalPrice,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.HistoricalResponse>>);
}