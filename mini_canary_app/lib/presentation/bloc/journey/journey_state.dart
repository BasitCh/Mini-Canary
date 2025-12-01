part of 'journey_cubit.dart';

enum JourneyStatus { initial, loading, success, failure }

class JourneyState extends Equatable {
  const JourneyState({
    this.status = JourneyStatus.initial,
    this.insights,
    this.errorMessage,
  });

  final JourneyStatus status;
  final CommunityInsights? insights;
  final String? errorMessage;

  JourneyState copyWith({
    JourneyStatus? status,
    CommunityInsights? insights,
    String? errorMessage,
  }) {
    return JourneyState(
      status: status ?? this.status,
      insights: insights ?? this.insights,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, insights, errorMessage];
}
