import '../entities/language_partner.dart';
import '../repositories/partner_repository.dart';

class GetPartnersUseCase {
  const GetPartnersUseCase(this._repository);

  final PartnerRepository _repository;

  Future<List<LanguagePartner>> call() {
    return _repository.fetchPartners();
  }
}
