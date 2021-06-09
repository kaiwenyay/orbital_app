import 'package:get_it/get_it.dart';
import 'package:orbital_app/view_models/authenticate/signin_view_model.dart';
import 'package:orbital_app/view_models/authenticate/password_reset_view_model.dart';
import 'package:orbital_app/view_models/authenticate/register_view_model.dart';
import 'package:orbital_app/view_models/home/home_view_model.dart';
import 'package:orbital_app/view_models/drawer/app_drawer_view_model.dart';
import 'package:orbital_app/view_models/home/all_locations_view_model.dart';
import 'package:orbital_app/view_models/order_view_model.dart';
import 'package:orbital_app/view_models/submit_order_flow/location_view_model.dart';
import 'package:orbital_app/view_models/submit_order_flow/input_order_view_model.dart';
import 'dummy_database.dart';
import 'database.dart';
import 'auth_service.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton(() => SignInViewModel());
  serviceLocator.registerLazySingleton(() => RegisterViewModel());
  serviceLocator.registerLazySingleton(() => PasswordResetViewModel());
  serviceLocator.registerLazySingleton(() => AppDrawerViewModel());
  serviceLocator.registerLazySingleton(() => AllLocationsViewModel());
  serviceLocator.registerFactory(() => HomeViewModel());
  serviceLocator.registerFactory(() => LocationViewModel());
  serviceLocator.registerFactory(() => InputOrderViewModel());
  serviceLocator.registerFactory(() => OrderViewModel());
  serviceLocator.registerLazySingleton(() => AuthService());
  serviceLocator.registerLazySingleton(() => DatabaseService.init());
  serviceLocator.registerLazySingleton(() => DummyDatabase());
}