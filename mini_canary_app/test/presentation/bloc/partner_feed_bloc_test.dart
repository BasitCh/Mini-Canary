import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:mini_canary_app/domain/entities/availability_slot.dart';
import 'package:mini_canary_app/domain/entities/language_partner.dart';
import 'package:mini_canary_app/domain/entities/session_plan.dart';
import 'package:mini_canary_app/domain/usecases/get_partners_usecase.dart';
import 'package:mini_canary_app/presentation/bloc/partner_feed/partner_feed_bloc.dart';

class _MockGetPartnersUseCase extends Mock implements GetPartnersUseCase {}

void main() {
  late GetPartnersUseCase getPartnersUseCase;
  late PartnerFeedBloc bloc;
  final partners = [
    LanguagePartner(
      id: '1',
      name: 'Tester',
      age: 22,
      flag: '🇫🇷',
      location: 'Paris',
      timezone: 'GMT+1',
      learningLanguage: 'Portuguese',
      learningFlag: '🇵🇹',
      bio: 'Bio',
      longBio: 'Long bio',
      hobbies: const ['A'],
      tags: const ['tag'],
      goals: const ['Goal'],
      accentColor: 0xFFFFFFFF,
      availability: const [
        AvailabilitySlot(day: 'Tue', window: '8-9', focus: 'Focus'),
      ],
      sessionPlan: const [
        SessionPlan(
          title: 'Session',
          description: 'Desc',
          focus: ['Skill'],
          day: 'Tue',
          iconKey: 'coffee',
        ),
      ],
      matchHook: 'Hook',
    ),
  ];

  setUp(() {
    getPartnersUseCase = _MockGetPartnersUseCase();
    bloc = PartnerFeedBloc(getPartnersUseCase: getPartnersUseCase);
  });

  tearDown(() => bloc.close());

  blocTest<PartnerFeedBloc, PartnerFeedState>(
    'emits success state when repository returns partners',
    build: () {
      when(() => getPartnersUseCase()).thenAnswer((_) async => partners);
      return bloc;
    },
    act: (bloc) => bloc.add(const PartnerFeedRequested()),
    expect: () => [
      const PartnerFeedState(status: PartnerFeedStatus.loading),
      PartnerFeedState(status: PartnerFeedStatus.success, partners: partners),
    ],
  );

  blocTest<PartnerFeedBloc, PartnerFeedState>(
    'emits failure state when repository throws',
    build: () {
      when(() => getPartnersUseCase()).thenThrow(Exception('error'));
      return bloc;
    },
    act: (bloc) => bloc.add(const PartnerFeedRequested()),
    expect: () => [
      const PartnerFeedState(status: PartnerFeedStatus.loading),
      const PartnerFeedState(
        status: PartnerFeedStatus.failure,
        errorMessage: 'Unable to fetch partners right now.',
      ),
    ],
  );
}
