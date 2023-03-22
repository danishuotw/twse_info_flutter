import 'package:twse_info_flutter/data/local/db/app_database.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto.dart';
import 'package:twse_info_flutter/data/model/remote/company/company_model.dart';

extension CompanyModelEx on CompanyModel {
  CompanyDto toCompanyDto() {
    return CompanyDto(
      id: companyCode,
      name: companyName,
      abbr: companyAbbreviation,
      industry: industry,
      establishmentDate: establishmentDate,
      listedDate: listedDate,
      chairman: chairman,
      generalManager: generalManager,
      switchboardPhone: switchboardPhone,
      address: address,
      unifiedNumber: unifiedNumberOfProfitableEnterprises,
      paidInCapital: paidInCapital,
      privateShares: numberOfPrivateShares,
      specialStock: specialStock,
      parValue: ordinaryShareParValuePerShare,
      url: url,
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
