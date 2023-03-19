import 'dart:convert';

CompanyModel companyFromJson(String str) => CompanyModel.fromJson(json.decode(str));

String companyToJson(CompanyModel data) => json.encode(data.toJson());

class CompanyModel {
  CompanyModel({
    required this.publishedDate, // 出表日期
    required this.companyCode, // 公司代號
    required this.companyName, // 公司名稱
    required this.companyAbbreviation, // 公司簡稱
    required this.countryWhereTheForeignEnterpriseIsRegistered, // 外國企業註冊地國
    required this.industry, // 產業別
    required this.address, // 住址
    required this.unifiedNumberOfProfitableEnterprises, // 營利事業統一編號
    required this.chairman, // 董事長
    required this.generalManager, // 總經理
    required this.speaker, // 發言人
    required this.speakerTitle, // 發言人職稱
    required this.actingSpokesperson, // 代理發言人
    required this.switchboardPhone, // 總機電話
    required this.establishmentDate, // 成立日期
    required this.listedDate, // 上市日期
    required this.ordinaryShareParValuePerShare, // 普通股每股面額
    required this.paidInCapital, // 實收資本額
    required this.numberOfPrivateShares, // 私募股數
    required this.specialStock, // 特別股
    required this.preparationFinancialStatementType, // 編制財務報表類型
    required this.stockTransferAgency, // 股票過戶機構
    required this.transferPhone, // 過戶電話
    required this.transferAddress, // 過戶地址
    required this.visaAccountingFirm, // 簽證會計師事務所
    required this.visaAccountant1, // 簽證會計師1
    required this.visaAccountant2, // 簽證會計師2
    required this.englishAbbreviation, // 英文簡稱
    required this.englishCorrespondenceAddress, // 英文通訊地址
    required this.faxMachineNumber, // 傳真機號碼
    required this.eMail, // 電子郵件信箱
    required this.url, // 網址
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
