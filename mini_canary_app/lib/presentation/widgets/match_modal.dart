import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/language_partner.dart';
import '../bloc/match_flow/match_flow_cubit.dart';

class MatchModal extends StatelessWidget {
  const MatchModal({super.key, required this.partner});

  final LanguagePartner partner;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchFlowCubit, MatchFlowState>(
      builder: (context, state) {
        final isMatching = state.stage == MatchStage.matching;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: isMatching
                ? _MatchingState(partner: partner)
                : _MatchedState(partner: partner),
          ),
        );
      },
    );
  }
}

class _MatchingState extends StatelessWidget {
  const _MatchingState({required this.partner});

  final LanguagePartner partner;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('matching'),
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        const CircularProgressIndicator(),
        const SizedBox(height: 18),
        const Text(
          'Matching...',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          'Finding the best vibe with ${partner.firstName}',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class _MatchedState extends StatelessWidget {
  const _MatchedState({required this.partner});

  final LanguagePartner partner;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('matched'),
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.celebration, color: Colors.orangeAccent, size: 44),
        const SizedBox(height: 12),
        Text(
          'Yes! You matched with ${partner.firstName} 🎉',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        Text(
          partner.matchHook,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey.shade700, height: 1.4),
        ),
        const SizedBox(height: 20),
        FilledButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            backgroundColor: const Color(0xFFFFA726),
          ),
          child: const Text(
            'View Profile',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
        const SizedBox(height: 12),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Keep browsing'),
        ),
      ],
    );
  }
}
