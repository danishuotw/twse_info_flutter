import 'package:twse_info_flutter/data/local/db/app_database.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto.dart';
import 'package:twse_info_flutter/data/model/remote/company/company_model.dart';

extension CompanyModelEx on CompanyModel {
  CompanyDto toCompanyDto() {
    return CompanyDto(
      companyCode,
      companyName,
      companyAbbreviation,
      industry,
      establishmentDate,
      listedDate,
      chairman,
      generalManager,
      switchboardPhone,
      address,
      unifiedNumberOfProfitableEnterprises,
      paidInCapital,
      numberOfPrivateShares,
      specialStock,
      ordinaryShareParValuePerShare,
      url,
    );
  }
}

extension CompanyEntityEx on CompanyDto {
  CompanyEntity toCompanyEntity() {
    return CompanyEntity(
      id: id,
      name: name,
      abbr: abbr,
      industry: industry,
      establishmentDate: establishmentDate,
      listedDate: listedDate,
      chairman: chairman,
      generalManager: generalManager,
      switchboardPhone: switchboardPhone,
      address: address,
      unifiedNumber: unifiedNumber,
      paidInCapital: paidInCapital,
      privateShares: privateShares,
      specialStock: specialStock,
      parValue: parValue,
      url: url,
    );
  }
}

extension CompanyDtoyEx on CompanyEntity {
  CompanyDto toCompanyDto() {
    return CompanyDto(
      id,
      name,
      abbr,
      industry,
      establishmentDate,
      listedDate,
      chairman,
      generalManager,
      switchboardPhone,
      address,
      unifiedNumber,
      paidInCapital,
      privateShares,
      specialStock,
      parValue,
      url,
    );
  }
}
