import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto_ext.dart';
import 'package:twse_info_flutter/data/remote/data_state.dart';
import 'package:twse_info_flutter/data/remote/serivce/company/company_service.dart';

abstract class CompanyRepository {
  Future<DataState<Map<String, List<CompanyDto>>>> getCompanies();
  Future<DataState<CompanyDto>> getCompany(String id);

  Map<String, CompanyDto>? companyMap;
  Map<String, List<CompanyDto>>? industryMap;

  late List<CompanyDto> companies;
  late CompanyService companyService;

  factory CompanyRepository(CompanyService companyService) => _CompanyRepository(companyService);
}

abstract class CompanyRepositoryMixin implements CompanyRepository {
  @override
  late List<CompanyDto> companies;

  @override
  late CompanyService companyService;

  @override
  Map<String, CompanyDto>? companyMap; // Cache

  @override
  Map<String, List<CompanyDto>>? industryMap; // Cache
}

class _CompanyRepository with CompanyRepositoryMixin implements CompanyRepository {
  _CompanyRepository(CompanyService companyService) {
    this.companyService = companyService;
    companies = [];
  }

  @override
  Future<DataState<Map<String, List<CompanyDto>>>> getCompanies() async {
    if (industryMap != null) return Future.value(DataSuccess(industryMap));
    final httpResponse = await companyService.getCompanies();
    try {
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        companies = httpResponse.data.map((e) => e.toCompanyDto()).toList();
        industryMap = groupBy(companies, (p0) => p0.industry ?? 'XX');
        return DataSuccess(industryMap);
      } else {
        return DataFailed(httpResponse.response.statusCode.toString());
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
}
