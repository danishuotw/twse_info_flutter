import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:twse_info_flutter/data/model/dto/company_dto.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto_ext.dart';
import 'package:twse_info_flutter/data/model/remote/company/company_model.dart';
import 'package:twse_info_flutter/data/remote/api_config.dart';
import 'package:twse_info_flutter/data/remote/data_state.dart';

abstract class CompanyRepository {
  Future<DataState<Map<String, List<CompanyDto>>>> fetchData();
  Future<DataState<CompanyDto>> getCompany(String id);
  // Future<DataState<List<CompanyDto>>> getCompanies();

  Map<String, CompanyDto>? companyMap;
  Map<String, List<CompanyDto>>? industryMap;

  factory CompanyRepository() => _CompanyRepository();
}

class _CompanyRepository implements CompanyRepository {
  List<CompanyDto> companies = [];
  @override
  Map<String, CompanyDto>? companyMap; // Cache
  @override
  Map<String, List<CompanyDto>>? industryMap; // Cache

  @override
  Future<DataState<Map<String, List<CompanyDto>>>> fetchData() async {
    if (industryMap != null) return Future.value(DataSuccess(industryMap));
    final response = await http.get(Uri.parse('${ApiConfig.baseURL}${ApiConfig.openDataPath}'));
    try {
      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> dataList = jsonDecode(utf8.decode(response.bodyBytes));
        final companyList = dataList.map((e) => CompanyModel.fromJson(e)).toList();
        companies = companyList.map((e) => e.toCompanyDto()).toList();
        industryMap = groupBy(companies, (p0) => p0.industry ?? 'XX');
        return DataSuccess(industryMap);
      } else {
        return DataFailed(response.statusCode.toString());
      }
    } catch (e) {
      if (kDebugMode) print(e);
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<CompanyDto>> getCompany(String id) async {
    if (companyMap != null) return Future.value(DataSuccess(companyMap![id]));
    if (companies.isNotEmpty) {
      companyMap = {for (var element in companies) element.id ?? '': element};
      return DataSuccess(companyMap?[id]);
    } else {
      return const DataFailed('Data not found...');
    }
  }

  // @override
  // Future<List<CompanyDto>> getCompanies() async {
  //   final response = await http.get(Uri.parse('${ApiConfig.baseURL}/opendata/t187ap03_P'));
  //   try {
  //     if (response.statusCode == HttpStatus.ok) {
  //       final List<dynamic> dataList = jsonDecode(utf8.decode(response.bodyBytes));
  //       final companies = dataList.map((e) => CompanyModel.fromJson(e).toCompanyDto()).toList();
  //     } else {}
  //   } catch (e) {
  //     if (kDebugMode) print(e);
  //     return DataFailed(e.toString());
  //   }
  // }
}
