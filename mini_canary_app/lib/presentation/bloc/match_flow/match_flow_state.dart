part of 'match_flow_cubit.dart';

enum MatchStage { initial, matching, matched }

class MatchFlowState extends Equatable {
  const MatchFlowState({
    required this.stage,
    this.partner,
  });

  const MatchFlowState.initial() : this(stage: MatchStage.initial);

  factory MatchFlowState.matching(LanguagePartner partner) {
    return MatchFlowState(stage: MatchStage.matching, partner: partner);
  }

  factory MatchFlowState.matched(LanguagePartner partner) {
    return MatchFlowState(stage: MatchStage.matched, partner: partner);
  }

  final MatchStage stage;
  final LanguagePartner? partner;

  @override
  List<Object?> get props => [stage, partner];
}
