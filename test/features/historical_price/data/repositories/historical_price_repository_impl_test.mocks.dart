// Mocks generated by Mockito 5.3.2 from annotations
// in historical_price_clean_architecture/test/features/historical_price/data/repositories/historical_price_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:my_package/features/historical_price/data/datasources/historical_price_data_source.dart'
    as _i3;
import 'package:my_package/features/historical_price/data/models/historical_response_model.dart'
    as _i2;
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

class _FakeHistoricalResponseModel_0 extends _i1.SmartFake
    implements _i2.HistoricalResponseModel {
  _FakeHistoricalResponseModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HistoricalPriceDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockHistoricalPriceDataSource extends _i1.Mock
    implements _i3.HistoricalPriceDataSource {
  MockHistoricalPriceDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.HistoricalResponseModel> getHistoricalPrice() =>
      (super.noSuchMethod(
        Invocation.method(
          #getHistoricalPrice,
          [],
        ),
        returnValue: _i4.Future<_i2.HistoricalResponseModel>.value(
            _FakeHistoricalResponseModel_0(
          this,
          Invocation.method(
            #getHistoricalPrice,
            [],
          ),
        )),
      ) as _i4.Future<_i2.HistoricalResponseModel>);
}
