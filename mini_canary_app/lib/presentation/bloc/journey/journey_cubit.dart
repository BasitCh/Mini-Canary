import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/community_insight.dart';
import '../../../domain/usecases/get_community_insights_usecase.dart';

part 'journey_state.dart';

class JourneyCubit extends Cubit<JourneyState> {
  JourneyCubit({required GetCommunityInsightsUseCase getCommunityInsightsUseCase})
      : _getCommunityInsightsUseCase = getCommunityInsightsUseCase,
        super(const JourneyState());

  final GetCommunityInsightsUseCase _getCommunityInsightsUseCase;

  Future<void> loadInsights() async {
    emit(state.copyWith(status: JourneyStatus.loading));
    try {
      final insights = await _getCommunityInsightsUseCase();
      emit(
        state.copyWith(
          status: JourneyStatus.success,
          insights: insights,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: JourneyStatus.failure,
          errorMessage: 'Unable to load community updates.',
        ),
      );
    }
  }
}
