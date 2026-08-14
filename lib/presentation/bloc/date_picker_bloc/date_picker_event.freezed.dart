// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_picker_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DatePickerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PickerDateRange range) updateRangeSelection,
    required TResult Function(DateTime selectedDate) updateSingleDateSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PickerDateRange range)? updateRangeSelection,
    TResult? Function(DateTime selectedDate)? updateSingleDateSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PickerDateRange range)? updateRangeSelection,
    TResult Function(DateTime selectedDate)? updateSingleDateSelection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateRangeSelection value) updateRangeSelection,
    required TResult Function(UpdateSingleDateSelection value)
        updateSingleDateSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateRangeSelection value)? updateRangeSelection,
    TResult? Function(UpdateSingleDateSelection value)?
        updateSingleDateSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateRangeSelection value)? updateRangeSelection,
    TResult Function(UpdateSingleDateSelection value)?
        updateSingleDateSelection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatePickerEventCopyWith<$Res> {
  factory $DatePickerEventCopyWith(
          DatePickerEvent value, $Res Function(DatePickerEvent) then) =
      _$DatePickerEventCopyWithImpl<$Res, DatePickerEvent>;
}

/// @nodoc
class _$DatePickerEventCopyWithImpl<$Res, $Val extends DatePickerEvent>
    implements $DatePickerEventCopyWith<$Res> {
  _$DatePickerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DatePickerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UpdateRangeSelectionImplCopyWith<$Res> {
  factory _$$UpdateRangeSelectionImplCopyWith(_$UpdateRangeSelectionImpl value,
          $Res Function(_$UpdateRangeSelectionImpl) then) =
      __$$UpdateRangeSelectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PickerDateRange range});
}

/// @nodoc
class __$$UpdateRangeSelectionImplCopyWithImpl<$Res>
    extends _$DatePickerEventCopyWithImpl<$Res, _$UpdateRangeSelectionImpl>
    implements _$$UpdateRangeSelectionImplCopyWith<$Res> {
  __$$UpdateRangeSelectionImplCopyWithImpl(_$UpdateRangeSelectionImpl _value,
      $Res Function(_$UpdateRangeSelectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of DatePickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? range = null,
  }) {
    return _then(_$UpdateRangeSelectionImpl(
      null == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as PickerDateRange,
    ));
  }
}

/// @nodoc

class _$UpdateRangeSelectionImpl implements UpdateRangeSelection {
  const _$UpdateRangeSelectionImpl(this.range);

  @override
  final PickerDateRange range;

  @override
  String toString() {
    return 'DatePickerEvent.updateRangeSelection(range: $range)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRangeSelectionImpl &&
            (identical(other.range, range) || other.range == range));
  }

  @override
  int get hashCode => Object.hash(runtimeType, range);

  /// Create a copy of DatePickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRangeSelectionImplCopyWith<_$UpdateRangeSelectionImpl>
      get copyWith =>
          __$$UpdateRangeSelectionImplCopyWithImpl<_$UpdateRangeSelectionImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PickerDateRange range) updateRangeSelection,
    required TResult Function(DateTime selectedDate) updateSingleDateSelection,
  }) {
    return updateRangeSelection(range);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PickerDateRange range)? updateRangeSelection,
    TResult? Function(DateTime selectedDate)? updateSingleDateSelection,
  }) {
    return updateRangeSelection?.call(range);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PickerDateRange range)? updateRangeSelection,
    TResult Function(DateTime selectedDate)? updateSingleDateSelection,
    required TResult orElse(),
  }) {
    if (updateRangeSelection != null) {
      return updateRangeSelection(range);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateRangeSelection value) updateRangeSelection,
    required TResult Function(UpdateSingleDateSelection value)
        updateSingleDateSelection,
  }) {
    return updateRangeSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateRangeSelection value)? updateRangeSelection,
    TResult? Function(UpdateSingleDateSelection value)?
        updateSingleDateSelection,
  }) {
    return updateRangeSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateRangeSelection value)? updateRangeSelection,
    TResult Function(UpdateSingleDateSelection value)?
        updateSingleDateSelection,
    required TResult orElse(),
  }) {
    if (updateRangeSelection != null) {
      return updateRangeSelection(this);
    }
    return orElse();
  }
}

abstract class UpdateRangeSelection implements DatePickerEvent {
  const factory UpdateRangeSelection(final PickerDateRange range) =
      _$UpdateRangeSelectionImpl;

  PickerDateRange get range;

  /// Create a copy of DatePickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateRangeSelectionImplCopyWith<_$UpdateRangeSelectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateSingleDateSelectionImplCopyWith<$Res> {
  factory _$$UpdateSingleDateSelectionImplCopyWith(
          _$UpdateSingleDateSelectionImpl value,
          $Res Function(_$UpdateSingleDateSelectionImpl) then) =
      __$$UpdateSingleDateSelectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime selectedDate});
}

/// @nodoc
class __$$UpdateSingleDateSelectionImplCopyWithImpl<$Res>
    extends _$DatePickerEventCopyWithImpl<$Res, _$UpdateSingleDateSelectionImpl>
    implements _$$UpdateSingleDateSelectionImplCopyWith<$Res> {
  __$$UpdateSingleDateSelectionImplCopyWithImpl(
      _$UpdateSingleDateSelectionImpl _value,
      $Res Function(_$UpdateSingleDateSelectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of DatePickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = null,
  }) {
    return _then(_$UpdateSingleDateSelectionImpl(
      null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$UpdateSingleDateSelectionImpl implements UpdateSingleDateSelection {
  const _$UpdateSingleDateSelectionImpl(this.selectedDate);

  @override
  final DateTime selectedDate;

  @override
  String toString() {
    return 'DatePickerEvent.updateSingleDateSelection(selectedDate: $selectedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSingleDateSelectionImpl &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedDate);

  /// Create a copy of DatePickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSingleDateSelectionImplCopyWith<_$UpdateSingleDateSelectionImpl>
      get copyWith => __$$UpdateSingleDateSelectionImplCopyWithImpl<
          _$UpdateSingleDateSelectionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PickerDateRange range) updateRangeSelection,
    required TResult Function(DateTime selectedDate) updateSingleDateSelection,
  }) {
    return updateSingleDateSelection(selectedDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PickerDateRange range)? updateRangeSelection,
    TResult? Function(DateTime selectedDate)? updateSingleDateSelection,
  }) {
    return updateSingleDateSelection?.call(selectedDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PickerDateRange range)? updateRangeSelection,
    TResult Function(DateTime selectedDate)? updateSingleDateSelection,
    required TResult orElse(),
  }) {
    if (updateSingleDateSelection != null) {
      return updateSingleDateSelection(selectedDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateRangeSelection value) updateRangeSelection,
    required TResult Function(UpdateSingleDateSelection value)
        updateSingleDateSelection,
  }) {
    return updateSingleDateSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateRangeSelection value)? updateRangeSelection,
    TResult? Function(UpdateSingleDateSelection value)?
        updateSingleDateSelection,
  }) {
    return updateSingleDateSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateRangeSelection value)? updateRangeSelection,
    TResult Function(UpdateSingleDateSelection value)?
        updateSingleDateSelection,
    required TResult orElse(),
  }) {
    if (updateSingleDateSelection != null) {
      return updateSingleDateSelection(this);
    }
    return orElse();
  }
}

abstract class UpdateSingleDateSelection implements DatePickerEvent {
  const factory UpdateSingleDateSelection(final DateTime selectedDate) =
      _$UpdateSingleDateSelectionImpl;

  DateTime get selectedDate;

  /// Create a copy of DatePickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSingleDateSelectionImplCopyWith<_$UpdateSingleDateSelectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
