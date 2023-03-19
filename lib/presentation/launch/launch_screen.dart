import 'package:flutter/widgets.dart';
import 'package:twse_info_flutter/app/di/injector.dart';
import 'package:twse_info_flutter/presentation/launch/launch_view_model.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    LaunchViewModel viewModel = injector<LaunchViewModel>();
    viewModel.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
