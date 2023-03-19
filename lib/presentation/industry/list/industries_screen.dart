import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';
import 'package:twse_info_flutter/app/base/view_state.dart';
import 'package:twse_info_flutter/app/widgets/app_bar.dart';
import 'package:twse_info_flutter/app/widgets/app_empty_screen.dart';
import 'package:twse_info_flutter/app/widgets/app_error_screen.dart';
import 'package:twse_info_flutter/app/widgets/app_loading_screen.dart';
import 'package:twse_info_flutter/data/model/dto/industry_type.dart';
import 'package:twse_info_flutter/presentation/company/list/companies_screen.dart';
import 'package:twse_info_flutter/presentation/industry/list/industries_view_model.dart';

class IndustriesScreen extends StatelessWidget {
  const IndustriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ViewModelBuilder<IndustriesViewModel>.reactive(
        viewModelBuilder: () => IndustriesViewModel(),
        onModelReady: (viewModel) => viewModel.fetchData(),
        builder: (context, viewModel, child) => Scaffold(
          appBar: const AppNavBar(
            title: '產業別',
            // backgroundColor: Colors.white,
          ),
          body: _buildBody(context, viewModel),
        ),
      );

  Widget _buildBody(BuildContext context, IndustriesViewModel viewModel) {
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

  Widget _buildListView(IndustriesViewModel viewModel) {
    final items = viewModel.viewState.data ?? List.empty();
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final industry = IndustryType.fromValue(item.key);
        return ListTile(
          onTap: () => _navigateCompanies(context, item.key),
          title: Text('${industry.name()} (${item.value.length})'),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 18.0,
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }

  void _navigateCompanies(BuildContext context, String id) =>
      context.pushNamed(CompaniesScreen.route, params: {'industryId': id});
}
