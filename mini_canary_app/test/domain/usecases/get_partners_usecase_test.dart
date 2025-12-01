import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:mini_canary_app/domain/entities/availability_slot.dart';
import 'package:mini_canary_app/domain/entities/language_partner.dart';
import 'package:mini_canary_app/domain/entities/session_plan.dart';
import 'package:mini_canary_app/domain/repositories/partner_repository.dart';
import 'package:mini_canary_app/domain/usecases/get_partners_usecase.dart';

class _MockPartnerRepository extends Mock implements PartnerRepository {}

void main() {
  late PartnerRepository repository;
  late GetPartnersUseCase useCase;

  setUp(() {
    repository = _MockPartnerRepository();
    useCase = GetPartnersUseCase(repository);
  });

  test('returns partners from repository', () async {
    final partners = [
      LanguagePartner(
        id: '1',
        name: 'Test',
        age: 20,
        flag: '🏳️',
        location: 'Remote',
        timezone: 'GMT',
        learningLanguage: 'French',
        learningFlag: '🇫🇷',
        bio: 'Bio',
        longBio: 'Long bio',
        hobbies: const ['A'],
        tags: const ['tag'],
        goals: const ['Goal'],
        accentColor: 0xFFFFFFFF,
        availability: const [
          AvailabilitySlot(day: 'Mon', window: '8-9', focus: 'Focus'),
        ],
        sessionPlan: const [
          SessionPlan(
            title: 'Session',
            description: 'Desc',
            focus: ['Skill'],
            day: 'Mon',
            iconKey: 'coffee',
          ),
        ],
        matchHook: 'Hook',
      ),
    ];

    when(repository.fetchPartners).thenAnswer((_) async => partners);

    final result = await useCase();

    expect(result, partners);
    verify(repository.fetchPartners).called(1);
    verifyNoMoreInteractions(repository);
  });
}
