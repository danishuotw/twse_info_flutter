import 'package:twse_info_flutter/data/model/dto/company_dto.dart';
import 'package:twse_info_flutter/data/model/remote/company/company_model.dart';

extension CompanyDtoEx on CompanyModel {
  CompanyDto toCompanyDto() {
    return CompanyDto(
      companyCode,
      companyName,
      industry,
      establishmentDate,
      listedDate,
      chairman,
      generalManager,
      switchboardPhone,
      address,
      unifiedNumberOfProfitableEnterprises,
      paidInCapital,
      specialStock,
      ordinaryShareParValuePerShare,
      url,
    );
  }
}
