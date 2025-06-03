// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CarEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getMyCars,
    required TResult Function(AddCarRequestModel request) addCar,
    required TResult Function(String carId, UpdateCarRequestModel request)
        updateCar,
    required TResult Function(String carId) deleteCar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getMyCars,
    TResult? Function(AddCarRequestModel request)? addCar,
    TResult? Function(String carId, UpdateCarRequestModel request)? updateCar,
    TResult? Function(String carId)? deleteCar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getMyCars,
    TResult Function(AddCarRequestModel request)? addCar,
    TResult Function(String carId, UpdateCarRequestModel request)? updateCar,
    TResult Function(String carId)? deleteCar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetMyCars value) getMyCars,
    required TResult Function(_AddCar value) addCar,
    required TResult Function(_UpdateCar value) updateCar,
    required TResult Function(_DeleteCar value) deleteCar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetMyCars value)? getMyCars,
    TResult? Function(_AddCar value)? addCar,
    TResult? Function(_UpdateCar value)? updateCar,
    TResult? Function(_DeleteCar value)? deleteCar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetMyCars value)? getMyCars,
    TResult Function(_AddCar value)? addCar,
    TResult Function(_UpdateCar value)? updateCar,
    TResult Function(_DeleteCar value)? deleteCar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarEventCopyWith<$Res> {
  factory $CarEventCopyWith(CarEvent value, $Res Function(CarEvent) then) =
      _$CarEventCopyWithImpl<$Res, CarEvent>;
}

/// @nodoc
class _$CarEventCopyWithImpl<$Res, $Val extends CarEvent>
    implements $CarEventCopyWith<$Res> {
  _$CarEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetMyCarsImplCopyWith<$Res> {
  factory _$$GetMyCarsImplCopyWith(
          _$GetMyCarsImpl value, $Res Function(_$GetMyCarsImpl) then) =
      __$$GetMyCarsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetMyCarsImplCopyWithImpl<$Res>
    extends _$CarEventCopyWithImpl<$Res, _$GetMyCarsImpl>
    implements _$$GetMyCarsImplCopyWith<$Res> {
  __$$GetMyCarsImplCopyWithImpl(
      _$GetMyCarsImpl _value, $Res Function(_$GetMyCarsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetMyCarsImpl implements _GetMyCars {
  const _$GetMyCarsImpl();

  @override
  String toString() {
    return 'CarEvent.getMyCars()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetMyCarsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getMyCars,
    required TResult Function(AddCarRequestModel request) addCar,
    required TResult Function(String carId, UpdateCarRequestModel request)
        updateCar,
    required TResult Function(String carId) deleteCar,
  }) {
    return getMyCars();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getMyCars,
    TResult? Function(AddCarRequestModel request)? addCar,
    TResult? Function(String carId, UpdateCarRequestModel request)? updateCar,
    TResult? Function(String carId)? deleteCar,
  }) {
    return getMyCars?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getMyCars,
    TResult Function(AddCarRequestModel request)? addCar,
    TResult Function(String carId, UpdateCarRequestModel request)? updateCar,
    TResult Function(String carId)? deleteCar,
    required TResult orElse(),
  }) {
    if (getMyCars != null) {
      return getMyCars();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetMyCars value) getMyCars,
    required TResult Function(_AddCar value) addCar,
    required TResult Function(_UpdateCar value) updateCar,
    required TResult Function(_DeleteCar value) deleteCar,
  }) {
    return getMyCars(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetMyCars value)? getMyCars,
    TResult? Function(_AddCar value)? addCar,
    TResult? Function(_UpdateCar value)? updateCar,
    TResult? Function(_DeleteCar value)? deleteCar,
  }) {
    return getMyCars?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetMyCars value)? getMyCars,
    TResult Function(_AddCar value)? addCar,
    TResult Function(_UpdateCar value)? updateCar,
    TResult Function(_DeleteCar value)? deleteCar,
    required TResult orElse(),
  }) {
    if (getMyCars != null) {
      return getMyCars(this);
    }
    return orElse();
  }
}

abstract class _GetMyCars implements CarEvent {
  const factory _GetMyCars() = _$GetMyCarsImpl;
}

/// @nodoc
abstract class _$$AddCarImplCopyWith<$Res> {
  factory _$$AddCarImplCopyWith(
          _$AddCarImpl value, $Res Function(_$AddCarImpl) then) =
      __$$AddCarImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddCarRequestModel request});
}

/// @nodoc
class __$$AddCarImplCopyWithImpl<$Res>
    extends _$CarEventCopyWithImpl<$Res, _$AddCarImpl>
    implements _$$AddCarImplCopyWith<$Res> {
  __$$AddCarImplCopyWithImpl(
      _$AddCarImpl _value, $Res Function(_$AddCarImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$AddCarImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as AddCarRequestModel,
    ));
  }
}

/// @nodoc

class _$AddCarImpl implements _AddCar {
  const _$AddCarImpl(this.request);

  @override
  final AddCarRequestModel request;

  @override
  String toString() {
    return 'CarEvent.addCar(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCarImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of CarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCarImplCopyWith<_$AddCarImpl> get copyWith =>
      __$$AddCarImplCopyWithImpl<_$AddCarImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getMyCars,
    required TResult Function(AddCarRequestModel request) addCar,
    required TResult Function(String carId, UpdateCarRequestModel request)
        updateCar,
    required TResult Function(String carId) deleteCar,
  }) {
    return addCar(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getMyCars,
    TResult? Function(AddCarRequestModel request)? addCar,
    TResult? Function(String carId, UpdateCarRequestModel request)? updateCar,
    TResult? Function(String carId)? deleteCar,
  }) {
    return addCar?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getMyCars,
    TResult Function(AddCarRequestModel request)? addCar,
    TResult Function(String carId, UpdateCarRequestModel request)? updateCar,
    TResult Function(String carId)? deleteCar,
    required TResult orElse(),
  }) {
    if (addCar != null) {
      return addCar(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetMyCars value) getMyCars,
    required TResult Function(_AddCar value) addCar,
    required TResult Function(_UpdateCar value) updateCar,
    required TResult Function(_DeleteCar value) deleteCar,
  }) {
    return addCar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetMyCars value)? getMyCars,
    TResult? Function(_AddCar value)? addCar,
    TResult? Function(_UpdateCar value)? updateCar,
    TResult? Function(_DeleteCar value)? deleteCar,
  }) {
    return addCar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetMyCars value)? getMyCars,
    TResult Function(_AddCar value)? addCar,
    TResult Function(_UpdateCar value)? updateCar,
    TResult Function(_DeleteCar value)? deleteCar,
    required TResult orElse(),
  }) {
    if (addCar != null) {
      return addCar(this);
    }
    return orElse();
  }
}

abstract class _AddCar implements CarEvent {
  const factory _AddCar(final AddCarRequestModel request) = _$AddCarImpl;

  AddCarRequestModel get request;

  /// Create a copy of CarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddCarImplCopyWith<_$AddCarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateCarImplCopyWith<$Res> {
  factory _$$UpdateCarImplCopyWith(
          _$UpdateCarImpl value, $Res Function(_$UpdateCarImpl) then) =
      __$$UpdateCarImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String carId, UpdateCarRequestModel request});
}

/// @nodoc
class __$$UpdateCarImplCopyWithImpl<$Res>
    extends _$CarEventCopyWithImpl<$Res, _$UpdateCarImpl>
    implements _$$UpdateCarImplCopyWith<$Res> {
  __$$UpdateCarImplCopyWithImpl(
      _$UpdateCarImpl _value, $Res Function(_$UpdateCarImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carId = null,
    Object? request = null,
  }) {
    return _then(_$UpdateCarImpl(
      null == carId
          ? _value.carId
          : carId // ignore: cast_nullable_to_non_nullable
              as String,
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as UpdateCarRequestModel,
    ));
  }
}

/// @nodoc

class _$UpdateCarImpl implements _UpdateCar {
  const _$UpdateCarImpl(this.carId, this.request);

  @override
  final String carId;
  @override
  final UpdateCarRequestModel request;

  @override
  String toString() {
    return 'CarEvent.updateCar(carId: $carId, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCarImpl &&
            (identical(other.carId, carId) || other.carId == carId) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, carId, request);

  /// Create a copy of CarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCarImplCopyWith<_$UpdateCarImpl> get copyWith =>
      __$$UpdateCarImplCopyWithImpl<_$UpdateCarImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getMyCars,
    required TResult Function(AddCarRequestModel request) addCar,
    required TResult Function(String carId, UpdateCarRequestModel request)
        updateCar,
    required TResult Function(String carId) deleteCar,
  }) {
    return updateCar(carId, request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getMyCars,
    TResult? Function(AddCarRequestModel request)? addCar,
    TResult? Function(String carId, UpdateCarRequestModel request)? updateCar,
    TResult? Function(String carId)? deleteCar,
  }) {
    return updateCar?.call(carId, request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getMyCars,
    TResult Function(AddCarRequestModel request)? addCar,
    TResult Function(String carId, UpdateCarRequestModel request)? updateCar,
    TResult Function(String carId)? deleteCar,
    required TResult orElse(),
  }) {
    if (updateCar != null) {
      return updateCar(carId, request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetMyCars value) getMyCars,
    required TResult Function(_AddCar value) addCar,
    required TResult Function(_UpdateCar value) updateCar,
    required TResult Function(_DeleteCar value) deleteCar,
  }) {
    return updateCar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetMyCars value)? getMyCars,
    TResult? Function(_AddCar value)? addCar,
    TResult? Function(_UpdateCar value)? updateCar,
    TResult? Function(_DeleteCar value)? deleteCar,
  }) {
    return updateCar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetMyCars value)? getMyCars,
    TResult Function(_AddCar value)? addCar,
    TResult Function(_UpdateCar value)? updateCar,
    TResult Function(_DeleteCar value)? deleteCar,
    required TResult orElse(),
  }) {
    if (updateCar != null) {
      return updateCar(this);
    }
    return orElse();
  }
}

abstract class _UpdateCar implements CarEvent {
  const factory _UpdateCar(
          final String carId, final UpdateCarRequestModel request) =
      _$UpdateCarImpl;

  String get carId;
  UpdateCarRequestModel get request;

  /// Create a copy of CarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateCarImplCopyWith<_$UpdateCarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteCarImplCopyWith<$Res> {
  factory _$$DeleteCarImplCopyWith(
          _$DeleteCarImpl value, $Res Function(_$DeleteCarImpl) then) =
      __$$DeleteCarImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String carId});
}

/// @nodoc
class __$$DeleteCarImplCopyWithImpl<$Res>
    extends _$CarEventCopyWithImpl<$Res, _$DeleteCarImpl>
    implements _$$DeleteCarImplCopyWith<$Res> {
  __$$DeleteCarImplCopyWithImpl(
      _$DeleteCarImpl _value, $Res Function(_$DeleteCarImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carId = null,
  }) {
    return _then(_$DeleteCarImpl(
      null == carId
          ? _value.carId
          : carId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteCarImpl implements _DeleteCar {
  const _$DeleteCarImpl(this.carId);

  @override
  final String carId;

  @override
  String toString() {
    return 'CarEvent.deleteCar(carId: $carId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteCarImpl &&
            (identical(other.carId, carId) || other.carId == carId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, carId);

  /// Create a copy of CarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteCarImplCopyWith<_$DeleteCarImpl> get copyWith =>
      __$$DeleteCarImplCopyWithImpl<_$DeleteCarImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getMyCars,
    required TResult Function(AddCarRequestModel request) addCar,
    required TResult Function(String carId, UpdateCarRequestModel request)
        updateCar,
    required TResult Function(String carId) deleteCar,
  }) {
    return deleteCar(carId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getMyCars,
    TResult? Function(AddCarRequestModel request)? addCar,
    TResult? Function(String carId, UpdateCarRequestModel request)? updateCar,
    TResult? Function(String carId)? deleteCar,
  }) {
    return deleteCar?.call(carId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getMyCars,
    TResult Function(AddCarRequestModel request)? addCar,
    TResult Function(String carId, UpdateCarRequestModel request)? updateCar,
    TResult Function(String carId)? deleteCar,
    required TResult orElse(),
  }) {
    if (deleteCar != null) {
      return deleteCar(carId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetMyCars value) getMyCars,
    required TResult Function(_AddCar value) addCar,
    required TResult Function(_UpdateCar value) updateCar,
    required TResult Function(_DeleteCar value) deleteCar,
  }) {
    return deleteCar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetMyCars value)? getMyCars,
    TResult? Function(_AddCar value)? addCar,
    TResult? Function(_UpdateCar value)? updateCar,
    TResult? Function(_DeleteCar value)? deleteCar,
  }) {
    return deleteCar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetMyCars value)? getMyCars,
    TResult Function(_AddCar value)? addCar,
    TResult Function(_UpdateCar value)? updateCar,
    TResult Function(_DeleteCar value)? deleteCar,
    required TResult orElse(),
  }) {
    if (deleteCar != null) {
      return deleteCar(this);
    }
    return orElse();
  }
}

abstract class _DeleteCar implements CarEvent {
  const factory _DeleteCar(final String carId) = _$DeleteCarImpl;

  String get carId;

  /// Create a copy of CarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteCarImplCopyWith<_$DeleteCarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CarState {
  CarStatus get status => throw _privateConstructorUsedError;
  List<Car> get cars => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of CarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarStateCopyWith<CarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarStateCopyWith<$Res> {
  factory $CarStateCopyWith(CarState value, $Res Function(CarState) then) =
      _$CarStateCopyWithImpl<$Res, CarState>;
  @useResult
  $Res call({CarStatus status, List<Car> cars, String? errorMessage});
}

/// @nodoc
class _$CarStateCopyWithImpl<$Res, $Val extends CarState>
    implements $CarStateCopyWith<$Res> {
  _$CarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? cars = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CarStatus,
      cars: null == cars
          ? _value.cars
          : cars // ignore: cast_nullable_to_non_nullable
              as List<Car>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarStateImplCopyWith<$Res>
    implements $CarStateCopyWith<$Res> {
  factory _$$CarStateImplCopyWith(
          _$CarStateImpl value, $Res Function(_$CarStateImpl) then) =
      __$$CarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CarStatus status, List<Car> cars, String? errorMessage});
}

/// @nodoc
class __$$CarStateImplCopyWithImpl<$Res>
    extends _$CarStateCopyWithImpl<$Res, _$CarStateImpl>
    implements _$$CarStateImplCopyWith<$Res> {
  __$$CarStateImplCopyWithImpl(
      _$CarStateImpl _value, $Res Function(_$CarStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? cars = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$CarStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CarStatus,
      cars: null == cars
          ? _value._cars
          : cars // ignore: cast_nullable_to_non_nullable
              as List<Car>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CarStateImpl implements _CarState {
  const _$CarStateImpl(
      {this.status = CarStatus.initial,
      final List<Car> cars = const [],
      this.errorMessage})
      : _cars = cars;

  @override
  @JsonKey()
  final CarStatus status;
  final List<Car> _cars;
  @override
  @JsonKey()
  List<Car> get cars {
    if (_cars is EqualUnmodifiableListView) return _cars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cars);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CarState(status: $status, cars: $cars, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._cars, _cars) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_cars), errorMessage);

  /// Create a copy of CarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarStateImplCopyWith<_$CarStateImpl> get copyWith =>
      __$$CarStateImplCopyWithImpl<_$CarStateImpl>(this, _$identity);
}

abstract class _CarState implements CarState {
  const factory _CarState(
      {final CarStatus status,
      final List<Car> cars,
      final String? errorMessage}) = _$CarStateImpl;

  @override
  CarStatus get status;
  @override
  List<Car> get cars;
  @override
  String? get errorMessage;

  /// Create a copy of CarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarStateImplCopyWith<_$CarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
