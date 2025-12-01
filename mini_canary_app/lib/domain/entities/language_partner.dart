import 'package:equatable/equatable.dart';

import 'availability_slot.dart';
import 'session_plan.dart';

class LanguagePartner extends Equatable {
  const LanguagePartner({
    required this.id,
    required this.name,
    required this.age,
    required this.flag,
    required this.location,
    required this.timezone,
    required this.learningLanguage,
    required this.learningFlag,
    required this.bio,
    required this.longBio,
    required this.hobbies,
    required this.tags,
    required this.goals,
    required this.accentColor,
    required this.availability,
    required this.sessionPlan,
    required this.matchHook,
  });

  final String id;
  final String name;
  final int age;
  final String flag;
  final String location;
  final String timezone;
  final String learningLanguage;
  final String learningFlag;
  final String bio;
  final String longBio;
  final List<String> hobbies;
  final List<String> tags;
  final List<String> goals;
  final int accentColor;
  final List<AvailabilitySlot> availability;
  final List<SessionPlan> sessionPlan;
  final String matchHook;

  String get initials => name
      .split(' ')
      .where((part) => part.isNotEmpty)
      .map((part) => part[0])
      .take(2)
      .join();

  String get firstName => name.split(' ').first;

  @override
  List<Object> get props => [
        id,
        name,
        age,
        flag,
        location,
        timezone,
        learningLanguage,
        learningFlag,
        bio,
        longBio,
        hobbies,
        tags,
        goals,
        accentColor,
        availability,
        sessionPlan,
        matchHook,
      ];
}
