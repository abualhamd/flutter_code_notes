import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'core/api/api_consumer.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Features

  // cubit
  sl.registerFactory<MyCubit>(() => MyCubit(getRandomQuoteUseCase: sl()));

  // usecases
  sl.registerLazySingleton<SomeUseCase>(() => SomeUseCase(quoteRepo: sl()));

  // repos
  sl.registerLazySingleton<Repo>(() => RepoImpl(
        randomQuoteLocalDataSource: sl(),
        randomQuoteRemoteDataSource: sl(),
        networkInfo: sl(),
      ));
  // data sources
  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(
            sharedPreferences: sl(),
          ));

  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(apiConsumer: sl()));

  /// Core

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
  sl.registerLazySingleton(() => Dio());
}