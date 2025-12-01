part of 'partner_feed_bloc.dart';

enum PartnerFeedStatus { initial, loading, success, failure }

class PartnerFeedState extends Equatable {
  const PartnerFeedState({
    this.status = PartnerFeedStatus.initial,
    this.partners = const [],
    this.errorMessage,
  });

  final PartnerFeedStatus status;
  final List<LanguagePartner> partners;
  final String? errorMessage;

  PartnerFeedState copyWith({
    PartnerFeedStatus? status,
    List<LanguagePartner>? partners,
    String? errorMessage,
  }) {
    return PartnerFeedState(
      status: status ?? this.status,
      partners: partners ?? this.partners,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, partners, errorMessage];
}
