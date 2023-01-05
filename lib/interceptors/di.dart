import 'dart:async';

import 'package:get_it/get_it.dart';

import '../routing/navigation.dart';
import '../utils/appConfig.dart';

final sl = GetIt.instance;
Future<void> init() async {

 // Dio client = Dio(
 //    BaseOptions(
 //      receiveDataWhenStatusError: true,
 //      connectTimeout: 50000,
 //      receiveTimeout: 30000,
 //      responseType: ResponseType.json,
 //      baseUrl: '${Endpoints.baseUrl}',
 //      contentType: 'application/json',
 //    ),
 //  );
 // sl.registerLazySingleton<Dio>(() => client);
 //
 // client..interceptors.addAll([
 //
 //   DioInterceptor(),
 //   if (kDebugMode) LoggerInterceptor(),
 // ]);

  sl.registerLazySingleton(() => AppConfig());
  sl.registerLazySingleton(() => NavigationService());
  // sl.registerLazySingleton(() => LoginRepository());
  // sl.registerLazySingleton(() => UserManagementRepository());
  // sl.registerLazySingleton(() => HomeRepository());
  // sl.registerLazySingleton(() => InvoicesRepository());
  // sl.registerLazySingleton(() => PayoutsRepository());


  // sl.registerLazySingleton(() => HomeProvider());
  // sl.registerLazySingleton(() => HomeProviderTeam());
  // sl.registerLazySingleton(() => UserManagementTeamProvider());
  // sl.registerLazySingleton(() => InvoiceTeamProvider());
  // sl.registerLazySingleton(() => AuthProvider());
  // sl.registerLazySingleton(() => PayoutsProvider());
  // sl.registerLazySingleton<HttpAuth>(() => HttpAuth(client: sl()));

  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  // sl.registerLazySingleton<SharedLocal>(
  //       () => SharedLocal(
  //     sharedPreferences: sl(),
  //   ),
  // );
}

