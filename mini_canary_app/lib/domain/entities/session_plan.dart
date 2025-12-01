import 'package:equatable/equatable.dart';

class SessionPlan extends Equatable {
  const SessionPlan({
    required this.title,
    required this.description,
    required this.focus,
    required this.day,
    required this.iconKey,
  });

  final String title;
  final String description;
  final List<String> focus;
  final String day;
  final String iconKey;

  @override
  List<Object> get props => [title, description, focus, day, iconKey];
}
