// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimerState {
  Duration get interval => throw _privateConstructorUsedError;
  bool get isTimerCompleted => throw _privateConstructorUsedError;
  int get currentSeconds => throw _privateConstructorUsedError;
  int get timerMaxSeconds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerStateCopyWith<TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res, TimerState>;
  @useResult
  $Res call(
      {Duration interval,
      bool isTimerCompleted,
      int currentSeconds,
      int timerMaxSeconds});
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res, $Val extends TimerState>
    implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interval = null,
    Object? isTimerCompleted = null,
    Object? currentSeconds = null,
    Object? timerMaxSeconds = null,
  }) {
    return _then(_value.copyWith(
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as Duration,
      isTimerCompleted: null == isTimerCompleted
          ? _value.isTimerCompleted
          : isTimerCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      currentSeconds: null == currentSeconds
          ? _value.currentSeconds
          : currentSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      timerMaxSeconds: null == timerMaxSeconds
          ? _value.timerMaxSeconds
          : timerMaxSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimerStateImplCopyWith<$Res>
    implements $TimerStateCopyWith<$Res> {
  factory _$$TimerStateImplCopyWith(
          _$TimerStateImpl value, $Res Function(_$TimerStateImpl) then) =
      __$$TimerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Duration interval,
      bool isTimerCompleted,
      int currentSeconds,
      int timerMaxSeconds});
}

/// @nodoc
class __$$TimerStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerStateImpl>
    implements _$$TimerStateImplCopyWith<$Res> {
  __$$TimerStateImplCopyWithImpl(
      _$TimerStateImpl _value, $Res Function(_$TimerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interval = null,
    Object? isTimerCompleted = null,
    Object? currentSeconds = null,
    Object? timerMaxSeconds = null,
  }) {
    return _then(_$TimerStateImpl(
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as Duration,
      isTimerCompleted: null == isTimerCompleted
          ? _value.isTimerCompleted
          : isTimerCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      currentSeconds: null == currentSeconds
          ? _value.currentSeconds
          : currentSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      timerMaxSeconds: null == timerMaxSeconds
          ? _value.timerMaxSeconds
          : timerMaxSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TimerStateImpl implements _TimerState {
  const _$TimerStateImpl(
      {required this.interval,
      required this.isTimerCompleted,
      required this.currentSeconds,
      required this.timerMaxSeconds});

  @override
  final Duration interval;
  @override
  final bool isTimerCompleted;
  @override
  final int currentSeconds;
  @override
  final int timerMaxSeconds;

  @override
  String toString() {
    return 'TimerState(interval: $interval, isTimerCompleted: $isTimerCompleted, currentSeconds: $currentSeconds, timerMaxSeconds: $timerMaxSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerStateImpl &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.isTimerCompleted, isTimerCompleted) ||
                other.isTimerCompleted == isTimerCompleted) &&
            (identical(other.currentSeconds, currentSeconds) ||
                other.currentSeconds == currentSeconds) &&
            (identical(other.timerMaxSeconds, timerMaxSeconds) ||
                other.timerMaxSeconds == timerMaxSeconds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, interval, isTimerCompleted, currentSeconds, timerMaxSeconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerStateImplCopyWith<_$TimerStateImpl> get copyWith =>
      __$$TimerStateImplCopyWithImpl<_$TimerStateImpl>(this, _$identity);
}

abstract class _TimerState implements TimerState {
  const factory _TimerState(
      {required final Duration interval,
      required final bool isTimerCompleted,
      required final int currentSeconds,
      required final int timerMaxSeconds}) = _$TimerStateImpl;

  @override
  Duration get interval;
  @override
  bool get isTimerCompleted;
  @override
  int get currentSeconds;
  @override
  int get timerMaxSeconds;
  @override
  @JsonKey(ignore: true)
  _$$TimerStateImplCopyWith<_$TimerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
