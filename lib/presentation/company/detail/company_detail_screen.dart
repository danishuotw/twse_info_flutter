import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:twse_info_flutter/app/base/view_state.dart';
import 'package:twse_info_flutter/app/widgets/app_divider.dart';
import 'package:twse_info_flutter/app/widgets/app_empty_screen.dart';
import 'package:twse_info_flutter/app/widgets/app_error_screen.dart';
import 'package:twse_info_flutter/app/widgets/app_loading_screen.dart';
import 'package:twse_info_flutter/presentation/company/detail/company_detail_view_model.dart';
import 'package:twse_info_flutter/presentation/company/detail/widgets/company_label_text.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyDetailScreen extends StatefulWidget {
  static const route = '/companyDetail/:companyId';

  final String companyId;

  const CompanyDetailScreen({
    Key? key,
    required this.companyId,
  }) : super(key: key);

  @override
  State<CompanyDetailScreen> createState() => _CompanyDetailScreenState();
}

class _CompanyDetailScreenState extends State<CompanyDetailScreen> {
  @override
  Widget build(BuildContext context) => ViewModelBuilder.reactive(
        viewModelBuilder: () => CompanyDetailViewModel(id: widget.companyId),
        onModelReady: (model) => model.fetchData(),
        builder: (context, model, child) => Scaffold(
          appBar: _buildAppBar(model),
          body: _buildBody(context, model),
        ),
      );

  AppBar _buildAppBar(CompanyDetailViewModel viewModel) => AppBar(
        title: Text('${viewModel.dto?.id ?? ''} ${viewModel.dto?.abbr ?? ''}'),
        actions: [
          IconButton(
            onPressed: () => viewModel.onPressFollowingButton(),
            icon: const Icon(Icons.star_border),
          )
        ],
      );

  Widget _buildBody(BuildContext context, CompanyDetailViewModel viewModel) {
    switch (viewModel.viewState.state) {
      case ResponseState.LOADING:
        return const AppLoadingScreen();
      case ResponseState.COMPLETE:
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                _buildTitleWidget(viewModel),
                _buildInfoWidget(viewModel),
                const AppDivider(),
                _buildContactWidget(viewModel),
                const AppDivider(),
                _buildICapitalWidget(viewModel),
              ],
            ),
          ),
        );
      case ResponseState.ERROR:
        return const AppErrorScreen();
      case ResponseState.EMPTY:
        return const AppEmptyScreen();
    }
  }

  Widget _buildTitleWidget(CompanyDetailViewModel viewModel) => Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('基本資料'),
            _buildLinkableText(viewModel),
          ],
        ),
      );

  Widget _buildLinkableText(CompanyDetailViewModel viewModel) => GestureDetector(
        onTap: () {
          if ((viewModel.dto?.url ?? '').isEmpty) return;
          final Uri url = Uri.parse(viewModel.dto?.url ?? '');
          _launchUrl(url);
        },
        child: Row(
          children: [
            Text(
              viewModel.dto?.name ?? '',
              style: const TextStyle(
                color: Colors.lightBlue,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 4.0),
            const Icon(Icons.link),
          ],
        ),
      );

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _buildInfoWidget(CompanyDetailViewModel viewModel) {
    final items = viewModel.basicInfo.entries.toList();
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.0,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        return CompanyLabelText(
          label: item.key,
          title: item.value,
        );
      },
    );
  }

  Widget _buildContactWidget(CompanyDetailViewModel viewModel) {
    final items = viewModel.contactInfo.entries.toList();
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.0,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        return CompanyLabelText(
          label: item.key,
          title: item.value,
        );
      },
    );
  }

  Widget _buildICapitalWidget(CompanyDetailViewModel viewModel) {
    final items = viewModel.capitalInfo.entries.toList();
    return ListView.separated(
      padding: const EdgeInsets.only(top: 30.0),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return CompanyLabelText(
          label: item.key,
          title: item.value,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 16.0,
      ),
    );
  }
}
