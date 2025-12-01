import '../../domain/entities/language_partner.dart';
import '../../domain/repositories/partner_repository.dart';
import '../datasources/mock_partner_data_source.dart';

class PartnerRepositoryImpl implements PartnerRepository {
  PartnerRepositoryImpl(this._dataSource);

  final PartnerDataSource _dataSource;

  @override
  Future<List<LanguagePartner>> fetchPartners() {
    return _dataSource.fetchPartners();
  }

}
