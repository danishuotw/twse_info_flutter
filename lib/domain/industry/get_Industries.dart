import 'package:twse_info_flutter/app/base/use_case.dart';
import 'package:twse_info_flutter/data/model/dto/company_dto.dart';
import 'package:twse_info_flutter/data/remote/data_state.dart';

class GetIndustriesParams {
  final String id;

  GetIndustriesParams(this.id);
}

class GetIndustries implements UseCase<DataState<CompanyDtoMap>, GetIndustriesParams> {
  @override
  Future<DataState<CompanyDtoMap>> call({required GetIndustriesParams params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
