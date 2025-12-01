import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/community_insight.dart';
import '../../bloc/journey/journey_cubit.dart';

class JourneyOverviewScreen extends StatelessWidget {
  const JourneyOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community journey insights'),
      ),
      body: SafeArea(
        child: BlocBuilder<JourneyCubit, JourneyState>(
          builder: (context, state) {
            switch (state.status) {
              case JourneyStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case JourneyStatus.failure:
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(state.errorMessage ?? 'Something went wrong'),
                      const SizedBox(height: 12),
                      FilledButton(
                        onPressed: () => context.read<JourneyCubit>().loadInsights(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              case JourneyStatus.success:
                final insights = state.insights!;
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  child: ListView(
                    key: ValueKey(insights.hashCode),
                    padding: const EdgeInsets.all(24),
                    children: [
                      _StatsCard(stats: insights.stats),
                      const SizedBox(height: 24),
                      _EventsCard(events: insights.events),
                    ],
                  ),
                );
              case JourneyStatus.initial:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

class _StatsCard extends StatelessWidget {
  const _StatsCard({required this.stats});

  final Map<String, String> stats;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Weekly pulse',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...stats.entries.map(
            (entry) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(child: Text(entry.key)),
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    style: const TextStyle(fontWeight: FontWeight.w600),
                    child: Text(entry.value),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EventsCard extends StatelessWidget {
  const _EventsCard({required this.events});

  final List<CommunityEvent> events;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Upcoming community events',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...events.map((event) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xFFFFF4E3),
                    child: Text(event.day),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          event.description,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
