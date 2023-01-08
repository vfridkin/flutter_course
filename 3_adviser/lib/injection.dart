import 'package:adviser/0_data/data_sources/advice_remote_data_source.dart';
import 'package:adviser/0_data/repositories/advice_repo_impl.dart';
import 'package:adviser/1_domain/use_cases/advice_use_cases.dart';
import 'package:adviser/2_application/pages/advice/cubit/adviser_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '1_domain/repositories/advice_repo.dart';

final sl = GetIt.I; // service locator

Future<void> init() async {
  //! application layer
  // Factory = every time a new/fresh instance of that class
  sl.registerFactory(() => AdviserCubit(adviceUseCases: sl()));

  //! domain layer
  sl.registerFactory(() => AdviceUseCases(adviceRepo: sl()));

  //! data layer
  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDataSource: sl()));
  sl.registerFactory<AdviceRemoteDataSource>(
      () => AdviceRemoteDataSourceImp(client: sl()));

//! Externals
  sl.registerFactory(() => http.Client());
}
