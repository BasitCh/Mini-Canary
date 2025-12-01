part of 'partner_feed_bloc.dart';

abstract class PartnerFeedEvent extends Equatable {
  const PartnerFeedEvent();

  @override
  List<Object?> get props => [];
}

class PartnerFeedRequested extends PartnerFeedEvent {
  const PartnerFeedRequested();
}
