// Mocks generated by Mockito 5.4.4 from annotations
// in weather_bloc_app/test/bloc/weather_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:weather_bloc_app/data/models/general_error/domain/general_error.dart'
    as _i5;
import 'package:weather_bloc_app/data/models/location_autocomplete/domain/location_autocomplete.dart'
    as _i6;
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/location_info.dart'
    as _i10;
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/weather_conditions_history.dart'
    as _i12;
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/weather_current_conditions.dart'
    as _i7;
import 'package:weather_bloc_app/data/models/weather_forecast/domain/weather_forecast.dart'
    as _i8;
import 'package:weather_bloc_app/data/repositories/favorites_repository.dart'
    as _i9;
import 'package:weather_bloc_app/data/repositories/history_repository.dart'
    as _i11;
import 'package:weather_bloc_app/data/repositories/weather_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
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

/// A class which mocks [WeatherRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherRepository extends _i1.Mock implements _i3.WeatherRepository {
  @override
  _i4.Future<_i2.Either<_i5.GeneralError, List<_i6.LocationAutocomplete>>>
      cityAutocompleteSearch(String? phrase) => (super.noSuchMethod(
            Invocation.method(
              #cityAutocompleteSearch,
              [phrase],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.GeneralError,
                        List<_i6.LocationAutocomplete>>>.value(
                _FakeEither_0<_i5.GeneralError, List<_i6.LocationAutocomplete>>(
              this,
              Invocation.method(
                #cityAutocompleteSearch,
                [phrase],
              ),
            )),
            returnValueForMissingStub: _i4.Future<
                    _i2.Either<_i5.GeneralError,
                        List<_i6.LocationAutocomplete>>>.value(
                _FakeEither_0<_i5.GeneralError, List<_i6.LocationAutocomplete>>(
              this,
              Invocation.method(
                #cityAutocompleteSearch,
                [phrase],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.GeneralError, List<_i6.LocationAutocomplete>>>);

  @override
  _i4.Future<_i2.Either<_i5.GeneralError, _i7.WeatherCurrentConditions>>
      fetchCurrentConditions(String? locationKey) => (super.noSuchMethod(
            Invocation.method(
              #fetchCurrentConditions,
              [locationKey],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.GeneralError,
                        _i7.WeatherCurrentConditions>>.value(
                _FakeEither_0<_i5.GeneralError, _i7.WeatherCurrentConditions>(
              this,
              Invocation.method(
                #fetchCurrentConditions,
                [locationKey],
              ),
            )),
            returnValueForMissingStub: _i4.Future<
                    _i2.Either<_i5.GeneralError,
                        _i7.WeatherCurrentConditions>>.value(
                _FakeEither_0<_i5.GeneralError, _i7.WeatherCurrentConditions>(
              this,
              Invocation.method(
                #fetchCurrentConditions,
                [locationKey],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.GeneralError, _i7.WeatherCurrentConditions>>);

  @override
  _i4.Future<_i2.Either<_i5.GeneralError, List<_i8.WeatherForecast>>>
      fetchFiveDaysForecast(String? locationKey) => (super.noSuchMethod(
            Invocation.method(
              #fetchFiveDaysForecast,
              [locationKey],
            ),
            returnValue: _i4.Future<
                    _i2
                    .Either<_i5.GeneralError, List<_i8.WeatherForecast>>>.value(
                _FakeEither_0<_i5.GeneralError, List<_i8.WeatherForecast>>(
              this,
              Invocation.method(
                #fetchFiveDaysForecast,
                [locationKey],
              ),
            )),
            returnValueForMissingStub: _i4.Future<
                    _i2
                    .Either<_i5.GeneralError, List<_i8.WeatherForecast>>>.value(
                _FakeEither_0<_i5.GeneralError, List<_i8.WeatherForecast>>(
              this,
              Invocation.method(
                #fetchFiveDaysForecast,
                [locationKey],
              ),
            )),
          ) as _i4
              .Future<_i2.Either<_i5.GeneralError, List<_i8.WeatherForecast>>>);
}

/// A class which mocks [FavoritesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFavoritesRepository extends _i1.Mock
    implements _i9.FavoritesRepository {
  @override
  _i4.Future<_i2.Either<_i5.GeneralError, void>> add(_i10.LocationInfo? item) =>
      (super.noSuchMethod(
        Invocation.method(
          #add,
          [item],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.GeneralError, void>>.value(
            _FakeEither_0<_i5.GeneralError, void>(
          this,
          Invocation.method(
            #add,
            [item],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.GeneralError, void>>.value(
                _FakeEither_0<_i5.GeneralError, void>(
          this,
          Invocation.method(
            #add,
            [item],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.GeneralError, void>>);

  @override
  _i4.Future<_i2.Either<_i5.GeneralError, void>> delete(
          _i10.LocationInfo? item) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [item],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.GeneralError, void>>.value(
            _FakeEither_0<_i5.GeneralError, void>(
          this,
          Invocation.method(
            #delete,
            [item],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.GeneralError, void>>.value(
                _FakeEither_0<_i5.GeneralError, void>(
          this,
          Invocation.method(
            #delete,
            [item],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.GeneralError, void>>);

  @override
  _i4.Stream<List<_i10.LocationInfo>> queryAllListener() => (super.noSuchMethod(
        Invocation.method(
          #queryAllListener,
          [],
        ),
        returnValue: _i4.Stream<List<_i10.LocationInfo>>.empty(),
        returnValueForMissingStub: _i4.Stream<List<_i10.LocationInfo>>.empty(),
      ) as _i4.Stream<List<_i10.LocationInfo>>);
}

/// A class which mocks [HistoryRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHistoryRepository extends _i1.Mock implements _i11.HistoryRepository {
  @override
  _i4.Future<_i2.Either<_i5.GeneralError, void>> add(
          _i7.WeatherCurrentConditions? item) =>
      (super.noSuchMethod(
        Invocation.method(
          #add,
          [item],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.GeneralError, void>>.value(
            _FakeEither_0<_i5.GeneralError, void>(
          this,
          Invocation.method(
            #add,
            [item],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.GeneralError, void>>.value(
                _FakeEither_0<_i5.GeneralError, void>(
          this,
          Invocation.method(
            #add,
            [item],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.GeneralError, void>>);

  @override
  _i4.Stream<List<_i12.WeatherConditionsHistory>> queryAllListener() =>
      (super.noSuchMethod(
        Invocation.method(
          #queryAllListener,
          [],
        ),
        returnValue: _i4.Stream<List<_i12.WeatherConditionsHistory>>.empty(),
        returnValueForMissingStub:
            _i4.Stream<List<_i12.WeatherConditionsHistory>>.empty(),
      ) as _i4.Stream<List<_i12.WeatherConditionsHistory>>);
}
