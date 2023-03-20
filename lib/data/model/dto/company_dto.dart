typedef CompanyDtoMap = Map<String, List<CompanyDto>>;

class CompanyDto {
  final String? id; // 公司代號
  final String? name; // 公司名稱
  final String? industry; // 產業別
  final String? establishmentDate; // 成立日期
  final String? listedDate; // 上市日期
  final String? chairman; // 董事長
  final String? generalManager; // 總經理
  final String? switchboardPhone; // 總機電話
  final String? address; // 地址
  final String? unifiedNumber; // 營利事業統一編號
  final String? paidInCapital; // 實收資本額
  final String? specialStock; // 特別股
  final String? parValue; // 普通股每股面額
  final String? url; // 網址

  CompanyDto(
    this.id,
    this.name,
    this.industry,
    this.establishmentDate,
    this.listedDate,
    this.chairman,
    this.generalManager,
    this.switchboardPhone,
    this.address,
    this.unifiedNumber,
    this.paidInCapital,
    this.specialStock,
    this.parValue,
    this.url,
  );
}
