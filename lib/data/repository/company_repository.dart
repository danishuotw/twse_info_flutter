import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:twse_info_flutter/data/model/remote/company/company_model.dart';
import 'package:twse_info_flutter/data/remote/api_config.dart';
import 'package:twse_info_flutter/data/remote/data_state.dart';

abstract class CompanyRepository {
  Future<DataState<Map<String, List<CompanyModel>>>> fetchData();
  Map<String, List<CompanyModel>>? companyMap;

  factory CompanyRepository() => _CompanyRepository._instance;
}

class _CompanyRepository implements CompanyRepository {
  static final _CompanyRepository _instance = _CompanyRepository._internal();

  _CompanyRepository._internal();

  @override
  Map<String, List<CompanyModel>>? companyMap; // Cache

  @override
  Future<DataState<Map<String, List<CompanyModel>>>> fetchData() async {
    if (companyMap != null) return Future.value(DataSuccess(companyMap));
    final response = await http.get(Uri.parse('${ApiConfig.baseURL}/opendata/t187ap03_P'));
    try {
      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> dataList = jsonDecode(utf8.decode(response.bodyBytes));
        final companyList = dataList.map((e) => CompanyModel.fromJson(e)).toList();
        companyMap = groupBy(companyList, (p0) => p0.industry);
        return DataSuccess(companyMap);
      } else {
        return DataFailed(response.statusCode.toString());
      }
    } catch (e) {
      if (kDebugMode) print(e);
      return DataFailed(e.toString());
    }
  }
}
