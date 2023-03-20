// class GetCompanyDetailParams {
//   final String id;
//
//   GetCompanyDetailParams(this.id);
// }
//
// class GetCompanyDetail implements UseCase<DataState<CompanyDto>, GetCompanyDetailParams> {
//   @override
//   Future<DataState<CompanyDto>> call({required GetCompanyDetailParams params}) async {
//   final response = await http.get(Uri.parse('${ApiConfig.baseURL}/opendata/t187ap03_P'));
//   try {
//     if (response.statusCode == HttpStatus.ok) {
//       final List<dynamic> dataList = jsonDecode(utf8.decode(response.bodyBytes));
//       final companyList = dataList.map((e) => CompanyModel.fromJson(e)).toList();
//       // companies = companyList.map((e) => e.toCompanyDto()).toList();
//       // companyMap = groupBy(companyList, (p0) => p0.industry);
//       return DataSuccess(companyMap);
//     } else {
//       return DataFailed(response.statusCode.toString());
//     }
//   } catch (e) {
//     if (kDebugMode) print(e);
//     return DataFailed(e.toString());
//   }
// }
// }
