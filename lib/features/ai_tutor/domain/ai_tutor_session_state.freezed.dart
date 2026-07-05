// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_tutor_session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AiTutorSessionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(AiTutorMode mode) starting,
    required TResult Function(String sessionId) connecting,
    required TResult Function(String sessionId, List<AiTutorTurn> turns) live,
    required TResult Function(String sessionId) ending,
    required TResult Function(String sessionId) uploadingRecording,
    required TResult Function(String sessionId) analyzing,
    required TResult Function(AiTutorReport report) report,
    required TResult Function(AppError error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(AiTutorMode mode)? starting,
    TResult? Function(String sessionId)? connecting,
    TResult? Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult? Function(String sessionId)? ending,
    TResult? Function(String sessionId)? uploadingRecording,
    TResult? Function(String sessionId)? analyzing,
    TResult? Function(AiTutorReport report)? report,
    TResult? Function(AppError error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(AiTutorMode mode)? starting,
    TResult Function(String sessionId)? connecting,
    TResult Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult Function(String sessionId)? ending,
    TResult Function(String sessionId)? uploadingRecording,
    TResult Function(String sessionId)? analyzing,
    TResult Function(AiTutorReport report)? report,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AiTutorIdle value) idle,
    required TResult Function(AiTutorStarting value) starting,
    required TResult Function(AiTutorConnecting value) connecting,
    required TResult Function(AiTutorLive value) live,
    required TResult Function(AiTutorEnding value) ending,
    required TResult Function(AiTutorUploading value) uploadingRecording,
    required TResult Function(AiTutorAnalyzing value) analyzing,
    required TResult Function(AiTutorReportState value) report,
    required TResult Function(AiTutorErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AiTutorIdle value)? idle,
    TResult? Function(AiTutorStarting value)? starting,
    TResult? Function(AiTutorConnecting value)? connecting,
    TResult? Function(AiTutorLive value)? live,
    TResult? Function(AiTutorEnding value)? ending,
    TResult? Function(AiTutorUploading value)? uploadingRecording,
    TResult? Function(AiTutorAnalyzing value)? analyzing,
    TResult? Function(AiTutorReportState value)? report,
    TResult? Function(AiTutorErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AiTutorIdle value)? idle,
    TResult Function(AiTutorStarting value)? starting,
    TResult Function(AiTutorConnecting value)? connecting,
    TResult Function(AiTutorLive value)? live,
    TResult Function(AiTutorEnding value)? ending,
    TResult Function(AiTutorUploading value)? uploadingRecording,
    TResult Function(AiTutorAnalyzing value)? analyzing,
    TResult Function(AiTutorReportState value)? report,
    TResult Function(AiTutorErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiTutorSessionStateCopyWith<$Res> {
  factory $AiTutorSessionStateCopyWith(
          AiTutorSessionState value, $Res Function(AiTutorSessionState) then) =
      _$AiTutorSessionStateCopyWithImpl<$Res, AiTutorSessionState>;
}

/// @nodoc
class _$AiTutorSessionStateCopyWithImpl<$Res, $Val extends AiTutorSessionState>
    implements $AiTutorSessionStateCopyWith<$Res> {
  _$AiTutorSessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AiTutorIdleImplCopyWith<$Res> {
  factory _$$AiTutorIdleImplCopyWith(
          _$AiTutorIdleImpl value, $Res Function(_$AiTutorIdleImpl) then) =
      __$$AiTutorIdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AiTutorIdleImplCopyWithImpl<$Res>
    extends _$AiTutorSessionStateCopyWithImpl<$Res, _$AiTutorIdleImpl>
    implements _$$AiTutorIdleImplCopyWith<$Res> {
  __$$AiTutorIdleImplCopyWithImpl(
      _$AiTutorIdleImpl _value, $Res Function(_$AiTutorIdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AiTutorIdleImpl implements AiTutorIdle {
  const _$AiTutorIdleImpl();

  @override
  String toString() {
    return 'AiTutorSessionState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AiTutorIdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(AiTutorMode mode) starting,
    required TResult Function(String sessionId) connecting,
    required TResult Function(String sessionId, List<AiTutorTurn> turns) live,
    required TResult Function(String sessionId) ending,
    required TResult Function(String sessionId) uploadingRecording,
    required TResult Function(String sessionId) analyzing,
    required TResult Function(AiTutorReport report) report,
    required TResult Function(AppError error) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(AiTutorMode mode)? starting,
    TResult? Function(String sessionId)? connecting,
    TResult? Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult? Function(String sessionId)? ending,
    TResult? Function(String sessionId)? uploadingRecording,
    TResult? Function(String sessionId)? analyzing,
    TResult? Function(AiTutorReport report)? report,
    TResult? Function(AppError error)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(AiTutorMode mode)? starting,
    TResult Function(String sessionId)? connecting,
    TResult Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult Function(String sessionId)? ending,
    TResult Function(String sessionId)? uploadingRecording,
    TResult Function(String sessionId)? analyzing,
    TResult Function(AiTutorReport report)? report,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AiTutorIdle value) idle,
    required TResult Function(AiTutorStarting value) starting,
    required TResult Function(AiTutorConnecting value) connecting,
    required TResult Function(AiTutorLive value) live,
    required TResult Function(AiTutorEnding value) ending,
    required TResult Function(AiTutorUploading value) uploadingRecording,
    required TResult Function(AiTutorAnalyzing value) analyzing,
    required TResult Function(AiTutorReportState value) report,
    required TResult Function(AiTutorErrorState value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AiTutorIdle value)? idle,
    TResult? Function(AiTutorStarting value)? starting,
    TResult? Function(AiTutorConnecting value)? connecting,
    TResult? Function(AiTutorLive value)? live,
    TResult? Function(AiTutorEnding value)? ending,
    TResult? Function(AiTutorUploading value)? uploadingRecording,
    TResult? Function(AiTutorAnalyzing value)? analyzing,
    TResult? Function(AiTutorReportState value)? report,
    TResult? Function(AiTutorErrorState value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AiTutorIdle value)? idle,
    TResult Function(AiTutorStarting value)? starting,
    TResult Function(AiTutorConnecting value)? connecting,
    TResult Function(AiTutorLive value)? live,
    TResult Function(AiTutorEnding value)? ending,
    TResult Function(AiTutorUploading value)? uploadingRecording,
    TResult Function(AiTutorAnalyzing value)? analyzing,
    TResult Function(AiTutorReportState value)? report,
    TResult Function(AiTutorErrorState value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class AiTutorIdle implements AiTutorSessionState {
  const factory AiTutorIdle() = _$AiTutorIdleImpl;
}

/// @nodoc
abstract class _$$AiTutorStartingImplCopyWith<$Res> {
  factory _$$AiTutorStartingImplCopyWith(_$AiTutorStartingImpl value,
          $Res Function(_$AiTutorStartingImpl) then) =
      __$$AiTutorStartingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AiTutorMode mode});
}

/// @nodoc
class __$$AiTutorStartingImplCopyWithImpl<$Res>
    extends _$AiTutorSessionStateCopyWithImpl<$Res, _$AiTutorStartingImpl>
    implements _$$AiTutorStartingImplCopyWith<$Res> {
  __$$AiTutorStartingImplCopyWithImpl(
      _$AiTutorStartingImpl _value, $Res Function(_$AiTutorStartingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
  }) {
    return _then(_$AiTutorStartingImpl(
      null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as AiTutorMode,
    ));
  }
}

/// @nodoc

class _$AiTutorStartingImpl implements AiTutorStarting {
  const _$AiTutorStartingImpl(this.mode);

  @override
  final AiTutorMode mode;

  @override
  String toString() {
    return 'AiTutorSessionState.starting(mode: $mode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiTutorStartingImpl &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode);

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiTutorStartingImplCopyWith<_$AiTutorStartingImpl> get copyWith =>
      __$$AiTutorStartingImplCopyWithImpl<_$AiTutorStartingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(AiTutorMode mode) starting,
    required TResult Function(String sessionId) connecting,
    required TResult Function(String sessionId, List<AiTutorTurn> turns) live,
    required TResult Function(String sessionId) ending,
    required TResult Function(String sessionId) uploadingRecording,
    required TResult Function(String sessionId) analyzing,
    required TResult Function(AiTutorReport report) report,
    required TResult Function(AppError error) error,
  }) {
    return starting(mode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(AiTutorMode mode)? starting,
    TResult? Function(String sessionId)? connecting,
    TResult? Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult? Function(String sessionId)? ending,
    TResult? Function(String sessionId)? uploadingRecording,
    TResult? Function(String sessionId)? analyzing,
    TResult? Function(AiTutorReport report)? report,
    TResult? Function(AppError error)? error,
  }) {
    return starting?.call(mode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(AiTutorMode mode)? starting,
    TResult Function(String sessionId)? connecting,
    TResult Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult Function(String sessionId)? ending,
    TResult Function(String sessionId)? uploadingRecording,
    TResult Function(String sessionId)? analyzing,
    TResult Function(AiTutorReport report)? report,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    if (starting != null) {
      return starting(mode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AiTutorIdle value) idle,
    required TResult Function(AiTutorStarting value) starting,
    required TResult Function(AiTutorConnecting value) connecting,
    required TResult Function(AiTutorLive value) live,
    required TResult Function(AiTutorEnding value) ending,
    required TResult Function(AiTutorUploading value) uploadingRecording,
    required TResult Function(AiTutorAnalyzing value) analyzing,
    required TResult Function(AiTutorReportState value) report,
    required TResult Function(AiTutorErrorState value) error,
  }) {
    return starting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AiTutorIdle value)? idle,
    TResult? Function(AiTutorStarting value)? starting,
    TResult? Function(AiTutorConnecting value)? connecting,
    TResult? Function(AiTutorLive value)? live,
    TResult? Function(AiTutorEnding value)? ending,
    TResult? Function(AiTutorUploading value)? uploadingRecording,
    TResult? Function(AiTutorAnalyzing value)? analyzing,
    TResult? Function(AiTutorReportState value)? report,
    TResult? Function(AiTutorErrorState value)? error,
  }) {
    return starting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AiTutorIdle value)? idle,
    TResult Function(AiTutorStarting value)? starting,
    TResult Function(AiTutorConnecting value)? connecting,
    TResult Function(AiTutorLive value)? live,
    TResult Function(AiTutorEnding value)? ending,
    TResult Function(AiTutorUploading value)? uploadingRecording,
    TResult Function(AiTutorAnalyzing value)? analyzing,
    TResult Function(AiTutorReportState value)? report,
    TResult Function(AiTutorErrorState value)? error,
    required TResult orElse(),
  }) {
    if (starting != null) {
      return starting(this);
    }
    return orElse();
  }
}

abstract class AiTutorStarting implements AiTutorSessionState {
  const factory AiTutorStarting(final AiTutorMode mode) = _$AiTutorStartingImpl;

  AiTutorMode get mode;

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiTutorStartingImplCopyWith<_$AiTutorStartingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AiTutorConnectingImplCopyWith<$Res> {
  factory _$$AiTutorConnectingImplCopyWith(_$AiTutorConnectingImpl value,
          $Res Function(_$AiTutorConnectingImpl) then) =
      __$$AiTutorConnectingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String sessionId});
}

/// @nodoc
class __$$AiTutorConnectingImplCopyWithImpl<$Res>
    extends _$AiTutorSessionStateCopyWithImpl<$Res, _$AiTutorConnectingImpl>
    implements _$$AiTutorConnectingImplCopyWith<$Res> {
  __$$AiTutorConnectingImplCopyWithImpl(_$AiTutorConnectingImpl _value,
      $Res Function(_$AiTutorConnectingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
  }) {
    return _then(_$AiTutorConnectingImpl(
      null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AiTutorConnectingImpl implements AiTutorConnecting {
  const _$AiTutorConnectingImpl(this.sessionId);

  @override
  final String sessionId;

  @override
  String toString() {
    return 'AiTutorSessionState.connecting(sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiTutorConnectingImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sessionId);

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiTutorConnectingImplCopyWith<_$AiTutorConnectingImpl> get copyWith =>
      __$$AiTutorConnectingImplCopyWithImpl<_$AiTutorConnectingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(AiTutorMode mode) starting,
    required TResult Function(String sessionId) connecting,
    required TResult Function(String sessionId, List<AiTutorTurn> turns) live,
    required TResult Function(String sessionId) ending,
    required TResult Function(String sessionId) uploadingRecording,
    required TResult Function(String sessionId) analyzing,
    required TResult Function(AiTutorReport report) report,
    required TResult Function(AppError error) error,
  }) {
    return connecting(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(AiTutorMode mode)? starting,
    TResult? Function(String sessionId)? connecting,
    TResult? Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult? Function(String sessionId)? ending,
    TResult? Function(String sessionId)? uploadingRecording,
    TResult? Function(String sessionId)? analyzing,
    TResult? Function(AiTutorReport report)? report,
    TResult? Function(AppError error)? error,
  }) {
    return connecting?.call(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(AiTutorMode mode)? starting,
    TResult Function(String sessionId)? connecting,
    TResult Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult Function(String sessionId)? ending,
    TResult Function(String sessionId)? uploadingRecording,
    TResult Function(String sessionId)? analyzing,
    TResult Function(AiTutorReport report)? report,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(sessionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AiTutorIdle value) idle,
    required TResult Function(AiTutorStarting value) starting,
    required TResult Function(AiTutorConnecting value) connecting,
    required TResult Function(AiTutorLive value) live,
    required TResult Function(AiTutorEnding value) ending,
    required TResult Function(AiTutorUploading value) uploadingRecording,
    required TResult Function(AiTutorAnalyzing value) analyzing,
    required TResult Function(AiTutorReportState value) report,
    required TResult Function(AiTutorErrorState value) error,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AiTutorIdle value)? idle,
    TResult? Function(AiTutorStarting value)? starting,
    TResult? Function(AiTutorConnecting value)? connecting,
    TResult? Function(AiTutorLive value)? live,
    TResult? Function(AiTutorEnding value)? ending,
    TResult? Function(AiTutorUploading value)? uploadingRecording,
    TResult? Function(AiTutorAnalyzing value)? analyzing,
    TResult? Function(AiTutorReportState value)? report,
    TResult? Function(AiTutorErrorState value)? error,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AiTutorIdle value)? idle,
    TResult Function(AiTutorStarting value)? starting,
    TResult Function(AiTutorConnecting value)? connecting,
    TResult Function(AiTutorLive value)? live,
    TResult Function(AiTutorEnding value)? ending,
    TResult Function(AiTutorUploading value)? uploadingRecording,
    TResult Function(AiTutorAnalyzing value)? analyzing,
    TResult Function(AiTutorReportState value)? report,
    TResult Function(AiTutorErrorState value)? error,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class AiTutorConnecting implements AiTutorSessionState {
  const factory AiTutorConnecting(final String sessionId) =
      _$AiTutorConnectingImpl;

  String get sessionId;

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiTutorConnectingImplCopyWith<_$AiTutorConnectingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AiTutorLiveImplCopyWith<$Res> {
  factory _$$AiTutorLiveImplCopyWith(
          _$AiTutorLiveImpl value, $Res Function(_$AiTutorLiveImpl) then) =
      __$$AiTutorLiveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String sessionId, List<AiTutorTurn> turns});
}

/// @nodoc
class __$$AiTutorLiveImplCopyWithImpl<$Res>
    extends _$AiTutorSessionStateCopyWithImpl<$Res, _$AiTutorLiveImpl>
    implements _$$AiTutorLiveImplCopyWith<$Res> {
  __$$AiTutorLiveImplCopyWithImpl(
      _$AiTutorLiveImpl _value, $Res Function(_$AiTutorLiveImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? turns = null,
  }) {
    return _then(_$AiTutorLiveImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      turns: null == turns
          ? _value._turns
          : turns // ignore: cast_nullable_to_non_nullable
              as List<AiTutorTurn>,
    ));
  }
}

/// @nodoc

class _$AiTutorLiveImpl implements AiTutorLive {
  const _$AiTutorLiveImpl(
      {required this.sessionId, required final List<AiTutorTurn> turns})
      : _turns = turns;

  @override
  final String sessionId;
  final List<AiTutorTurn> _turns;
  @override
  List<AiTutorTurn> get turns {
    if (_turns is EqualUnmodifiableListView) return _turns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_turns);
  }

  @override
  String toString() {
    return 'AiTutorSessionState.live(sessionId: $sessionId, turns: $turns)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiTutorLiveImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            const DeepCollectionEquality().equals(other._turns, _turns));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, sessionId, const DeepCollectionEquality().hash(_turns));

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiTutorLiveImplCopyWith<_$AiTutorLiveImpl> get copyWith =>
      __$$AiTutorLiveImplCopyWithImpl<_$AiTutorLiveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(AiTutorMode mode) starting,
    required TResult Function(String sessionId) connecting,
    required TResult Function(String sessionId, List<AiTutorTurn> turns) live,
    required TResult Function(String sessionId) ending,
    required TResult Function(String sessionId) uploadingRecording,
    required TResult Function(String sessionId) analyzing,
    required TResult Function(AiTutorReport report) report,
    required TResult Function(AppError error) error,
  }) {
    return live(sessionId, turns);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(AiTutorMode mode)? starting,
    TResult? Function(String sessionId)? connecting,
    TResult? Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult? Function(String sessionId)? ending,
    TResult? Function(String sessionId)? uploadingRecording,
    TResult? Function(String sessionId)? analyzing,
    TResult? Function(AiTutorReport report)? report,
    TResult? Function(AppError error)? error,
  }) {
    return live?.call(sessionId, turns);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(AiTutorMode mode)? starting,
    TResult Function(String sessionId)? connecting,
    TResult Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult Function(String sessionId)? ending,
    TResult Function(String sessionId)? uploadingRecording,
    TResult Function(String sessionId)? analyzing,
    TResult Function(AiTutorReport report)? report,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    if (live != null) {
      return live(sessionId, turns);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AiTutorIdle value) idle,
    required TResult Function(AiTutorStarting value) starting,
    required TResult Function(AiTutorConnecting value) connecting,
    required TResult Function(AiTutorLive value) live,
    required TResult Function(AiTutorEnding value) ending,
    required TResult Function(AiTutorUploading value) uploadingRecording,
    required TResult Function(AiTutorAnalyzing value) analyzing,
    required TResult Function(AiTutorReportState value) report,
    required TResult Function(AiTutorErrorState value) error,
  }) {
    return live(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AiTutorIdle value)? idle,
    TResult? Function(AiTutorStarting value)? starting,
    TResult? Function(AiTutorConnecting value)? connecting,
    TResult? Function(AiTutorLive value)? live,
    TResult? Function(AiTutorEnding value)? ending,
    TResult? Function(AiTutorUploading value)? uploadingRecording,
    TResult? Function(AiTutorAnalyzing value)? analyzing,
    TResult? Function(AiTutorReportState value)? report,
    TResult? Function(AiTutorErrorState value)? error,
  }) {
    return live?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AiTutorIdle value)? idle,
    TResult Function(AiTutorStarting value)? starting,
    TResult Function(AiTutorConnecting value)? connecting,
    TResult Function(AiTutorLive value)? live,
    TResult Function(AiTutorEnding value)? ending,
    TResult Function(AiTutorUploading value)? uploadingRecording,
    TResult Function(AiTutorAnalyzing value)? analyzing,
    TResult Function(AiTutorReportState value)? report,
    TResult Function(AiTutorErrorState value)? error,
    required TResult orElse(),
  }) {
    if (live != null) {
      return live(this);
    }
    return orElse();
  }
}

abstract class AiTutorLive implements AiTutorSessionState {
  const factory AiTutorLive(
      {required final String sessionId,
      required final List<AiTutorTurn> turns}) = _$AiTutorLiveImpl;

  String get sessionId;
  List<AiTutorTurn> get turns;

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiTutorLiveImplCopyWith<_$AiTutorLiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AiTutorEndingImplCopyWith<$Res> {
  factory _$$AiTutorEndingImplCopyWith(
          _$AiTutorEndingImpl value, $Res Function(_$AiTutorEndingImpl) then) =
      __$$AiTutorEndingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String sessionId});
}

/// @nodoc
class __$$AiTutorEndingImplCopyWithImpl<$Res>
    extends _$AiTutorSessionStateCopyWithImpl<$Res, _$AiTutorEndingImpl>
    implements _$$AiTutorEndingImplCopyWith<$Res> {
  __$$AiTutorEndingImplCopyWithImpl(
      _$AiTutorEndingImpl _value, $Res Function(_$AiTutorEndingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
  }) {
    return _then(_$AiTutorEndingImpl(
      null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AiTutorEndingImpl implements AiTutorEnding {
  const _$AiTutorEndingImpl(this.sessionId);

  @override
  final String sessionId;

  @override
  String toString() {
    return 'AiTutorSessionState.ending(sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiTutorEndingImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sessionId);

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiTutorEndingImplCopyWith<_$AiTutorEndingImpl> get copyWith =>
      __$$AiTutorEndingImplCopyWithImpl<_$AiTutorEndingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(AiTutorMode mode) starting,
    required TResult Function(String sessionId) connecting,
    required TResult Function(String sessionId, List<AiTutorTurn> turns) live,
    required TResult Function(String sessionId) ending,
    required TResult Function(String sessionId) uploadingRecording,
    required TResult Function(String sessionId) analyzing,
    required TResult Function(AiTutorReport report) report,
    required TResult Function(AppError error) error,
  }) {
    return ending(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(AiTutorMode mode)? starting,
    TResult? Function(String sessionId)? connecting,
    TResult? Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult? Function(String sessionId)? ending,
    TResult? Function(String sessionId)? uploadingRecording,
    TResult? Function(String sessionId)? analyzing,
    TResult? Function(AiTutorReport report)? report,
    TResult? Function(AppError error)? error,
  }) {
    return ending?.call(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(AiTutorMode mode)? starting,
    TResult Function(String sessionId)? connecting,
    TResult Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult Function(String sessionId)? ending,
    TResult Function(String sessionId)? uploadingRecording,
    TResult Function(String sessionId)? analyzing,
    TResult Function(AiTutorReport report)? report,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    if (ending != null) {
      return ending(sessionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AiTutorIdle value) idle,
    required TResult Function(AiTutorStarting value) starting,
    required TResult Function(AiTutorConnecting value) connecting,
    required TResult Function(AiTutorLive value) live,
    required TResult Function(AiTutorEnding value) ending,
    required TResult Function(AiTutorUploading value) uploadingRecording,
    required TResult Function(AiTutorAnalyzing value) analyzing,
    required TResult Function(AiTutorReportState value) report,
    required TResult Function(AiTutorErrorState value) error,
  }) {
    return ending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AiTutorIdle value)? idle,
    TResult? Function(AiTutorStarting value)? starting,
    TResult? Function(AiTutorConnecting value)? connecting,
    TResult? Function(AiTutorLive value)? live,
    TResult? Function(AiTutorEnding value)? ending,
    TResult? Function(AiTutorUploading value)? uploadingRecording,
    TResult? Function(AiTutorAnalyzing value)? analyzing,
    TResult? Function(AiTutorReportState value)? report,
    TResult? Function(AiTutorErrorState value)? error,
  }) {
    return ending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AiTutorIdle value)? idle,
    TResult Function(AiTutorStarting value)? starting,
    TResult Function(AiTutorConnecting value)? connecting,
    TResult Function(AiTutorLive value)? live,
    TResult Function(AiTutorEnding value)? ending,
    TResult Function(AiTutorUploading value)? uploadingRecording,
    TResult Function(AiTutorAnalyzing value)? analyzing,
    TResult Function(AiTutorReportState value)? report,
    TResult Function(AiTutorErrorState value)? error,
    required TResult orElse(),
  }) {
    if (ending != null) {
      return ending(this);
    }
    return orElse();
  }
}

abstract class AiTutorEnding implements AiTutorSessionState {
  const factory AiTutorEnding(final String sessionId) = _$AiTutorEndingImpl;

  String get sessionId;

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiTutorEndingImplCopyWith<_$AiTutorEndingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AiTutorUploadingImplCopyWith<$Res> {
  factory _$$AiTutorUploadingImplCopyWith(_$AiTutorUploadingImpl value,
          $Res Function(_$AiTutorUploadingImpl) then) =
      __$$AiTutorUploadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String sessionId});
}

/// @nodoc
class __$$AiTutorUploadingImplCopyWithImpl<$Res>
    extends _$AiTutorSessionStateCopyWithImpl<$Res, _$AiTutorUploadingImpl>
    implements _$$AiTutorUploadingImplCopyWith<$Res> {
  __$$AiTutorUploadingImplCopyWithImpl(_$AiTutorUploadingImpl _value,
      $Res Function(_$AiTutorUploadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
  }) {
    return _then(_$AiTutorUploadingImpl(
      null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AiTutorUploadingImpl implements AiTutorUploading {
  const _$AiTutorUploadingImpl(this.sessionId);

  @override
  final String sessionId;

  @override
  String toString() {
    return 'AiTutorSessionState.uploadingRecording(sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiTutorUploadingImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sessionId);

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiTutorUploadingImplCopyWith<_$AiTutorUploadingImpl> get copyWith =>
      __$$AiTutorUploadingImplCopyWithImpl<_$AiTutorUploadingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(AiTutorMode mode) starting,
    required TResult Function(String sessionId) connecting,
    required TResult Function(String sessionId, List<AiTutorTurn> turns) live,
    required TResult Function(String sessionId) ending,
    required TResult Function(String sessionId) uploadingRecording,
    required TResult Function(String sessionId) analyzing,
    required TResult Function(AiTutorReport report) report,
    required TResult Function(AppError error) error,
  }) {
    return uploadingRecording(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(AiTutorMode mode)? starting,
    TResult? Function(String sessionId)? connecting,
    TResult? Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult? Function(String sessionId)? ending,
    TResult? Function(String sessionId)? uploadingRecording,
    TResult? Function(String sessionId)? analyzing,
    TResult? Function(AiTutorReport report)? report,
    TResult? Function(AppError error)? error,
  }) {
    return uploadingRecording?.call(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(AiTutorMode mode)? starting,
    TResult Function(String sessionId)? connecting,
    TResult Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult Function(String sessionId)? ending,
    TResult Function(String sessionId)? uploadingRecording,
    TResult Function(String sessionId)? analyzing,
    TResult Function(AiTutorReport report)? report,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    if (uploadingRecording != null) {
      return uploadingRecording(sessionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AiTutorIdle value) idle,
    required TResult Function(AiTutorStarting value) starting,
    required TResult Function(AiTutorConnecting value) connecting,
    required TResult Function(AiTutorLive value) live,
    required TResult Function(AiTutorEnding value) ending,
    required TResult Function(AiTutorUploading value) uploadingRecording,
    required TResult Function(AiTutorAnalyzing value) analyzing,
    required TResult Function(AiTutorReportState value) report,
    required TResult Function(AiTutorErrorState value) error,
  }) {
    return uploadingRecording(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AiTutorIdle value)? idle,
    TResult? Function(AiTutorStarting value)? starting,
    TResult? Function(AiTutorConnecting value)? connecting,
    TResult? Function(AiTutorLive value)? live,
    TResult? Function(AiTutorEnding value)? ending,
    TResult? Function(AiTutorUploading value)? uploadingRecording,
    TResult? Function(AiTutorAnalyzing value)? analyzing,
    TResult? Function(AiTutorReportState value)? report,
    TResult? Function(AiTutorErrorState value)? error,
  }) {
    return uploadingRecording?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AiTutorIdle value)? idle,
    TResult Function(AiTutorStarting value)? starting,
    TResult Function(AiTutorConnecting value)? connecting,
    TResult Function(AiTutorLive value)? live,
    TResult Function(AiTutorEnding value)? ending,
    TResult Function(AiTutorUploading value)? uploadingRecording,
    TResult Function(AiTutorAnalyzing value)? analyzing,
    TResult Function(AiTutorReportState value)? report,
    TResult Function(AiTutorErrorState value)? error,
    required TResult orElse(),
  }) {
    if (uploadingRecording != null) {
      return uploadingRecording(this);
    }
    return orElse();
  }
}

abstract class AiTutorUploading implements AiTutorSessionState {
  const factory AiTutorUploading(final String sessionId) =
      _$AiTutorUploadingImpl;

  String get sessionId;

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiTutorUploadingImplCopyWith<_$AiTutorUploadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AiTutorAnalyzingImplCopyWith<$Res> {
  factory _$$AiTutorAnalyzingImplCopyWith(_$AiTutorAnalyzingImpl value,
          $Res Function(_$AiTutorAnalyzingImpl) then) =
      __$$AiTutorAnalyzingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String sessionId});
}

/// @nodoc
class __$$AiTutorAnalyzingImplCopyWithImpl<$Res>
    extends _$AiTutorSessionStateCopyWithImpl<$Res, _$AiTutorAnalyzingImpl>
    implements _$$AiTutorAnalyzingImplCopyWith<$Res> {
  __$$AiTutorAnalyzingImplCopyWithImpl(_$AiTutorAnalyzingImpl _value,
      $Res Function(_$AiTutorAnalyzingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
  }) {
    return _then(_$AiTutorAnalyzingImpl(
      null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AiTutorAnalyzingImpl implements AiTutorAnalyzing {
  const _$AiTutorAnalyzingImpl(this.sessionId);

  @override
  final String sessionId;

  @override
  String toString() {
    return 'AiTutorSessionState.analyzing(sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiTutorAnalyzingImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sessionId);

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiTutorAnalyzingImplCopyWith<_$AiTutorAnalyzingImpl> get copyWith =>
      __$$AiTutorAnalyzingImplCopyWithImpl<_$AiTutorAnalyzingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(AiTutorMode mode) starting,
    required TResult Function(String sessionId) connecting,
    required TResult Function(String sessionId, List<AiTutorTurn> turns) live,
    required TResult Function(String sessionId) ending,
    required TResult Function(String sessionId) uploadingRecording,
    required TResult Function(String sessionId) analyzing,
    required TResult Function(AiTutorReport report) report,
    required TResult Function(AppError error) error,
  }) {
    return analyzing(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(AiTutorMode mode)? starting,
    TResult? Function(String sessionId)? connecting,
    TResult? Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult? Function(String sessionId)? ending,
    TResult? Function(String sessionId)? uploadingRecording,
    TResult? Function(String sessionId)? analyzing,
    TResult? Function(AiTutorReport report)? report,
    TResult? Function(AppError error)? error,
  }) {
    return analyzing?.call(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(AiTutorMode mode)? starting,
    TResult Function(String sessionId)? connecting,
    TResult Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult Function(String sessionId)? ending,
    TResult Function(String sessionId)? uploadingRecording,
    TResult Function(String sessionId)? analyzing,
    TResult Function(AiTutorReport report)? report,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    if (analyzing != null) {
      return analyzing(sessionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AiTutorIdle value) idle,
    required TResult Function(AiTutorStarting value) starting,
    required TResult Function(AiTutorConnecting value) connecting,
    required TResult Function(AiTutorLive value) live,
    required TResult Function(AiTutorEnding value) ending,
    required TResult Function(AiTutorUploading value) uploadingRecording,
    required TResult Function(AiTutorAnalyzing value) analyzing,
    required TResult Function(AiTutorReportState value) report,
    required TResult Function(AiTutorErrorState value) error,
  }) {
    return analyzing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AiTutorIdle value)? idle,
    TResult? Function(AiTutorStarting value)? starting,
    TResult? Function(AiTutorConnecting value)? connecting,
    TResult? Function(AiTutorLive value)? live,
    TResult? Function(AiTutorEnding value)? ending,
    TResult? Function(AiTutorUploading value)? uploadingRecording,
    TResult? Function(AiTutorAnalyzing value)? analyzing,
    TResult? Function(AiTutorReportState value)? report,
    TResult? Function(AiTutorErrorState value)? error,
  }) {
    return analyzing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AiTutorIdle value)? idle,
    TResult Function(AiTutorStarting value)? starting,
    TResult Function(AiTutorConnecting value)? connecting,
    TResult Function(AiTutorLive value)? live,
    TResult Function(AiTutorEnding value)? ending,
    TResult Function(AiTutorUploading value)? uploadingRecording,
    TResult Function(AiTutorAnalyzing value)? analyzing,
    TResult Function(AiTutorReportState value)? report,
    TResult Function(AiTutorErrorState value)? error,
    required TResult orElse(),
  }) {
    if (analyzing != null) {
      return analyzing(this);
    }
    return orElse();
  }
}

abstract class AiTutorAnalyzing implements AiTutorSessionState {
  const factory AiTutorAnalyzing(final String sessionId) =
      _$AiTutorAnalyzingImpl;

  String get sessionId;

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiTutorAnalyzingImplCopyWith<_$AiTutorAnalyzingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AiTutorReportStateImplCopyWith<$Res> {
  factory _$$AiTutorReportStateImplCopyWith(_$AiTutorReportStateImpl value,
          $Res Function(_$AiTutorReportStateImpl) then) =
      __$$AiTutorReportStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AiTutorReport report});

  $AiTutorReportCopyWith<$Res> get report;
}

/// @nodoc
class __$$AiTutorReportStateImplCopyWithImpl<$Res>
    extends _$AiTutorSessionStateCopyWithImpl<$Res, _$AiTutorReportStateImpl>
    implements _$$AiTutorReportStateImplCopyWith<$Res> {
  __$$AiTutorReportStateImplCopyWithImpl(_$AiTutorReportStateImpl _value,
      $Res Function(_$AiTutorReportStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? report = null,
  }) {
    return _then(_$AiTutorReportStateImpl(
      null == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as AiTutorReport,
    ));
  }

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiTutorReportCopyWith<$Res> get report {
    return $AiTutorReportCopyWith<$Res>(_value.report, (value) {
      return _then(_value.copyWith(report: value));
    });
  }
}

/// @nodoc

class _$AiTutorReportStateImpl implements AiTutorReportState {
  const _$AiTutorReportStateImpl(this.report);

  @override
  final AiTutorReport report;

  @override
  String toString() {
    return 'AiTutorSessionState.report(report: $report)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiTutorReportStateImpl &&
            (identical(other.report, report) || other.report == report));
  }

  @override
  int get hashCode => Object.hash(runtimeType, report);

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiTutorReportStateImplCopyWith<_$AiTutorReportStateImpl> get copyWith =>
      __$$AiTutorReportStateImplCopyWithImpl<_$AiTutorReportStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(AiTutorMode mode) starting,
    required TResult Function(String sessionId) connecting,
    required TResult Function(String sessionId, List<AiTutorTurn> turns) live,
    required TResult Function(String sessionId) ending,
    required TResult Function(String sessionId) uploadingRecording,
    required TResult Function(String sessionId) analyzing,
    required TResult Function(AiTutorReport report) report,
    required TResult Function(AppError error) error,
  }) {
    return report(this.report);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(AiTutorMode mode)? starting,
    TResult? Function(String sessionId)? connecting,
    TResult? Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult? Function(String sessionId)? ending,
    TResult? Function(String sessionId)? uploadingRecording,
    TResult? Function(String sessionId)? analyzing,
    TResult? Function(AiTutorReport report)? report,
    TResult? Function(AppError error)? error,
  }) {
    return report?.call(this.report);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(AiTutorMode mode)? starting,
    TResult Function(String sessionId)? connecting,
    TResult Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult Function(String sessionId)? ending,
    TResult Function(String sessionId)? uploadingRecording,
    TResult Function(String sessionId)? analyzing,
    TResult Function(AiTutorReport report)? report,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    if (report != null) {
      return report(this.report);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AiTutorIdle value) idle,
    required TResult Function(AiTutorStarting value) starting,
    required TResult Function(AiTutorConnecting value) connecting,
    required TResult Function(AiTutorLive value) live,
    required TResult Function(AiTutorEnding value) ending,
    required TResult Function(AiTutorUploading value) uploadingRecording,
    required TResult Function(AiTutorAnalyzing value) analyzing,
    required TResult Function(AiTutorReportState value) report,
    required TResult Function(AiTutorErrorState value) error,
  }) {
    return report(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AiTutorIdle value)? idle,
    TResult? Function(AiTutorStarting value)? starting,
    TResult? Function(AiTutorConnecting value)? connecting,
    TResult? Function(AiTutorLive value)? live,
    TResult? Function(AiTutorEnding value)? ending,
    TResult? Function(AiTutorUploading value)? uploadingRecording,
    TResult? Function(AiTutorAnalyzing value)? analyzing,
    TResult? Function(AiTutorReportState value)? report,
    TResult? Function(AiTutorErrorState value)? error,
  }) {
    return report?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AiTutorIdle value)? idle,
    TResult Function(AiTutorStarting value)? starting,
    TResult Function(AiTutorConnecting value)? connecting,
    TResult Function(AiTutorLive value)? live,
    TResult Function(AiTutorEnding value)? ending,
    TResult Function(AiTutorUploading value)? uploadingRecording,
    TResult Function(AiTutorAnalyzing value)? analyzing,
    TResult Function(AiTutorReportState value)? report,
    TResult Function(AiTutorErrorState value)? error,
    required TResult orElse(),
  }) {
    if (report != null) {
      return report(this);
    }
    return orElse();
  }
}

abstract class AiTutorReportState implements AiTutorSessionState {
  const factory AiTutorReportState(final AiTutorReport report) =
      _$AiTutorReportStateImpl;

  AiTutorReport get report;

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiTutorReportStateImplCopyWith<_$AiTutorReportStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AiTutorErrorStateImplCopyWith<$Res> {
  factory _$$AiTutorErrorStateImplCopyWith(_$AiTutorErrorStateImpl value,
          $Res Function(_$AiTutorErrorStateImpl) then) =
      __$$AiTutorErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppError error});
}

/// @nodoc
class __$$AiTutorErrorStateImplCopyWithImpl<$Res>
    extends _$AiTutorSessionStateCopyWithImpl<$Res, _$AiTutorErrorStateImpl>
    implements _$$AiTutorErrorStateImplCopyWith<$Res> {
  __$$AiTutorErrorStateImplCopyWithImpl(_$AiTutorErrorStateImpl _value,
      $Res Function(_$AiTutorErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$AiTutorErrorStateImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }
}

/// @nodoc

class _$AiTutorErrorStateImpl implements AiTutorErrorState {
  const _$AiTutorErrorStateImpl(this.error);

  @override
  final AppError error;

  @override
  String toString() {
    return 'AiTutorSessionState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiTutorErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiTutorErrorStateImplCopyWith<_$AiTutorErrorStateImpl> get copyWith =>
      __$$AiTutorErrorStateImplCopyWithImpl<_$AiTutorErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(AiTutorMode mode) starting,
    required TResult Function(String sessionId) connecting,
    required TResult Function(String sessionId, List<AiTutorTurn> turns) live,
    required TResult Function(String sessionId) ending,
    required TResult Function(String sessionId) uploadingRecording,
    required TResult Function(String sessionId) analyzing,
    required TResult Function(AiTutorReport report) report,
    required TResult Function(AppError error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(AiTutorMode mode)? starting,
    TResult? Function(String sessionId)? connecting,
    TResult? Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult? Function(String sessionId)? ending,
    TResult? Function(String sessionId)? uploadingRecording,
    TResult? Function(String sessionId)? analyzing,
    TResult? Function(AiTutorReport report)? report,
    TResult? Function(AppError error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(AiTutorMode mode)? starting,
    TResult Function(String sessionId)? connecting,
    TResult Function(String sessionId, List<AiTutorTurn> turns)? live,
    TResult Function(String sessionId)? ending,
    TResult Function(String sessionId)? uploadingRecording,
    TResult Function(String sessionId)? analyzing,
    TResult Function(AiTutorReport report)? report,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AiTutorIdle value) idle,
    required TResult Function(AiTutorStarting value) starting,
    required TResult Function(AiTutorConnecting value) connecting,
    required TResult Function(AiTutorLive value) live,
    required TResult Function(AiTutorEnding value) ending,
    required TResult Function(AiTutorUploading value) uploadingRecording,
    required TResult Function(AiTutorAnalyzing value) analyzing,
    required TResult Function(AiTutorReportState value) report,
    required TResult Function(AiTutorErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AiTutorIdle value)? idle,
    TResult? Function(AiTutorStarting value)? starting,
    TResult? Function(AiTutorConnecting value)? connecting,
    TResult? Function(AiTutorLive value)? live,
    TResult? Function(AiTutorEnding value)? ending,
    TResult? Function(AiTutorUploading value)? uploadingRecording,
    TResult? Function(AiTutorAnalyzing value)? analyzing,
    TResult? Function(AiTutorReportState value)? report,
    TResult? Function(AiTutorErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AiTutorIdle value)? idle,
    TResult Function(AiTutorStarting value)? starting,
    TResult Function(AiTutorConnecting value)? connecting,
    TResult Function(AiTutorLive value)? live,
    TResult Function(AiTutorEnding value)? ending,
    TResult Function(AiTutorUploading value)? uploadingRecording,
    TResult Function(AiTutorAnalyzing value)? analyzing,
    TResult Function(AiTutorReportState value)? report,
    TResult Function(AiTutorErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AiTutorErrorState implements AiTutorSessionState {
  const factory AiTutorErrorState(final AppError error) =
      _$AiTutorErrorStateImpl;

  AppError get error;

  /// Create a copy of AiTutorSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiTutorErrorStateImplCopyWith<_$AiTutorErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
