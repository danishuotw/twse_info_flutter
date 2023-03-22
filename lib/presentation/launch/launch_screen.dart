import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';
import 'package:twse_info_flutter/app/base/view_state.dart';
import 'package:twse_info_flutter/app/widgets/app_empty_screen.dart';
import 'package:twse_info_flutter/app/widgets/app_error_screen.dart';
import 'package:twse_info_flutter/app/widgets/app_loading_screen.dart';
import 'package:twse_info_flutter/presentation/home/home_screen.dart';
import 'package:twse_info_flutter/presentation/launch/launch_view_model.dart';
import 'package:twse_info_flutter/presentation/launch/strings/launch_strings.dart';

class LaunchScreen extends StatefulWidget {
  static const route = '/';

  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) => ViewModelBuilder<LaunchViewModel>.reactive(
        viewModelBuilder: () => LaunchViewModel(),
        onModelReady: (viewModel) {
          viewModel.fetchData();
        },
        builder: (context, viewModel, child) => Scaffold(
          body: _buildBody(context, viewModel),
        ),
      );

  Widget _buildBody(BuildContext context, LaunchViewModel viewModel) {
    switch (viewModel.viewState.state) {
      case ResponseState.LOADING:
        return const AppLoadingScreen();
      case ResponseState.COMPLETE:
        return Center(
          child: ElevatedButton(
            key: const Key(LaunchStrings.enterBtn),
            onPressed: () => _navigateHome(context),
            child: const Text('資料更新完成 請進入頁面'),
          ),
        );
      case ResponseState.ERROR:
        return const AppErrorScreen();
      case ResponseState.EMPTY:
        return const AppEmptyScreen();
    }
  }

  void _navigateHome(BuildContext context) => context.goNamed(HomeScreen.route);
}
