import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection_container.dart';
import '../../../domain/entities/language_partner.dart';
import '../../bloc/match_flow/match_flow_cubit.dart';
import '../../bloc/partner_feed/partner_feed_bloc.dart';
import '../../widgets/match_modal.dart';
import '../../widgets/partner_card.dart';
import '../profile/partner_profile_screen.dart';

class UserFeedScreen extends StatelessWidget {
  const UserFeedScreen({super.key});

  Future<void> _openMatchSheet(
    BuildContext context,
    LanguagePartner partner,
  ) async {
    final shouldOpenProfile = await showModalBottomSheet<bool>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return BlocProvider(
          create: (_) => sl<MatchFlowCubit>()..startMatching(partner),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: MatchModal(partner: partner),
          ),
        );
      },
    );

    if (shouldOpenProfile == true && context.mounted) {
      _openProfile(context, partner);
    }
  }

  void _openProfile(BuildContext context, LanguagePartner partner) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PartnerProfileScreen(partner: partner),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mini Canary Matches',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      
      ),
      body: SafeArea(
        child: BlocBuilder<PartnerFeedBloc, PartnerFeedState>(
          builder: (context, state) {
            switch (state.status) {
              case PartnerFeedStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case PartnerFeedStatus.failure:
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(state.errorMessage ?? 'Something went wrong'),
                      const SizedBox(height: 12),
                      FilledButton(
                        onPressed: () => context
                            .read<PartnerFeedBloc>()
                            .add(const PartnerFeedRequested()),
                        child: const Text('Try again'),
                      ),
                    ],
                  ),
                );
              case PartnerFeedStatus.success:
                return RefreshIndicator(
                  onRefresh: () async => context
                      .read<PartnerFeedBloc>()
                      .add(const PartnerFeedRequested()),
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
                    itemCount: state.partners.length,
                    itemBuilder: (context, index) {
                      final partner = state.partners[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index == state.partners.length - 1 ? 0 : 18,
                        ),
                        child: PartnerCard(
                          partner: partner,
                          onViewProfile: () => _openProfile(context, partner),
                          onMatch: () => _openMatchSheet(context, partner),
                        ),
                      );
                    },
                  ),
                );
              case PartnerFeedStatus.initial:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
