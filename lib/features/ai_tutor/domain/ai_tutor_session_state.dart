import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/errors/app_error.dart';
import '../data/ai_tutor_report.dart';
import 'ai_tutor_enums.dart';

part 'ai_tutor_session_state.freezed.dart';

/// The 8-state AI Tutor session machine. See 13.
@freezed
sealed class AiTutorSessionState with _$AiTutorSessionState {
  const factory AiTutorSessionState.idle() = AiTutorIdle;
  const factory AiTutorSessionState.starting(AiTutorMode mode) =
      AiTutorStarting;
  const factory AiTutorSessionState.connecting(String sessionId) =
      AiTutorConnecting;
  const factory AiTutorSessionState.live({
    required String sessionId,
    required List<AiTutorTurn> turns,
  }) = AiTutorLive;
  const factory AiTutorSessionState.ending(String sessionId) = AiTutorEnding;
  const factory AiTutorSessionState.uploadingRecording(String sessionId) =
      AiTutorUploading;
  const factory AiTutorSessionState.analyzing(String sessionId) =
      AiTutorAnalyzing;
  const factory AiTutorSessionState.report(AiTutorReport report) =
      AiTutorReportState;
  const factory AiTutorSessionState.error(AppError error) = AiTutorErrorState;
}
