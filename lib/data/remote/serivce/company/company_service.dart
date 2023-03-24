import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:twse_info_flutter/data/model/remote/company/company_model.dart';

part 'company_service.g.dart';

@RestApi()
abstract class CompanyService {
  factory CompanyService(Dio dio) = _CompanyService;

  @GET("/opendata/t187ap03_P")
  Future<HttpResponse<CompanyModel>> getCompanies();
}
