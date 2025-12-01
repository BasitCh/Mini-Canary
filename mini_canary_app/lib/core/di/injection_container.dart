import 'package:get_it/get_it.dart';

import '../../data/datasources/mock_partner_data_source.dart';
import '../../data/repositories/partner_repository_impl.dart';
import '../../domain/repositories/partner_repository.dart';
import '../../domain/usecases/get_partners_usecase.dart';
import '../../presentation/bloc/match_flow/match_flow_cubit.dart';
import '../../presentation/bloc/partner_feed/partner_feed_bloc.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  // Data sources
  sl.registerLazySingleton<PartnerDataSource>(() => MockPartnerDataSource());

  // Repositories
  sl.registerLazySingleton<PartnerRepository>(
    () => PartnerRepositoryImpl(sl<PartnerDataSource>()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetPartnersUseCase(sl()));

  // Blocs / Cubits
  sl.registerFactory(
    () => PartnerFeedBloc(getPartnersUseCase: sl()),
  );
  sl.registerFactory(
    () => MatchFlowCubit(),
  );
}
