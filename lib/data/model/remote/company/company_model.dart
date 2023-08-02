import 'dart:convert';

CompanyModel companyFromJson(String str) => CompanyModel.fromJson(json.decode(str));

String companyToJson(CompanyModel data) => json.encode(data.toJson());

class CompanyModel {
  CompanyModel({
    required this.publishedDate,
    required this.companyCode,
    required this.companyName,
    required this.companyAbbreviation,
    required this.countryWhereTheForeignEnterpriseIsRegistered,
    required this.industry,
    required this.address,
    required this.unifiedNumberOfProfitableEnterprises,
    required this.chairman,
    required this.generalManager,
    required this.speaker,
    required this.speakerTitle,
    required this.actingSpokesperson,
    required this.switchboardPhone,
    required this.establishmentDate,
    required this.listedDate,
    required this.ordinaryShareParValuePerShare,
    required this.paidInCapital,
    required this.numberOfPrivateShares,
    required this.specialStock,
    required this.preparationFinancialStatementType,
    required this.stockTransferAgency,
    required this.transferPhone,
    required this.transferAddress,
    required this.visaAccountingFirm,
    required this.visaAccountant1,
    required this.visaAccountant2,
    required this.englishAbbreviation,
    required this.englishCorrespondenceAddress,
    required this.faxMachineNumber,
    required this.eMail,
    required this.url,
  });

  final String publishedDate;
  final String companyCode;
  final String companyName;
  final String companyAbbreviation;
  final String countryWhereTheForeignEnterpriseIsRegistered;
  final String industry;
  final String address;
  final String unifiedNumberOfProfitableEnterprises;
  final String chairman;
  final String generalManager;
  final String speaker;
  final String speakerTitle;
  final String actingSpokesperson;
  final String switchboardPhone;
  final String establishmentDate;
  final String listedDate;
  final String ordinaryShareParValuePerShare;
  final String paidInCapital;
  final String numberOfPrivateShares;
  final String specialStock;
  final String preparationFinancialStatementType;
  final String stockTransferAgency;
  final String transferPhone;
  final String transferAddress;
  final String visaAccountingFirm;
  final String visaAccountant1;
  final String visaAccountant2;
  final String englishAbbreviation;
  final String englishCorrespondenceAddress;
  final String faxMachineNumber;
  final String eMail;
  final String url;

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        publishedDate: json["出表日期"],
        companyCode: json["公司代號"],
        companyName: json["公司名稱"],
        companyAbbreviation: json["公司簡稱"],
        countryWhereTheForeignEnterpriseIsRegistered: json["外國企業註冊地國"],
        industry: json["產業別"],
        address: json["住址"],
        unifiedNumberOfProfitableEnterprises: json["營利事業統一編號"],
        chairman: json["董事長"],
        generalManager: json["總經理"],
        speaker: json["發言人"],
        speakerTitle: json["發言人職稱"],
        actingSpokesperson: json["代理發言人"],
        switchboardPhone: json["總機電話"],
        establishmentDate: json["成立日期"],
        listedDate: json["上市日期"],
        ordinaryShareParValuePerShare: json["普通股每股面額"],
        paidInCapital: json["實收資本額"],
        numberOfPrivateShares: json["私募股數"],
        specialStock: json["特別股"],
        preparationFinancialStatementType: json["編制財務報表類型"],
        stockTransferAgency: json["股票過戶機構"],
        transferPhone: json["過戶電話"],
        transferAddress: json["過戶地址"],
        visaAccountingFirm: json["簽證會計師事務所"],
        visaAccountant1: json["簽證會計師1"],
        visaAccountant2: json["簽證會計師2"],
        englishAbbreviation: json["英文簡稱"],
        englishCorrespondenceAddress: json["英文通訊地址"],
        faxMachineNumber: json["傳真機號碼"],
        eMail: json["電子郵件信箱"],
        url: json["網址"],
      );

  Map<String, dynamic> toJson() => {
        "出表日期": publishedDate,
        "公司代號": companyCode,
        "公司名稱": companyName,
        "公司簡稱": companyAbbreviation,
        "外國企業註冊地國": countryWhereTheForeignEnterpriseIsRegistered,
        "產業別": industry,
        "住址": address,
        "營利事業統一編號": unifiedNumberOfProfitableEnterprises,
        "董事長": chairman,
        "總經理": generalManager,
        "發言人": speaker,
        "發言人職稱": speakerTitle,
        "代理發言人": actingSpokesperson,
        "總機電話": switchboardPhone,
        "成立日期": establishmentDate,
        "上市日期": listedDate,
        "普通股每股面額": ordinaryShareParValuePerShare,
        "實收資本額": paidInCapital,
        "私募股數": numberOfPrivateShares,
        "特別股": specialStock,
        "編制財務報表類型": preparationFinancialStatementType,
        "股票過戶機構": stockTransferAgency,
        "過戶電話": transferPhone,
        "過戶地址": transferAddress,
        "簽證會計師事務所": visaAccountingFirm,
        "簽證會計師1": visaAccountant1,
        "簽證會計師2": visaAccountant2,
        "英文簡稱": englishAbbreviation,
        "英文通訊地址": englishCorrespondenceAddress,
        "傳真機號碼": faxMachineNumber,
        "電子郵件信箱": eMail,
        "網址": url,
      };
}
