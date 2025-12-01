import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/language_partner.dart';

part 'match_flow_state.dart';

class MatchFlowCubit extends Cubit<MatchFlowState> {
  MatchFlowCubit() : super(const MatchFlowState.initial());

  Timer? _timer;

  void startMatching(LanguagePartner partner) {
    emit(MatchFlowState.matching(partner));
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 1), () {
      emit(MatchFlowState.matched(partner));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
