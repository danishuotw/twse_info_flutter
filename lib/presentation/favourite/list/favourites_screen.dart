import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';
import 'package:twse_info_flutter/app/base/view_state.dart';
import 'package:twse_info_flutter/app/widgets/app_bar.dart';
import 'package:twse_info_flutter/app/widgets/app_dialog.dart';
import 'package:twse_info_flutter/app/widgets/app_divider.dart';
import 'package:twse_info_flutter/app/widgets/app_empty_screen.dart';
import 'package:twse_info_flutter/app/widgets/app_error_screen.dart';
import 'package:twse_info_flutter/app/widgets/app_loading_screen.dart';
import 'package:twse_info_flutter/presentation/company/detail/company_detail_screen.dart';
import 'package:twse_info_flutter/presentation/company/list/widgets/company_tile.dart';
import 'package:twse_info_flutter/presentation/favourite/list/favourites_view_model.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) => ViewModelBuilder.reactive(
        viewModelBuilder: () => FavouritesViewModel(),
        onModelReady: (model) {
          // model.fetchData();
          model.subscribeAllFavourite();
        },
        builder: (context, model, child) => Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(context, model),
        ),
      );

  AppNavBar _buildAppBar() => const AppNavBar(
        title: '追蹤',
      );

  Widget _buildBody(BuildContext context, FavouritesViewModel viewModel) {
    switch (viewModel.viewState.state) {
      case ResponseState.LOADING:
        return const AppLoadingScreen();
      case ResponseState.COMPLETE:
        return _buildListView(context, viewModel);
      case ResponseState.ERROR:
        return const AppErrorScreen();
      case ResponseState.EMPTY:
        return const AppEmptyScreen();
    }
  }

  Widget _buildListView(BuildContext context, FavouritesViewModel viewModel) {
    final items = viewModel.viewState.data ?? List.empty();
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Dismissible(
          confirmDismiss: (direction) async {
            final confirmed = await _confirmDismiss(direction, ' ${item.id}${item.name} ');
            if (confirmed) viewModel.removeFavourite(item.id);
          },
          background: Container(
            color: Colors.red,
            child: const Icon(Icons.cancel),
          ),
          key: ValueKey('$index'),
          child: CompanyListTile(
            onTap: () => _navigateDetail(context, item.id ?? ''),
            number: item.id ?? '',
            title: item.name ?? '',
          ),
        );
      },
      separatorBuilder: (context, index) => const AppDivider(),
    );
  }

  Future<bool> _confirmDismiss(DismissDirection dismissDirection, String message) async {
    switch (dismissDirection) {
      case DismissDirection.endToStart:
      case DismissDirection.startToEnd:
        return await AppDialog.show(
              context,
              title: '從追蹤列表移除',
              content: '是否將$message從移除追蹤列表移除？',
              confirmLabel: '移除',
            ) ==
            AppDialogResult.confirm;
      case DismissDirection.horizontal:
      case DismissDirection.vertical:
      case DismissDirection.up:
      case DismissDirection.down:
      case DismissDirection.none:
        return false;
    }
  }

  void _navigateDetail(BuildContext context, String id) {
    context.pushNamed(CompanyDetailScreen.route, params: {'companyId': id});
  }
}
