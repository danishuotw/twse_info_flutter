import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:twse_info_flutter/data/local/db/app_database.dart';
import 'package:twse_info_flutter/data/local/db/local_data_source.dart';
import 'package:twse_info_flutter/data/remote/api_config.dart';
import 'package:twse_info_flutter/data/remote/dio/dio_provider.dart';
import 'package:twse_info_flutter/data/remote/serivce/company/company_service.dart';
import 'package:twse_info_flutter/data/repository/company_repository.dart';
import 'package:twse_info_flutter/domain/favourite/add_favourite.dart';
import 'package:twse_info_flutter/domain/favourite/delete_favourite.dart';
import 'package:twse_info_flutter/domain/favourite/get_all_favourite.dart';
import 'package:twse_info_flutter/domain/favourite/get_favourite.dart';
import 'package:twse_info_flutter/domain/favourite/watch_all_favourite.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Data - DB
  injector.registerSingleton(AppDatabase());

  // Dio
  injector.registerSingleton<Dio>(DioProvider(ApiConfig.baseURL).create());

  // Data - Remote
  injector.registerSingleton<CompanyService>(CompanyService(injector()));

  // Data - Repository
  injector.registerSingleton<CompanyRepository>(CompanyRepository(injector()));

  // Data - Local Data Source
  injector.registerSingleton<FavouriteLocalDataSource>(FavouriteLocalDataSource(injector()));

  // Domain
  injector.registerSingleton<GetFavourite>(GetFavourite(injector()));
  injector.registerSingleton<AddFavourite>(AddFavourite(injector()));
  injector.registerSingleton<DeleteFavourite>(DeleteFavourite(injector()));
  injector.registerSingleton<GetAllFavourite>(GetAllFavourite(injector()));
  injector.registerSingleton<WatchAllFavourite>(WatchAllFavourite(injector()));
}
