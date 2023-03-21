import 'package:flutter/cupertino.dart';
import 'package:twse_info_flutter/app/di/injector.dart';
import 'package:twse_info_flutter/data/local/db/local_data_source.dart';

class FollowingsViewModel extends ChangeNotifier {
  final CompanyLocalDataSource _localDataSource;

  FollowingsViewModel() : _localDataSource = injector<CompanyLocalDataSource>();

  void fetchData() async {}
}
