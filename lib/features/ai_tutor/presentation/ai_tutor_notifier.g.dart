// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_tutor_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$aiTutorNotifierHash() => r'4e502699961098fa83d4fe84f52f3fb0cceb716e';

/// Orchestrates the AI Tutor 8-state machine: start → connect WS + mic stream →
/// transcripts → stop → upload recording → analyse → report. See 13.
///
/// Copied from [AiTutorNotifier].
@ProviderFor(AiTutorNotifier)
final aiTutorNotifierProvider =
    AutoDisposeNotifierProvider<AiTutorNotifier, AiTutorSessionState>.internal(
  AiTutorNotifier.new,
  name: r'aiTutorNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aiTutorNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AiTutorNotifier = AutoDisposeNotifier<AiTutorSessionState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
