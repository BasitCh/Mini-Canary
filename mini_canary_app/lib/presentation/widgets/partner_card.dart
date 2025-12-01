import 'package:flutter/material.dart';

import '../../domain/entities/language_partner.dart';

class PartnerCard extends StatelessWidget {
  const PartnerCard({
    super.key,
    required this.partner,
    required this.onViewProfile,
    required this.onMatch,
  });

  final LanguagePartner partner;
  final VoidCallback onViewProfile;
  final VoidCallback onMatch;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.9, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 22,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'avatar-${partner.id}',
                    child: CircleAvatar(
                      radius: 34,
                      backgroundColor: Color(partner.accentColor).withValues(alpha: 0.15),
                      child: Text(
                        partner.initials,
                        style: TextStyle(
                          color: Color(partner.accentColor),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${partner.name}, ${partner.age}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${partner.flag} ${partner.location}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF4E3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Learning: ${partner.learningLanguage} ${partner.learningFlag}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFB85B00),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: onViewProfile,
                    icon: const Icon(Icons.chevron_right_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                partner.bio,
                style: TextStyle(color: Colors.grey.shade700, height: 1.4),
              ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: partner.tags
                    .map(
                      (tag) => Chip(
                        label: Text(tag),
                        avatar: const Icon(
                          Icons.local_fire_department,
                          size: 16,
                          color: Colors.orangeAccent,
                        ),
                        side: BorderSide.none,
                        backgroundColor: const Color(0xFFF3F2FA),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.tonal(
                      onPressed: onViewProfile,
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: const Color(0xFFECEBFF),
                      ),
                      child: const Text(
                        'Profile',
                        style: TextStyle(
                          color: Color(0xFF4C43FF),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      onPressed: onMatch,
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: const Color(0xFFFFA726),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Text(
                        'Learn with ${partner.firstName}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
