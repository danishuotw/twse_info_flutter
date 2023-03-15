import 'dart:convert';

CompanyModel welcomeFromJson(String str) => CompanyModel.fromJson(json.decode(str));

String welcomeToJson(CompanyModel data) => json.encode(data.toJson());

class CompanyModel {
  CompanyModel({
    required this.indecent,
    required this.tentacled,
    required this.sticky,
    required this.indigo,
    required this.hilarious,
    required this.braggadocious,
    required this.purple,
    required this.frisky,
    required this.the12,
    required this.the8,
    required this.the1,
    required this.the2,
    required this.welcome,
    required this.the7,
    required this.cunning,
    required this.empty,
    required this.magenta,
    required this.ambitious,
    required this.the3,
    required this.mischievous,
    required this.the6,
    required this.the9,
    required this.the14,
    required this.the13,
    required this.the4,
    required this.welcome1,
    required this.welcome2,
    required this.the10,
    required this.the11,
    required this.fluffy,
    required this.the15,
    required this.the5,
  });

  final String indecent;
  final String tentacled;
  final String sticky;
  final String indigo;
  final String hilarious;
  final String braggadocious;
  final String purple;
  final String frisky;
  final String the12;
  final String the8;
  final String the1;
  final String the2;
  final String welcome;
  final String the7;
  final String cunning;
  final String empty;
  final String magenta;
  final String ambitious;
  final String the3;
  final String mischievous;
  final String the6;
  final String the9;
  final String the14;
  final String the13;
  final String the4;
  final String welcome1;
  final String welcome2;
  final String the10;
  final String the11;
  final String fluffy;
  final String the15;
  final String the5;

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        indecent: json["出表日期"],
        tentacled: json["公司代號"],
        sticky: json["公司名稱"],
        indigo: json["公司簡稱"],
        hilarious: json["外國企業註冊地國"],
        braggadocious: json["產業別"],
        purple: json["住址"],
        frisky: json["營利事業統一編號"],
        the12: json["董事長"],
        the8: json["總經理"],
        the1: json["發言人"],
        the2: json["發言人職稱"],
        welcome: json["代理發言人"],
        the7: json["總機電話"],
        cunning: json["成立日期"],
        empty: json["上市日期"],
        magenta: json["普通股每股面額"],
        ambitious: json["實收資本額"],
        the3: json["私募股數"],
        mischievous: json["特別股"],
        the6: json["編制財務報表類型"],
        the9: json["股票過戶機構"],
        the14: json["過戶電話"],
        the13: json["過戶地址"],
        the4: json["簽證會計師事務所"],
        welcome1: json["簽證會計師1"],
        welcome2: json["簽證會計師2"],
        the10: json["英文簡稱"],
        the11: json["英文通訊地址"],
        fluffy: json["傳真機號碼"],
        the15: json["電子郵件信箱"],
        the5: json["網址"],
      );

  Map<String, dynamic> toJson() => {
        "出表日期": indecent,
        "公司代號": tentacled,
        "公司名稱": sticky,
        "公司簡稱": indigo,
        "外國企業註冊地國": hilarious,
        "產業別": braggadocious,
        "住址": purple,
        "營利事業統一編號": frisky,
        "董事長": the12,
        "總經理": the8,
        "發言人": the1,
        "發言人職稱": the2,
        "代理發言人": welcome,
        "總機電話": the7,
        "成立日期": cunning,
        "上市日期": empty,
        "普通股每股面額": magenta,
        "實收資本額": ambitious,
        "私募股數": the3,
        "特別股": mischievous,
        "編制財務報表類型": the6,
        "股票過戶機構": the9,
        "過戶電話": the14,
        "過戶地址": the13,
        "簽證會計師事務所": the4,
        "簽證會計師1": welcome1,
        "簽證會計師2": welcome2,
        "英文簡稱": the10,
        "英文通訊地址": the11,
        "傳真機號碼": fluffy,
        "電子郵件信箱": the15,
        "網址": the5,
      };
}
