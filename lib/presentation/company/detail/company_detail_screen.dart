import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:twse_info_flutter/app/base/view_state.dart';
import 'package:twse_info_flutter/app/widgets/app_dialog.dart';
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
  static const double _expandedHeaderHeight = 150.0;

  @override
  Widget build(BuildContext context) => ViewModelBuilder.reactive(
        viewModelBuilder: () => CompanyDetailViewModel(id: widget.companyId),
        onModelReady: (model) {
          model.fetchData();
          model.getFavourite();
        },
        builder: (context, model, child) => Scaffold(
          body: _buildBody(context, model),
        ),
      );
  Widget _buildBody(BuildContext context, CompanyDetailViewModel viewModel) {
    switch (viewModel.viewState.state) {
      case ResponseState.LOADING:
        return const AppLoadingScreen();
      case ResponseState.COMPLETE:
        return _buildCustomScrollView(viewModel);
      case ResponseState.ERROR:
        return const AppErrorScreen();
      case ResponseState.EMPTY:
        return const AppEmptyScreen();
    }
  }

  Widget _buildCustomScrollView(CompanyDetailViewModel viewModel) {
    return CustomScrollView(
      slivers: [
        _buildTopBar(viewModel),
        _buildTitleWidget(viewModel),
        _buildInfoWidget(viewModel),
        _buildDivider(),
        _buildContactWidget(viewModel),
        _buildDivider(),
        _buildICapitalWidget(viewModel),
      ],
    );
  }

  Widget _buildDivider() {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: AppDivider(),
      ),
    );
  }

  Widget _buildTopBar(CompanyDetailViewModel viewModel) {
    final title = '${viewModel.dto?.id ?? ''} ${viewModel.dto?.abbr ?? ''}';
    return SliverAppBar(
      elevation: 0,
      pinned: true,
      centerTitle: false,
      backgroundColor: Colors.white,
      expandedHeight: _expandedHeaderHeight,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      titleSpacing: 0.0,
      title: Text(
        viewModel.dto?.industryText ?? '',
        style: const TextStyle(fontSize: 12.0, color: Colors.black),
      ),
      actions: [
        IconButton(
          onPressed: () async {
            final result = (viewModel.isFollowed.value)
                ? AppDialog.show(
                    context,
                    title: '從追蹤列表中移除',
                    content: '是否將$title從追蹤列表中移除',
                    confirmLabel: '移除',
                  )
                : AppDialog.show(
                    context,
                    title: '加入追蹤列表',
                    content: '是否將$title加入追蹤列表內',
                    confirmLabel: '加入',
                  );
            switch (await result) {
              case AppDialogResult.confirm:
                viewModel.onPressStarButton();
                break;
              case AppDialogResult.cancel:
              default:
                break;
            }
          },
          icon: ValueListenableBuilder(
            valueListenable: viewModel.isFollowed,
            builder: (context, value, child) {
              return value ? const Icon(Icons.star) : const Icon(Icons.star_border);
            },
          ),
        )
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: Colors.black,
          height: 1.0,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildTitleWidget(CompanyDetailViewModel viewModel) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('基本資料'),
              _buildLinkableText(viewModel),
            ],
          ),
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
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4.0),
            Icon(
              Icons.link,
              color: (viewModel.dto?.url ?? '').isEmpty ? Colors.grey : Colors.black,
            ),
          ],
        ),
      );

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      if (kDebugMode) print('Could not launch $url');
    }
  }

  Widget _buildInfoWidget(CompanyDetailViewModel viewModel) {
    final items = viewModel.basicInfo.entries.toList();
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverGrid.builder(
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
      ),
    );
  }

  Widget _buildContactWidget(CompanyDetailViewModel viewModel) {
    final items = viewModel.contactInfo.entries.toList();
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverGrid.builder(
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
      ),
    );
  }

  Widget _buildICapitalWidget(CompanyDetailViewModel viewModel) {
    final items = viewModel.capitalInfo.entries.toList();
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: items.length,
          (context, index) {
            final item = items[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CompanyLabelText(
                  label: item.key,
                  title: item.value,
                ),
                const SizedBox(
                  height: 16.0,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
