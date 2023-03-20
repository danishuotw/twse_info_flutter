import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';
import 'package:twse_info_flutter/app/base/view_state.dart';
import 'package:twse_info_flutter/app/widgets/app_bar.dart';
import 'package:twse_info_flutter/app/widgets/app_empty_screen.dart';
import 'package:twse_info_flutter/app/widgets/app_error_screen.dart';
import 'package:twse_info_flutter/app/widgets/app_loading_screen.dart';
import 'package:twse_info_flutter/data/model/dto/industry_type.dart';
import 'package:twse_info_flutter/presentation/company/detail/company_detail_screen.dart';
import 'package:twse_info_flutter/presentation/company/list/companies_view_model.dart';
import 'package:twse_info_flutter/presentation/company/list/widgets/company_tile.dart';

class CompaniesScreen extends StatelessWidget {
  static const route = '/companies/:industryId';

  final String industryId;

  const CompaniesScreen({
    Key? key,
    required this.industryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ViewModelBuilder<CompaniesViewModel>.reactive(
        viewModelBuilder: () => CompaniesViewModel(id: industryId),
        onModelReady: (vm) => vm.fetchData(),
        builder: (context, model, child) => Scaffold(
          appBar: _buildAppBar(model),
          body: _buildBody(context, model),
        ),
      );

  AppNavBar _buildAppBar(CompaniesViewModel viewModel) {
    return AppNavBar(
      title: IndustryType.fromValue(industryId).name(),
    );
  }

  Widget _buildBody(BuildContext context, CompaniesViewModel viewModel) {
    switch (viewModel.viewState.state) {
      case ResponseState.LOADING:
        return const AppLoadingScreen();
      case ResponseState.COMPLETE:
        return _buildListView(viewModel);
      case ResponseState.ERROR:
        return const AppErrorScreen();
      case ResponseState.EMPTY:
        return const AppEmptyScreen();
    }
  }

  Widget _buildListView(CompaniesViewModel viewModel) {
    final items = viewModel.viewState.data ?? List.empty();
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return CompanyListTile(
          onTap: () => _navigateDetail(context, item.id),
          number: item.id ?? '',
          title: item.name ?? '',
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }

  void _navigateDetail(BuildContext context, String? id) {
    context.pushNamed(CompanyDetailScreen.route, params: {'companyId': '$id'});
  }
}
