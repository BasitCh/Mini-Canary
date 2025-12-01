import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/language_partner.dart';
import '../../../domain/usecases/get_partners_usecase.dart';

part 'partner_feed_event.dart';
part 'partner_feed_state.dart';

class PartnerFeedBloc extends Bloc<PartnerFeedEvent, PartnerFeedState> {
  PartnerFeedBloc({required GetPartnersUseCase getPartnersUseCase})
      : _getPartnersUseCase = getPartnersUseCase,
        super(const PartnerFeedState()) {
    on<PartnerFeedRequested>(_onRequested);
  }

  final GetPartnersUseCase _getPartnersUseCase;

  Future<void> _onRequested(
    PartnerFeedRequested event,
    Emitter<PartnerFeedState> emit,
  ) async {
    emit(state.copyWith(status: PartnerFeedStatus.loading));
    try {
      final partners = await _getPartnersUseCase();
      emit(
        state.copyWith(
          status: PartnerFeedStatus.success,
          partners: partners,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: PartnerFeedStatus.failure,
          errorMessage: 'Unable to fetch partners right now.',
        ),
      );
    }
  }
}
