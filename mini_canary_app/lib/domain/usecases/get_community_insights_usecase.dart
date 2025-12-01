import '../entities/community_insight.dart';
import '../repositories/partner_repository.dart';

class GetCommunityInsightsUseCase {
  const GetCommunityInsightsUseCase(this._repository);

  final PartnerRepository _repository;

  Future<CommunityInsights> call() {
    return _repository.fetchCommunityInsights();
  }
}
