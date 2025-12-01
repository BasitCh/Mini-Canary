import 'package:flutter/material.dart';

import '../../../domain/entities/language_partner.dart';
import '../../../domain/entities/session_plan.dart';
import '../../widgets/session_icon_helper.dart';

class LearningJourneyScreen extends StatelessWidget {
  const LearningJourneyScreen({super.key, required this.partner});

  final LanguagePartner partner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning journey'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            'Sessions with ${partner.firstName}',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          ...partner.sessionPlan.map(
            (session) => _SessionCard(session: session),
          ),
        ],
      ),
    );
  }
}

class _SessionCard extends StatelessWidget {
  const _SessionCard({required this.session});

  final SessionPlan session;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(sessionIconForKey(session.iconKey), color: const Color(0xFFFFA726)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  session.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                session.day,
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            session.description,
            style: const TextStyle(height: 1.4),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: session.focus
                .map(
                  (tag) => Chip(
                    label: Text(tag),
                    backgroundColor: const Color(0xFFF3F2FA),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
