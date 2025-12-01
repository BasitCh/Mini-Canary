import 'package:equatable/equatable.dart';

class CommunityInsights extends Equatable {
  const CommunityInsights({
    required this.stats,
    required this.events,
  });

  final Map<String, String> stats;
  final List<CommunityEvent> events;

  @override
  List<Object> get props => [stats, events];
}

class CommunityEvent extends Equatable {
  const CommunityEvent({
    required this.day,
    required this.title,
    required this.description,
  });

  final String day;
  final String title;
  final String description;

  @override
  List<Object> get props => [day, title, description];
}
