import '../entities/community_insight.dart';
import '../entities/language_partner.dart';

abstract class PartnerRepository {
  Future<List<LanguagePartner>> fetchPartners();
  Future<CommunityInsights> fetchCommunityInsights();
}
