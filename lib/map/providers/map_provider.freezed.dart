// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapState {
  Map<dynamic, dynamic> get generalState => throw _privateConstructorUsedError;
  String get direction => throw _privateConstructorUsedError;
  Set<Circle> get circles => throw _privateConstructorUsedError;
  Set<Marker> get markers => throw _privateConstructorUsedError;
  Set<Polygon> get polygons => throw _privateConstructorUsedError;
  Set<Polyline> get polylines => throw _privateConstructorUsedError;
  bool get isPolygonMode => throw _privateConstructorUsedError;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MapStateCopyWith<MapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res, MapState>;
  @useResult
  $Res call(
      {Map<dynamic, dynamic> generalState,
      String direction,
      Set<Circle> circles,
      Set<Marker> markers,
      Set<Polygon> polygons,
      Set<Polyline> polylines,
      bool isPolygonMode});
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res, $Val extends MapState>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generalState = null,
    Object? direction = null,
    Object? circles = null,
    Object? markers = null,
    Object? polygons = null,
    Object? polylines = null,
    Object? isPolygonMode = null,
  }) {
    return _then(_value.copyWith(
      generalState: null == generalState
          ? _value.generalState
          : generalState // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String,
      circles: null == circles
          ? _value.circles
          : circles // ignore: cast_nullable_to_non_nullable
              as Set<Circle>,
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      polygons: null == polygons
          ? _value.polygons
          : polygons // ignore: cast_nullable_to_non_nullable
              as Set<Polygon>,
      polylines: null == polylines
          ? _value.polylines
          : polylines // ignore: cast_nullable_to_non_nullable
              as Set<Polyline>,
      isPolygonMode: null == isPolygonMode
          ? _value.isPolygonMode
          : isPolygonMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapStateImplCopyWith<$Res>
    implements $MapStateCopyWith<$Res> {
  factory _$$MapStateImplCopyWith(
          _$MapStateImpl value, $Res Function(_$MapStateImpl) then) =
      __$$MapStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<dynamic, dynamic> generalState,
      String direction,
      Set<Circle> circles,
      Set<Marker> markers,
      Set<Polygon> polygons,
      Set<Polyline> polylines,
      bool isPolygonMode});
}

/// @nodoc
class __$$MapStateImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapStateImpl>
    implements _$$MapStateImplCopyWith<$Res> {
  __$$MapStateImplCopyWithImpl(
      _$MapStateImpl _value, $Res Function(_$MapStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generalState = null,
    Object? direction = null,
    Object? circles = null,
    Object? markers = null,
    Object? polygons = null,
    Object? polylines = null,
    Object? isPolygonMode = null,
  }) {
    return _then(_$MapStateImpl(
      generalState: null == generalState
          ? _value._generalState
          : generalState // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String,
      circles: null == circles
          ? _value._circles
          : circles // ignore: cast_nullable_to_non_nullable
              as Set<Circle>,
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      polygons: null == polygons
          ? _value._polygons
          : polygons // ignore: cast_nullable_to_non_nullable
              as Set<Polygon>,
      polylines: null == polylines
          ? _value._polylines
          : polylines // ignore: cast_nullable_to_non_nullable
              as Set<Polyline>,
      isPolygonMode: null == isPolygonMode
          ? _value.isPolygonMode
          : isPolygonMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MapStateImpl implements _MapState {
  const _$MapStateImpl(
      {final Map<dynamic, dynamic> generalState = const {},
      this.direction = '',
      final Set<Circle> circles = const {},
      final Set<Marker> markers = const {},
      final Set<Polygon> polygons = const {},
      final Set<Polyline> polylines = const {},
      this.isPolygonMode = false})
      : _generalState = generalState,
        _circles = circles,
        _markers = markers,
        _polygons = polygons,
        _polylines = polylines;

  final Map<dynamic, dynamic> _generalState;
  @override
  @JsonKey()
  Map<dynamic, dynamic> get generalState {
    if (_generalState is EqualUnmodifiableMapView) return _generalState;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_generalState);
  }

  @override
  @JsonKey()
  final String direction;
  final Set<Circle> _circles;
  @override
  @JsonKey()
  Set<Circle> get circles {
    if (_circles is EqualUnmodifiableSetView) return _circles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_circles);
  }

  final Set<Marker> _markers;
  @override
  @JsonKey()
  Set<Marker> get markers {
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_markers);
  }

  final Set<Polygon> _polygons;
  @override
  @JsonKey()
  Set<Polygon> get polygons {
    if (_polygons is EqualUnmodifiableSetView) return _polygons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_polygons);
  }

  final Set<Polyline> _polylines;
  @override
  @JsonKey()
  Set<Polyline> get polylines {
    if (_polylines is EqualUnmodifiableSetView) return _polylines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_polylines);
  }

  @override
  @JsonKey()
  final bool isPolygonMode;

  @override
  String toString() {
    return 'MapState(generalState: $generalState, direction: $direction, circles: $circles, markers: $markers, polygons: $polygons, polylines: $polylines, isPolygonMode: $isPolygonMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapStateImpl &&
            const DeepCollectionEquality()
                .equals(other._generalState, _generalState) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            const DeepCollectionEquality().equals(other._circles, _circles) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            const DeepCollectionEquality().equals(other._polygons, _polygons) &&
            const DeepCollectionEquality()
                .equals(other._polylines, _polylines) &&
            (identical(other.isPolygonMode, isPolygonMode) ||
                other.isPolygonMode == isPolygonMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_generalState),
      direction,
      const DeepCollectionEquality().hash(_circles),
      const DeepCollectionEquality().hash(_markers),
      const DeepCollectionEquality().hash(_polygons),
      const DeepCollectionEquality().hash(_polylines),
      isPolygonMode);

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MapStateImplCopyWith<_$MapStateImpl> get copyWith =>
      __$$MapStateImplCopyWithImpl<_$MapStateImpl>(this, _$identity);
}

abstract class _MapState implements MapState {
  const factory _MapState(
      {final Map<dynamic, dynamic> generalState,
      final String direction,
      final Set<Circle> circles,
      final Set<Marker> markers,
      final Set<Polygon> polygons,
      final Set<Polyline> polylines,
      final bool isPolygonMode}) = _$MapStateImpl;

  @override
  Map<dynamic, dynamic> get generalState;
  @override
  String get direction;
  @override
  Set<Circle> get circles;
  @override
  Set<Marker> get markers;
  @override
  Set<Polygon> get polygons;
  @override
  Set<Polyline> get polylines;
  @override
  bool get isPolygonMode;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MapStateImplCopyWith<_$MapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
