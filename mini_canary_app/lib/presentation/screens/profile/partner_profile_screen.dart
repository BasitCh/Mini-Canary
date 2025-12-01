import 'package:flutter/material.dart';

import '../../../domain/entities/language_partner.dart';

class PartnerProfileScreen extends StatelessWidget {
  const PartnerProfileScreen({super.key, required this.partner});

  final LanguagePartner partner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${partner.firstName}'s profile"),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 450),
              curve: Curves.easeOutCubic,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 22,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Hero(
                        tag: 'avatar-${partner.id}',
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Color(partner.accentColor).withValues(alpha: 0.12),
                          child: Text(
                            partner.initials,
                            style: TextStyle(
                              color: Color(partner.accentColor),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${partner.name}, ${partner.age}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Located in ${partner.location} (${partner.timezone})',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Learning ${partner.learningLanguage} ${partner.learningFlag}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFB85B00),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    partner.longBio,
                    style: const TextStyle(height: 1.5),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: partner.hobbies
                        .map(
                          (hobby) => Chip(
                            label: Text(hobby),
                            backgroundColor: const Color(0xFFECEBFF),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Weekly availability',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            ...partner.availability.map(
              (slot) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          slot.day,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          slot.window,
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF4E3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        slot.focus,
                        style: const TextStyle(color: Color(0xFFB85B00)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Goals for the next month',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            ...partner.goals.map(
              (goal) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.orangeAccent),
                    const SizedBox(width: 12),
                    Expanded(child: Text(goal)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
