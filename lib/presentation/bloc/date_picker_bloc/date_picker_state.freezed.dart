// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_picker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DatePickerState {
  PickerDateRange? get selectedRange => throw _privateConstructorUsedError;
  DateTime? get selectedDate => throw _privateConstructorUsedError;

  /// Create a copy of DatePickerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DatePickerStateCopyWith<DatePickerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatePickerStateCopyWith<$Res> {
  factory $DatePickerStateCopyWith(
          DatePickerState value, $Res Function(DatePickerState) then) =
      _$DatePickerStateCopyWithImpl<$Res, DatePickerState>;
  @useResult
  $Res call({PickerDateRange? selectedRange, DateTime? selectedDate});
}

/// @nodoc
class _$DatePickerStateCopyWithImpl<$Res, $Val extends DatePickerState>
    implements $DatePickerStateCopyWith<$Res> {
  _$DatePickerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DatePickerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedRange = freezed,
    Object? selectedDate = freezed,
  }) {
    return _then(_value.copyWith(
      selectedRange: freezed == selectedRange
          ? _value.selectedRange
          : selectedRange // ignore: cast_nullable_to_non_nullable
              as PickerDateRange?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatePickerStateImplCopyWith<$Res>
    implements $DatePickerStateCopyWith<$Res> {
  factory _$$DatePickerStateImplCopyWith(_$DatePickerStateImpl value,
          $Res Function(_$DatePickerStateImpl) then) =
      __$$DatePickerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PickerDateRange? selectedRange, DateTime? selectedDate});
}

/// @nodoc
class __$$DatePickerStateImplCopyWithImpl<$Res>
    extends _$DatePickerStateCopyWithImpl<$Res, _$DatePickerStateImpl>
    implements _$$DatePickerStateImplCopyWith<$Res> {
  __$$DatePickerStateImplCopyWithImpl(
      _$DatePickerStateImpl _value, $Res Function(_$DatePickerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DatePickerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedRange = freezed,
    Object? selectedDate = freezed,
  }) {
    return _then(_$DatePickerStateImpl(
      selectedRange: freezed == selectedRange
          ? _value.selectedRange
          : selectedRange // ignore: cast_nullable_to_non_nullable
              as PickerDateRange?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$DatePickerStateImpl implements _DatePickerState {
  const _$DatePickerStateImpl({this.selectedRange, this.selectedDate});

  @override
  final PickerDateRange? selectedRange;
  @override
  final DateTime? selectedDate;

  @override
  String toString() {
    return 'DatePickerState(selectedRange: $selectedRange, selectedDate: $selectedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatePickerStateImpl &&
            (identical(other.selectedRange, selectedRange) ||
                other.selectedRange == selectedRange) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedRange, selectedDate);

  /// Create a copy of DatePickerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DatePickerStateImplCopyWith<_$DatePickerStateImpl> get copyWith =>
      __$$DatePickerStateImplCopyWithImpl<_$DatePickerStateImpl>(
          this, _$identity);
}

abstract class _DatePickerState implements DatePickerState {
  const factory _DatePickerState(
      {final PickerDateRange? selectedRange,
      final DateTime? selectedDate}) = _$DatePickerStateImpl;

  @override
  PickerDateRange? get selectedRange;
  @override
  DateTime? get selectedDate;

  /// Create a copy of DatePickerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DatePickerStateImplCopyWith<_$DatePickerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
