import 'dart:async';

import '../../domain/entities/availability_slot.dart';
import '../../domain/entities/language_partner.dart';
import '../../domain/entities/session_plan.dart';

abstract class PartnerDataSource {
  Future<List<LanguagePartner>> fetchPartners();
}

class MockPartnerDataSource implements PartnerDataSource {
  @override
  Future<List<LanguagePartner>> fetchPartners() async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    return _mockPartners;
  }
}

const _mockPartners = [
  LanguagePartner(
    id: 'sofia',
    name: 'Sofia Kim',
    age: 26,
    flag: '🇰🇷',
    location: 'Seoul, South Korea',
    timezone: 'GMT+9',
    learningLanguage: 'French',
    learningFlag: '🇫🇷',
    bio:
        'Product designer building calm tech, loves rooftop picnics and indie playlists.',
    longBio:
        'Sofia is focusing on spontaneous French conversation so she can keep up while consulting in Paris this fall. She already journals daily in Korean and English and now wants to bring that flow to French.',
    hobbies: ['Indie Cafés', 'Urban Sketching', 'K-Drama nights'],
    tags: ['UX nerd', 'Evening learner', 'Audio-first'],
    goals: [
      'Hold 10-minute free talk without switching to English',
      'Collect 50 new idioms through live sessions',
      'Host a bilingual design critique',
    ],
    accentColor: 0xFF7F54F4,
    availability: [
      AvailabilitySlot(
        day: 'Tuesday',
        window: '8:00 - 10:00 PM',
        focus: 'Listening sprints',
      ),
      AvailabilitySlot(
        day: 'Thursday',
        window: '7:00 - 9:00 PM',
        focus: 'Co-working French',
      ),
      AvailabilitySlot(
        day: 'Sunday',
        window: '10:00 - 11:30 AM',
        focus: 'Vocabulary walks',
      ),
    ],
    sessionPlan: [
      SessionPlan(
        title: 'Day 1 · Warm-up cafe chat',
        description:
            'Trade morning routines and design wins while focusing on filler phrases.',
        focus: ['Small talk', 'Confidence'],
        day: 'Tue',
        iconKey: 'coffee',
      ),
      SessionPlan(
        title: 'Day 3 · Audio sketch lab',
        description:
            'Describe a Paris street scene using senses, then sketch it together.',
        focus: ['Storytelling', 'Sensory vocab'],
        day: 'Thu',
        iconKey: 'brush',
      ),
      SessionPlan(
        title: 'Day 5 · After hours feedback',
        description:
            'Role-play a design crit entirely in French with live corrections.',
        focus: ['Professional tone', 'Listening'],
        day: 'Sun',
        iconKey: 'design',
      ),
    ],
    matchHook:
        'Sofia hosts Sunday "slow French" playlists and loves meeting curious builders.',
  ),
  LanguagePartner(
    id: 'luca',
    name: 'Luca Bianchi',
    age: 29,
    flag: '🇮🇹',
    location: 'Milan, Italy',
    timezone: 'GMT+1',
    learningLanguage: 'Portuguese',
    learningFlag: '🇵🇹',
    bio:
        "Food anthropologist documenting grandmas' recipes, obsessed with vinyl collecting.",
    longBio:
        'Luca is researching Lusophone home kitchens and wants to document stories in native Portuguese. He enjoys multimedia swaps—audio notes, recipe cards, anything tactile.',
    hobbies: ['Vinyl digging', 'Cycling', 'Street photography'],
    tags: ['Morning energy', 'Voice note fan', 'Culture swaps'],
    goals: [
      'Record a 5-minute Portuguese podcast episode',
      'Confidently interview chefs during travels',
      'Curate a bilingual recipe zine',
    ],
    accentColor: 0xFFE57373,
    availability: [
      AvailabilitySlot(
        day: 'Monday',
        window: '6:30 - 8:00 AM',
        focus: 'Coffee journaling',
      ),
      AvailabilitySlot(
        day: 'Wednesday',
        window: '8:00 - 9:30 PM',
        focus: 'Recipe storytelling',
      ),
      AvailabilitySlot(
        day: 'Saturday',
        window: '11:00 AM - 1:00 PM',
        focus: 'Market immersion',
      ),
    ],
    sessionPlan: [
      SessionPlan(
        title: 'Day 1 · Sunrise journaling',
        description: 'Share gratitude lists via voice notes and respond live.',
        focus: ['Pronunciation', 'Flow'],
        day: 'Mon',
        iconKey: 'sunny',
      ),
      SessionPlan(
        title: 'Day 2 · Recipe swap',
        description:
            'Describe your comfort dish ingredients and senses in Portuguese.',
        focus: ['Food vocab', 'Listening'],
        day: 'Wed',
        iconKey: 'restaurant',
      ),
      SessionPlan(
        title: 'Day 4 · Market interview',
        description:
            'Role-play interviewing a Lisbon market vendor with follow-ups.',
        focus: ['Confidence', 'Question flow'],
        day: 'Sat',
        iconKey: 'mic',
      ),
    ],
    matchHook:
        'Luca will probably send you fresh vinyl finds between sessions.',
  ),
  LanguagePartner(
    id: 'amara',
    name: 'Amara Diallo',
    age: 24,
    flag: '🇸🇳',
    location: 'Dakar, Senegal',
    timezone: 'GMT+0',
    learningLanguage: 'Japanese',
    learningFlag: '🇯🇵',
    bio:
        'Climate storyteller prototyping low-tech field recorders. Loves ocean swims.',
    longBio:
        'Amara wants to document coastal communities in Japan later this year. She learns through tactile projects and collaborative mood-boards.',
    hobbies: ['Analog photography', 'Surfing', 'Sound design'],
    tags: ['Field reporter', 'Hands-on', 'Weekend warrior'],
    goals: [
      'Pitch a Japanese-language short doc',
      'Lead a bilingual climate workshop',
      'Build a kanji mood-board',
    ],
    accentColor: 0xFF26A69A,
    availability: [
      AvailabilitySlot(
        day: 'Tuesday',
        window: '7:00 - 8:30 AM',
        focus: 'Kanji sketches',
      ),
      AvailabilitySlot(
        day: 'Friday',
        window: '5:00 - 7:00 PM',
        focus: 'Story lab',
      ),
      AvailabilitySlot(
        day: 'Sunday',
        window: '9:00 - 10:30 AM',
        focus: 'Grammar & sea breeze',
      ),
    ],
    sessionPlan: [
      SessionPlan(
        title: 'Day 1 · Sound postcard',
        description:
            'Swap ambient sounds and narrate them with new adjectives.',
        focus: ['Listening', 'Imagery'],
        day: 'Tue',
        iconKey: 'waves',
      ),
      SessionPlan(
        title: 'Day 3 · Story sprint',
        description: 'Storyboard a climate vignette together in Japanese.',
        focus: ['Narrative', 'Kanji'],
        day: 'Fri',
        iconKey: 'movie',
      ),
      SessionPlan(
        title: 'Day 5 · Reflection swim',
        description:
            'Language reflection prompts right after a swim (metaphorically).',
        focus: ['Reflection', 'Grammar'],
        day: 'Sun',
        iconKey: 'pool',
      ),
    ],
    matchHook: 'Amara sends "field kits" before every co-study session.',
  ),
  LanguagePartner(
    id: 'mina',
    name: 'Mina Alvarez',
    age: 31,
    flag: '🇲🇽',
    location: 'CDMX, Mexico',
    timezone: 'GMT-6',
    learningLanguage: 'German',
    learningFlag: '🇩🇪',
    bio:
        'Hardware PM by day, synth tinkerer by night. Collects brutalist postcards.',
    longBio:
        'Mina is preparing for a Berlin assignment. She wants crisp pronunciation and playful vocabulary to chat with engineers and artists alike.',
    hobbies: ['Synth jams', 'Museum hopping', 'Rock climbing'],
    tags: ['Night owl', 'Climber', 'Tech + art'],
    goals: [
      'Demo a hardware roadmap auf Deutsch',
      'Host a Berlin photo walk',
      'Master 30 engineering idioms',
    ],
    accentColor: 0xFF5C6BC0,
    availability: [
      AvailabilitySlot(
        day: 'Wednesday',
        window: '9:00 - 10:30 PM',
        focus: 'Late night drills',
      ),
      AvailabilitySlot(
        day: 'Friday',
        window: '7:30 - 9:00 AM',
        focus: 'Coffee pronunciation',
      ),
      AvailabilitySlot(
        day: 'Saturday',
        window: '4:00 - 6:00 PM',
        focus: 'Museum journaling',
      ),
    ],
    sessionPlan: [
      SessionPlan(
        title: 'Day 1 · Synth warmups',
        description: 'Name synth patches + moods only in German.',
        focus: ['Pronunciation', 'Creativity'],
        day: 'Wed',
        iconKey: 'piano',
      ),
      SessionPlan(
        title: 'Day 3 · Standup retro',
        description: 'Run a product standup with engineering idioms.',
        focus: ['Work vocabulary', 'Confidence'],
        day: 'Fri',
        iconKey: 'chart',
      ),
      SessionPlan(
        title: 'Day 4 · Gallery improv',
        description: 'Describe brutalist postcards and improvise stories.',
        focus: ['Storytelling', 'Listening'],
        day: 'Sat',
        iconKey: 'museum',
      ),
    ],
    matchHook: 'Mina tends to send synth riffs after each session recap.',
  ),
];
