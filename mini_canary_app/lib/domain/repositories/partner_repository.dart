import '../entities/language_partner.dart';

abstract class PartnerRepository {
  Future<List<LanguagePartner>> fetchPartners();
}
