import 'package:equatable/equatable.dart';

class AvailabilitySlot extends Equatable {
  const AvailabilitySlot({
    required this.day,
    required this.window,
    required this.focus,
  });

  final String day;
  final String window;
  final String focus;

  @override
  List<Object> get props => [day, window, focus];
}
